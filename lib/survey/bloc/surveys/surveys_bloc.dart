import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/utils/transformers.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'surveys_bloc.freezed.dart';
part 'surveys_state.dart';
part 'surveys_event.dart';

const String stream = 'surveys';
const String requestId = 'surveys';
const String action = 'list';

class SurveysBloc extends Bloc<SurveysEvent, SurveysState> {
  SurveysBloc({required this.webSocketService}) : super(const SurveysState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    }, transformer: debounce());
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  Future _onGet(_Get event, Emitter<SurveysState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'previous_surveys': event.previousSurveys
            ?.map((survey) => survey.id)
            .toList(),
        'is_active': event.isActive,
        'sort_by': event.sortBy,
        'filter_by_region': event.filterByRegion,
        'start_date': event.startDate?.toIso8601String(),
        'end_date': event.endDate?.toIso8601String(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<SurveysState> emit) async {
    emit(state.copyWith(status: SurveysStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Survey> surveys = List.from(
        event.payload['data']['results'].map((e) => Survey.fromJson(e)),
      );
      List previousSurveys = event.payload['data']['previous_surveys'] ?? [];
      emit(
        state.copyWith(
          status: SurveysStatus.success,
          surveys: previousSurveys.isEmpty
              ? surveys
              : [...state.surveys, ...surveys],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: SurveysStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<SurveysState> emit) {
    final exists = state.surveys.any(
      (element) => element.id == event.survey.id,
    );

    if (!exists) {
      emit(
        state.copyWith(
          surveys: [event.survey, ...state.surveys],
          status: SurveysStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<SurveysState> emit) {
    final index = state.surveys.indexWhere(
      (element) => element.id == event.survey.id,
    );
    if (index == -1) return;

    final updatedSurveys = List<Survey>.from(state.surveys);
    updatedSurveys[index] = event.survey;

    emit(
      state.copyWith(surveys: updatedSurveys, status: SurveysStatus.success),
    );
  }

  void _onRemove(_Remove event, Emitter<SurveysState> emit) {
    final updatedSurveys = state.surveys
        .where((element) => element.id != event.surveyId)
        .toList();

    emit(
      state.copyWith(surveys: updatedSurveys, status: SurveysStatus.success),
    );
  }
  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
