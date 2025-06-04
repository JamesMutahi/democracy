part of 'answer_bloc.dart';

enum AnswerStatus { initial, loading, loaded }

final class AnswerState extends Equatable {
  const AnswerState({
    this.status = AnswerStatus.initial,
    this.survey,
    this.textAnswers,
    this.choiceAnswers,
  });

  final AnswerStatus status;
  final Survey? survey;
  final List<TextAnswer>? textAnswers;
  final List<ChoiceAnswer>? choiceAnswers;

  AnswerState copyWith({
    AnswerStatus? status,
    Survey? survey,
    List<TextAnswer>? textAnswers,
    List<ChoiceAnswer>? choiceAnswers,
  }) {
    return AnswerState(
      status: status ?? this.status,
      survey: survey ?? this.survey,
      textAnswers: textAnswers ?? this.textAnswers,
      choiceAnswers: choiceAnswers ?? this.choiceAnswers,
    );
  }

  @override
  String toString() {
    return '''AnswerState { status: $status, text answers: ${textAnswers?.length} }''';
  }

  @override
  List<Object> get props => [status];
}
