import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_user.freezed.dart';
part 'simple_user.g.dart';

@freezed
sealed class SimpleUser with _$SimpleUser {
  const factory SimpleUser({
    required final int id,
    required String username,
    required String name,
    required String image,
  }) = _SimpleUser;

  factory SimpleUser.fromJson(Map<String, Object?> json) =>
      _$SimpleUserFromJson(json);
}
