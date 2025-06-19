part of 'post_list_cubit.dart';

@freezed
class PostListState with _$PostListState {
  const factory PostListState.initial() = PostListInitial;
  const factory PostListState.loading() = PostListLoading;
  const factory PostListState.loaded({required List<Post> posts}) =
      PostListLoaded;
  const factory PostListState.failure({required String error}) =
      PostListFailure;
}
