import 'package:democracy/auth/models/user.dart';
import 'package:democracy/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
sealed class Profile with _$Profile {
  const factory Profile({
    required final int id,
    required List<Post> posts,
    required List<Post> replies,
    @JsonKey(name: 'liked_posts') required List<Post> likedPosts,
    required List<User> following,
    required List<User> followers,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) =>
      _$ProfileFromJson(json);
}
