part of 'survey_detail_bloc.dart';

@freezed
class SurveyDetailState with _$SurveyDetailState {
  const factory SurveyDetailState.initial() = SurveyDetailInitial;

  const factory SurveyDetailState.loading() = SurveyDetailLoading;

  const factory SurveyDetailState.created({required Survey survey}) =
      SurveyCreated;

  const factory SurveyDetailState.updated({required Survey survey}) =
      SurveyUpdated;

  const factory SurveyDetailState.deleted({required int surveyId}) =
      SurveyDeleted;

  const factory SurveyDetailState.failure({required String error}) =
      SurveyDetailFailure;
}
