part of 'user_posts_bloc.dart';

@freezed
sealed class UserPostsEvent with _$UserPostsEvent {
  const factory UserPostsEvent.get({
    required User user,
    List<Post>? previousPosts,
  }) = _Get;
  const factory UserPostsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory UserPostsEvent.update({required List<Post> posts}) = _Update;
}
