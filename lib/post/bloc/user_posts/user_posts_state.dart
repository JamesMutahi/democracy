part of 'user_posts_cubit.dart';

@freezed
class UserPostsState with _$UserPostsState {
  const factory UserPostsState.initial() = UserPostsInitial;
  const factory UserPostsState.loading() = UserPostsLoading;
  const factory UserPostsState.loaded({required List<Post> posts}) = UserPostsLoaded;
  const factory UserPostsState.failure() = UserPostsFailure;
}
