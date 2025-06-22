import 'package:democracy/survey/models/choice.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'choice_answer.freezed.dart';
part 'choice_answer.g.dart';

@freezed
sealed class ChoiceAnswer with _$ChoiceAnswer {
  const factory ChoiceAnswer({
    required Question question,
    required Choice choice,
  }) = _ChoiceAnswer;

  factory ChoiceAnswer.fromJson(Map<String, Object?> json) =>
      _$ChoiceAnswerFromJson(json);
}
