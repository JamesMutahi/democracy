part of 'response_bloc.dart';

@freezed
class ResponseEvent with _$ResponseEvent {
  const factory ResponseEvent.started({required Survey survey}) = _Started;
  const factory ResponseEvent.textAnswerAdded({
    required Question question,
    required String answer,
  }) = _TextAnswerAdded;
  const factory ResponseEvent.singleChoiceAnswerAdded({
    required Question question,
    required Choice choice,
  }) = _SingleChoiceAnswerAdded;
  const factory ResponseEvent.multipleChoiceAnswerAdded({
    required Question question,
    required List<Choice> choices,
  }) = _MultipleChoiceAnswerAdded;
}
