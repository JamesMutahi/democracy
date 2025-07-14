import 'package:bloc/bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_detail_state.dart';
part 'survey_detail_cubit.freezed.dart';

class SurveyDetailCubit extends Cubit<SurveyDetailState> {
  SurveyDetailCubit() : super(const SurveyDetailState.initial());

  void created({required Map<String, dynamic> payload}) {
    emit(SurveyDetailLoading());
    if (payload['response_status'] == 201) {
      Survey survey = Survey.fromJson(payload['data']);
      emit(SurveyCreated(survey: survey));
    } else {
      emit(SurveyDetailFailure(error: payload['errors'][0]));
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(SurveyDetailLoading());
    if (payload['response_status'] == 200) {
      final Survey survey = Survey.fromJson(payload['data']);
      emit(SurveyUpdated(survey: survey));
    } else {
      emit(SurveyDetailFailure(error: payload['errors'][0]));
    }
  }

  void deleted({required Map<String, dynamic> payload}) {
    emit(SurveyDetailLoading());
    if (payload['response_status'] == 204) {
      emit(SurveyDeleted(surveyId: payload['pk']));
    } else {
      emit(SurveyDetailFailure(error: payload['errors'][0]));
    }
  }
}
