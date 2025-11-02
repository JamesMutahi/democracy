part of 'survey_filter_cubit.dart';

@freezed
sealed class SurveyFilterState with _$SurveyFilterState {
  const factory SurveyFilterState.changed({
    required String searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _Changed;
}
