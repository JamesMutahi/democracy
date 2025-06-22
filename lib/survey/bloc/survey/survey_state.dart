part of 'survey_bloc.dart';

enum SurveyStatus { initial, loading, success, failure }

const String surveyUrl = '/api/surveys/';

final class SurveyState extends Equatable {
  const SurveyState({
    this.status = SurveyStatus.initial,
    this.surveys = const <Survey>[],
    this.next = '/api/surveys/',
  });

  final SurveyStatus status;
  final List<Survey> surveys;
  final String? next;

  SurveyState copyWith({
    SurveyStatus? status,
    List<Survey>? surveys,
    String? next,
  }) {
    return SurveyState(
      status: status ?? this.status,
      surveys: surveys ?? this.surveys,
      next: next ?? this.next,
    );
  }

  @override
  String toString() {
    return '''SurveyState { status: $status, next: $next, surveys: ${surveys.length} }''';
  }

  @override
  List<Object> get props => [status, surveys];
}
