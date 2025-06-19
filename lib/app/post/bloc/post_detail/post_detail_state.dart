part of 'post_detail_cubit.dart';

@freezed
class PostDetailState with _$PostDetailState {
  const factory PostDetailState.initial() = _Initial;
  const factory PostDetailState.loading() = PostDetailLoading;
  const factory PostDetailState.created({required Post post}) = PostCreated;
  const factory PostDetailState.updated({required Post post}) = PostUpdated;
  const factory PostDetailState.liked({required Post post}) = PostLiked;
  const factory PostDetailState.bookmarked({required Post post}) =
      PostBookmarked;
  const factory PostDetailState.deleted() = PostDeleted;
  const factory PostDetailState.reported() = PostReported;
  const factory PostDetailState.failure({required String error}) =
      PostDetailFailure;
}
