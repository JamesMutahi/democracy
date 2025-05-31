part of 'response_bloc.dart';

enum ResponseStatus { initial, loading, loaded }

final class ResponseState extends Equatable {
  const ResponseState({
    this.status = ResponseStatus.initial,
    this.survey,
    this.textAnswers,
    this.choiceAnswers,
  });

  final ResponseStatus status;
  final Survey? survey;
  final List<TextAnswer>? textAnswers;
  final List<ChoiceAnswer>? choiceAnswers;

  ResponseState copyWith({
    ResponseStatus? status,
    Survey? survey,
    List<TextAnswer>? textAnswers,
    List<ChoiceAnswer>? choiceAnswers,
  }) {
    return ResponseState(
      status: status ?? this.status,
      survey: survey ?? this.survey,
      textAnswers: textAnswers ?? this.textAnswers,
      choiceAnswers: choiceAnswers ?? this.choiceAnswers,
    );
  }

  @override
  String toString() {
    return '''ResponseState { status: $status, response: $survey }''';
  }

  @override
  List<Object> get props => [status];
}
