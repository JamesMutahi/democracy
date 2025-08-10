import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required final int id,
    required String username,
    required String name,
    required String email,
    required String image,
    @JsonKey(name: 'cover_photo') required String coverPhoto,
    required String status,
    required List<int> muted,
    required List<int> blocked,
    required int following,
    required int followers,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'date_joined') required DateTime dateJoined,
    @JsonKey(name: 'is_muted') required bool isMuted,
    @JsonKey(name: 'is_blocked') required bool isBlocked,
    @JsonKey(name: 'has_blocked') required bool hasBlocked,
    @JsonKey(name: 'is_followed') required bool isFollowed,
    @JsonKey(name: 'is_notifying') required bool isNotifying,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
