part of 'survey_detail_bloc.dart';

@freezed
sealed class SurveyDetailEvent with _$SurveyDetailEvent {
  const factory SurveyDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;

  const factory SurveyDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;

  const factory SurveyDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;
}
