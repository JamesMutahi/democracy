import 'package:democracy/survey/models/question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

@freezed
sealed class Survey with _$Survey {
  const factory Survey({
    required final int id,
    required String name,
    required String description,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    required List<Question> questions,
  }) = _Survey;

  factory Survey.fromJson(Map<String, Object?> json) => _$SurveyFromJson(json);
}
