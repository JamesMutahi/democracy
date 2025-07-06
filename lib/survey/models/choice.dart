import 'package:freezed_annotation/freezed_annotation.dart';

part 'choice.freezed.dart';
part 'choice.g.dart';

@freezed
sealed class Choice with _$Choice {
  const factory Choice({
    required final int id,
    required final int number,
    required int question,
    required String text,
  }) = _Choice;

  factory Choice.fromJson(Map<String, Object?> json) => _$ChoiceFromJson(json);
}
