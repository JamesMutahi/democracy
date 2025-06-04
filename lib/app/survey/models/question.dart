import 'package:democracy/app/survey/models/choice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

enum QuestionType { number, text, singleChoice, multipleChoice }

@freezed
sealed class Question with _$Question {
  const factory Question({
    required final int id,
    required int survey,
    required int page,
    required int number,
    @QuestionTypeConverter() required QuestionType type,
    required String text,
    required String? hint,
    @JsonKey(name: 'is_required') required bool isRequired,
    required int? dependency,
    required List<Choice> choices,
  }) = _Question;

  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);
}

class QuestionTypeConverter implements JsonConverter<QuestionType, String> {
  const QuestionTypeConverter();

  @override
  QuestionType fromJson(String data) {
    QuestionType type = QuestionType.text;
    switch (data) {
      case 'Number':
        type = QuestionType.number;
        break;
      case 'Single Choice':
        type = QuestionType.singleChoice;
        break;
      case 'Multiple Choice':
        type = QuestionType.multipleChoice;
        break;
    }
    return type;
  }

  @override
  String toJson(QuestionType object) {
    throw UnimplementedError();
  }
}
