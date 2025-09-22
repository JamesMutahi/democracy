part of 'user_posts_bloc.dart';

@freezed
sealed class UserPostsEvent with _$UserPostsEvent {
  const factory UserPostsEvent.get({required User user, Post? lastPost}) = _Get;
  const factory UserPostsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory UserPostsEvent.unsubscribe({
    required User user,
    required List<Post> posts,
  }) = _Unsubscribe;
  const factory UserPostsEvent.resubscribe({
    required User user,
    required List<Post> posts,
  }) = _Resubscribe;
}
