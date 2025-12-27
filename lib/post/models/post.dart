import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/models/user.dart';
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
    @JsonKey(name: 'image1') required String? image1Url,
    @JsonKey(name: 'image2') required String? image2Url,
    @JsonKey(name: 'image3') required String? image3Url,
    @JsonKey(name: 'image4') required String? image4Url,
    @JsonKey(name: 'image5') required String? image5Url,
    @JsonKey(name: 'image6') required String? image6Url,
    @JsonKey(name: 'video1') required String? video1Url,
    @JsonKey(name: 'video2') required String? video2Url,
    @JsonKey(name: 'video3') required String? video3Url,
    required int likes,
    @JsonKey(name: 'is_liked') required bool isLiked,
    required int bookmarks,
    @JsonKey(name: 'is_bookmarked') required bool isBookmarked,
    required int views,
    required int replies,
    required int reposts,
    @JsonKey(name: 'is_reposted') required bool isReposted,
    @JsonKey(name: 'is_quoted') required bool isQuoted,
    @JsonKey(name: 'is_deleted') required bool isDeleted,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
    @JsonKey(name: 'reply_to') required Post? replyTo,
    @JsonKey(name: 'repost_of') required Post? repostOf,
    @JsonKey(name: 'community_note_of') required Post? communityNoteOf,
    required Ballot? ballot,
    required Survey? survey,
    required Petition? petition,
    required Meeting? meeting,
    @JsonKey(name: 'tagged_users') required List<User> taggedUsers,
    @JsonKey(name: 'tagged_sections') required List<Section> taggedSections,
    @JsonKey(name: 'is_upvoted') required bool isUpvoted,
    @JsonKey(name: 'is_downvoted') required bool isDownvoted,
    required int upvotes,
    required int downvotes,
    @JsonKey(defaultValue: []) required List<Post> thread,
    @JsonKey(name: 'community_note') required String communityNote,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}

class PostStatusConverter implements JsonConverter<PostStatus, String> {
  const PostStatusConverter();

  @override
  PostStatus fromJson(String data) {
    late PostStatus type;
    switch (data) {
      case 'published':
        type = PostStatus.published;
      case 'draft':
        type = PostStatus.draft;
    }
    return type;
  }

  @override
  String toJson(PostStatus object) {
    switch (object) {
      case PostStatus.published:
        return 'published';
      case PostStatus.draft:
        return 'draft';
    }
  }
}
