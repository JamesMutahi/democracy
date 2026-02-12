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
    webSocketService.messages.listen((message) {
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
  }

  Future _onGet(_Get event, Emitter<SurveysState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'last_survey': event.lastSurvey?.id,
        'is_active': event.isActive,
        'sort_by': event.sortBy,
        'filter_by_region': event.filterByRegion ?? true,
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
      int? lastSurvey = event.payload['data']['last_survey'];
      emit(
        state.copyWith(
          status: SurveysStatus.success,
          surveys: lastSurvey == null
              ? surveys
              : [...state.surveys, ...surveys],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: SurveysStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
