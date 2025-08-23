part of 'survey_bottom_navigation_bloc.dart';

@freezed
sealed class SurveyBottomNavigationEvent with _$SurveyBottomNavigationEvent {
  const factory SurveyBottomNavigationEvent.started({required Survey survey}) =
      _Started;

  const factory SurveyBottomNavigationEvent.loadNextPage({
    required Survey survey,
  }) = _LoadNextPage;

  const factory SurveyBottomNavigationEvent.loadPrevPage({
    required Survey survey,
  }) = _LoadPrevPage;

  const factory SurveyBottomNavigationEvent.returnToSurvey() = _ReturnToSurvey;
}
