import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
sealed class Response with _$Response {
  const factory Response({
    required int id,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @JsonKey(name: 'choice_answers') required List<ChoiceAnswer> choiceAnswers,
    @JsonKey(name: 'text_answers') required List<TextAnswer> textAnswers,
  }) = _Response;

  factory Response.fromJson(Map<String, Object?> json) =>
      _$ResponseFromJson(json);
}
