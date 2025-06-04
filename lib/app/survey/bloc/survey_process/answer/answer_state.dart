part of 'answer_bloc.dart';

enum AnswerStatus { initial, loading, loaded, validated, validationFailure }

final class AnswerState extends Equatable {
  const AnswerState({
    this.status = AnswerStatus.initial,
    this.survey,
    this.textAnswers,
    this.choiceAnswers,
    this.required,
  });

  final AnswerStatus status;
  final Survey? survey;
  final List<TextAnswer>? textAnswers;
  final List<ChoiceAnswer>? choiceAnswers;
  final List<Question>? required;

  AnswerState copyWith({
    AnswerStatus? status,
    Survey? survey,
    List<TextAnswer>? textAnswers,
    List<ChoiceAnswer>? choiceAnswers,
    List<Question>? required,
  }) {
    return AnswerState(
      status: status ?? this.status,
      survey: survey ?? this.survey,
      textAnswers: textAnswers ?? this.textAnswers,
      choiceAnswers: choiceAnswers ?? this.choiceAnswers,
      required: required ?? this.required,
    );
  }

  @override
  String toString() {
    return '''AnswerState { status: $status, required: ${required?.length} }''';
  }

  @override
  List<Object> get props => [status];
}
