import 'package:democracy/survey/models/question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_answer.freezed.dart';
part 'text_answer.g.dart';

@freezed
sealed class TextAnswer with _$TextAnswer {
  const factory TextAnswer({required Question question, required String text}) =
      _TextAnswer;

  factory TextAnswer.fromJson(Map<String, Object?> json) =>
      _$TextAnswerFromJson(json);
}
