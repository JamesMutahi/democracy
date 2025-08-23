import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';
part 'option.g.dart';

@freezed
sealed class Option with _$Option {
  const factory Option({
    required final int id,
    required int ballot,
    required String text,
    required int votes,
  }) = _Option;

  factory Option.fromJson(Map<String, Object?> json) => _$OptionFromJson(json);
}
