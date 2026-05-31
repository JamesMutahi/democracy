part of 'survey_bloc.dart';

enum SurveyStatus { initial, loading, success, failure }

final class SurveyState extends Equatable {
  const SurveyState({
    this.status = SurveyStatus.initial,
    this.survey,
    this.surveyId,
  });

  final SurveyStatus status;
  final Survey? survey;
  final int? surveyId;

  SurveyState copyWith({SurveyStatus? status, Survey? survey, int? surveyId}) {
    return SurveyState(
      status: status ?? this.status,
      survey: survey ?? this.survey,
      surveyId: surveyId ?? this.surveyId,
    );
  }

  @override
  String toString() {
    return '''SurveyState { status: $status, survey: $survey, surveyId: $surveyId }''';
  }

  @override
  List<Object?> get props => [status, survey, surveyId];
}
