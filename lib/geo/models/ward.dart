import 'package:freezed_annotation/freezed_annotation.dart';

part 'ward.freezed.dart';
part 'ward.g.dart';

@freezed
sealed class Ward with _$Ward {
  const factory Ward({required final int id, required String name}) = _Ward;

  factory Ward.fromJson(Map<String, Object?> json) => _$WardFromJson(json);
}
