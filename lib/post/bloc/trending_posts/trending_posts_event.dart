part of 'trending_posts_bloc.dart';

@freezed
class TrendingPostsEvent with _$TrendingPostsEvent {
  const factory TrendingPostsEvent.get({List<Post>? previousPosts}) = _Get;
  const factory TrendingPostsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory TrendingPostsEvent.update({required List<Post> posts}) =
      _Update;
}
