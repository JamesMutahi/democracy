import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

@freezed
sealed class Survey with _$Survey {
  const factory Survey({
    required final int id,
    required String name,
    required String description,
    @JsonKey(name: 'is_poll') required bool isPoll,
    required DateTime start,
    required DateTime end,
    required List options,
  }) = _Survey;

  factory Survey.fromJson(Map<String, Object?> json) => _$SurveyFromJson(json);
}
