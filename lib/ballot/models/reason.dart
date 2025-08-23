import 'package:freezed_annotation/freezed_annotation.dart';

part 'reason.freezed.dart';
part 'reason.g.dart';

@freezed
sealed class Reason with _$Reason {
  const factory Reason({required String text}) = _Reason;

  factory Reason.fromJson(Map<String, Object?> json) => _$ReasonFromJson(json);
}
