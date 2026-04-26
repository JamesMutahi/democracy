part of 'post_detail_bloc.dart';

@freezed
class PostDetailState with _$PostDetailState {
  const factory PostDetailState.initial() = _Initial;

  const factory PostDetailState.loading() = PostDetailLoading;

  const factory PostDetailState.loaded({required Post post}) = PostLoaded;

  const factory PostDetailState.updated({
    required int postId,
    required String body,
    required int likes,
    required bool isLiked,
    required int bookmarks,
    required bool isBookmarked,
    required int views,
    required int replies,
    required int reposts,
    required String communityNote,
    required bool isUpvoted,
    required bool isDownvoted,
    required int upvotes,
    required int downvotes,
    required bool isReposted,
    required bool isQuoted,
    required bool isDeleted,
    required bool isActive,
  }) = PostUpdated;

  const factory PostDetailState.liked({
    required int postId,
    required bool isLiked,
    required int likes,
  }) = PostLiked;

  const factory PostDetailState.bookmarked({
    required int postId,
    required bool isBookmarked,
    required int bookmarks,
  }) = PostBookmarked;

  const factory PostDetailState.upvoted({
    required int postId,
    required bool isUpvoted,
    required int upvotes,
  }) = PostUpvoted;

  const factory PostDetailState.downvoted({
    required int postId,
    required bool isDownvoted,
    required int downvotes,
  }) = PostDownvoted;

  const factory PostDetailState.viewed({required int postId}) = PostViewed;

  const factory PostDetailState.clicked({required int postId}) = PostClicked;

  const factory PostDetailState.muted({
    required int postId,
    required bool isMuted,
  }) = PostMuted;

  const factory PostDetailState.deleted({required int postId}) = PostDeleted;

  const factory PostDetailState.repostDeleted({
    required int postId,
    required int repostId,
    required int reposts,
  }) = RepostDeleted;

  const factory PostDetailState.reported() = PostReported;

  const factory PostDetailState.failure({required String error}) =
      PostDetailFailure;
}
