part of 'surveys_bloc.dart';

@freezed
sealed class SurveysEvent with _$SurveysEvent {
  const factory SurveysEvent.get({
    String? searchTerm,
    Survey? lastSurvey,
    String? status,
    String? sortBy,
    bool? filterByRegion,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Get;
  const factory SurveysEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
