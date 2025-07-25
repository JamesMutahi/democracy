import 'package:democracy/user/models/user.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

enum PostStatus { draft, published }

@freezed
sealed class Post with _$Post {
  const factory Post({
    required final int id,
    required final User author,
    @PostStatusConverter() required PostStatus status,
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
    @JsonKey(name: 'is_liked') required bool isLiked,
    required int bookmarks,
    @JsonKey(name: 'is_bookmarked') required bool isBookmarked,
    required int views,
    required int replies,
    required int reposts,
    @JsonKey(name: 'is_edited') required bool isEdited,
    @JsonKey(name: 'is_deleted') required bool isDeleted,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
    @JsonKey(name: 'reply_to') required Post? replyTo,
    @JsonKey(name: 'repost_of') required Post? repostOf,
    required Poll? poll,
    required Survey? survey,
    @JsonKey(name: 'tagged_users') required List<User> taggedUsers,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}

class PostStatusConverter implements JsonConverter<PostStatus, String> {
  const PostStatusConverter();

  @override
  PostStatus fromJson(String data) {
    PostStatus type = PostStatus.draft;
    switch (data) {
      case 'published':
        type = PostStatus.published;
        break;
    }
    return type;
  }

  @override
  String toJson(PostStatus object) {
    throw UnimplementedError();
  }
}
