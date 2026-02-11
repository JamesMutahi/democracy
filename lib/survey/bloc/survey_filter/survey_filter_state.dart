part of 'survey_filter_cubit.dart';

@freezed
sealed class SurveyFilterState with _$SurveyFilterState {
  const factory SurveyFilterState.changed({
    required String searchTerm,
    required String status,
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _Changed;
}
