part of 'post_detail_cubit.dart';

@freezed
class PostDetailState with _$PostDetailState {
  const factory PostDetailState.initial() = _Initial;

  const factory PostDetailState.loading() = PostDetailLoading;

  const factory PostDetailState.created({required Post post}) = PostCreated;

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
    required bool isReposted,
    required bool isQuoted,
    required bool isDeleted,
    required bool isActive,
  }) = PostUpdated;

  const factory PostDetailState.deleted({required int postId}) = PostDeleted;

  const factory PostDetailState.reported() = PostReported;

  const factory PostDetailState.failure({required String error}) =
      PostDetailFailure;
}
