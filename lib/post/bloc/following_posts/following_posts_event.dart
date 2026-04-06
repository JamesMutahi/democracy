part of 'following_posts_bloc.dart';

@freezed
sealed class FollowingPostsEvent with _$FollowingPostsEvent {
  const factory FollowingPostsEvent.initialize() = _Initialize;
  const factory FollowingPostsEvent.get({List<Post>? previousPosts}) = _Get;
  const factory FollowingPostsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory FollowingPostsEvent.update({required List<Post> posts}) =
      _Update;
}
