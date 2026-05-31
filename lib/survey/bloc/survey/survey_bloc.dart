import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_event.dart';
part 'survey_state.dart';
part 'survey_bloc.freezed.dart';

const String stream = 'surveys';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  SurveyBloc({required this.webSocketService}) : super(const SurveyState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
        }
      }
    });
    on<_Load>((event, emit) => _onLoad(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
  }

  void _onLoad(_Load event, Emitter<SurveyState> emit) async {
    emit(
      state.copyWith(status: SurveyStatus.loading, surveyId: event.surveyId),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: SurveyStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.surveyId,
        'pk': event.surveyId,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<SurveyState> emit) async {
    emit(state.copyWith(status: SurveyStatus.loading));
    if (event.payload['response_status'] == 200) {
      final survey = Survey.fromJson(event.payload['data']);
      emit(
        state.copyWith(
          status: SurveyStatus.success,
          survey: survey,
          surveyId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: SurveyStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<SurveyState> emit) async {
    emit(state.copyWith(status: SurveyStatus.loading));
    emit(
      state.copyWith(
        status: SurveyStatus.success,
        survey: event.survey,
        surveyId: event.survey.id,
      ),
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
