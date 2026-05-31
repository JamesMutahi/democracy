part of 'survey_bloc.dart';

@freezed
class SurveyEvent with _$SurveyEvent {
  const factory SurveyEvent.load({required int surveyId}) = _Load;
  const factory SurveyEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory SurveyEvent.updated({required Survey survey}) = _Updated;
}
