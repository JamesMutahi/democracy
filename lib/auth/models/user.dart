import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required final int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    required String image,
    required String status,
    required int following,
    required int followers,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_staff') required bool isStaff,
    @JsonKey(name: 'date_joined') required DateTime dateJoined,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
