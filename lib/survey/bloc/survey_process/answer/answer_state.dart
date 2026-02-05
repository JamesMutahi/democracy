part of 'answer_bloc.dart';

enum AnswerStatus {
  initial,
  loading,
  loaded,
  validated,
  validationFailure,
  submitted,
  submissionFailure,
}

final class AnswerState extends Equatable {
  const AnswerState({
    this.status = AnswerStatus.initial,
    this.survey,
    this.startTime,
    this.endTime,
    this.textAnswers,
    this.choiceAnswers,
    this.required,
    this.submissionError = '',
  });

  final AnswerStatus status;
  final Survey? survey;
  final DateTime? startTime;
  final DateTime? endTime;
  final List<TextAnswer>? textAnswers;
  final List<ChoiceAnswer>? choiceAnswers;
  final List<Question>? required;
  final String submissionError;

  AnswerState copyWith({
    AnswerStatus? status,
    Survey? survey,
    DateTime? startTime,
    DateTime? endTime,
    List<TextAnswer>? textAnswers,
    List<ChoiceAnswer>? choiceAnswers,
    List<Question>? required,
    String? submissionError,
  }) {
    return AnswerState(
      status: status ?? this.status,
      survey: survey ?? this.survey,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      textAnswers: textAnswers ?? this.textAnswers,
      choiceAnswers: choiceAnswers ?? this.choiceAnswers,
      required: required ?? this.required,
      submissionError: submissionError ?? this.submissionError,
    );
  }

  @override
  String toString() {
    return '''AnswerState { status: $status, required: ${required?.length} }''';
  }

  @override
  List<Object> get props => [
    status,
    ?survey,
    ?startTime,
    ?endTime,
    ?textAnswers,
    ?choiceAnswers,
    ?required,
    submissionError,
  ];
}
