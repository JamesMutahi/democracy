part of 'survey_bloc.dart';

@freezed
class SurveyEvent with _$SurveyEvent {
  const factory SurveyEvent.initialize() = _Initialize;
  const factory SurveyEvent.getSurveys() = GetSurveys;
  const factory SurveyEvent.filter({
    required String? searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _Filter;
  const factory SurveyEvent.reload() = _Reload;
}
