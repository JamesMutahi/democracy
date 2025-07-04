part of 'answer_bloc.dart';

@freezed
class AnswerEvent with _$AnswerEvent {
  const factory AnswerEvent.started({required Survey survey}) = _Started;
  const factory AnswerEvent.textAnswerAdded({
    required Question question,
    required String text,
  }) = _TextAnswerAdded;
  const factory AnswerEvent.singleChoiceAnswerAdded({
    required Question question,
    required Choice choice,
  }) = _SingleChoiceAnswerAdded;
  const factory AnswerEvent.multipleChoiceAnswerAdded({
    required Question question,
    required List<Choice> choices,
  }) = _MultipleChoiceAnswerAdded;
  const factory AnswerEvent.validate({required List<Question> questions}) =
      _Validate;
  const factory AnswerEvent.submitted({required Map<String, dynamic> payload}) =
      _Submitted;
}
