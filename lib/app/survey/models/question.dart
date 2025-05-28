import 'package:democracy/app/survey/models/choice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
sealed class Question with _$Question {
  const factory Question({
    required final int id,
    required int survey,
    required int page,
    required int number,
    required String text,
    required Choice? dependency,
    required List<Choice> choices,
  }) = _Question;

  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);
}
