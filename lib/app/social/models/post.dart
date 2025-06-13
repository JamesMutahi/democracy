import 'package:democracy/app/auth/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
sealed class Post with _$Post {
  const factory Post({
    required final int id,
    required final User author,
    required String body,
    required String? image1Url,
    required String? image2Url,
    required String? image3Url,
    required String? image4Url,
    required String? image5Url,
    required String? image6Url,
    required String? video1Url,
    required String? video2Url,
    required String? video3Url,
    required int likes,
    required int views,
    required int replies,
    required int reposts,
    @JsonKey(name: 'is_edited') required bool isEdited,
    @JsonKey(name: 'is_deleted') required bool isDeleted,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'reply_to') required Post? replyTo,
    @JsonKey(name: 'repost_of') required Post? repostOf,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}
