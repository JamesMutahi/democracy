import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_detail_bloc.freezed.dart';
part 'survey_detail_state.dart';
part 'survey_detail_event.dart';

const String stream = 'surveys';
const String requestId = 'surveys';

class SurveyDetailBloc extends Bloc<SurveyDetailEvent, SurveyDetailState> {
  SurveyDetailBloc({required this.webSocketService})
    : super(const SurveyDetailState.initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            if (message['payload']['request_id'] == requestId) {
              add(_Created(payload: message['payload']));
            }
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) {
      _onCreated(event, emit);
    });
    on<_Updated>((event, emit) {
      _onUpdated(event, emit);
    });
    on<_Deleted>((event, emit) {
      _onDeleted(event, emit);
    });
  }

  Future _onCreated(_Created event, Emitter<SurveyDetailState> emit) async {
    emit(SurveyDetailLoading());
    if (event.payload['response_status'] == 201) {
      Survey survey = Survey.fromJson(event.payload['data']);
      emit(SurveyCreated(survey: survey));
    } else {
      emit(SurveyDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onUpdated(_Updated event, Emitter<SurveyDetailState> emit) async {
    emit(SurveyDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Survey survey = Survey.fromJson(event.payload['data']);
      emit(SurveyUpdated(survey: survey));
    } else {
      emit(SurveyDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<SurveyDetailState> emit) async {
    emit(SurveyDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(SurveyDeleted(surveyId: event.payload['pk']));
    } else {
      emit(SurveyDetailFailure(error: event.payload['errors'][0]));
    }
  }

  final WebSocketService webSocketService;
}
