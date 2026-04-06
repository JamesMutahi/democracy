part of 'recent_posts_bloc.dart';

@freezed
sealed class RecentPostsEvent with _$RecentPostsEvent {
  const factory RecentPostsEvent.get({
    String? searchTerm,
    List<Post>? previousPosts,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Get;
  const factory RecentPostsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory RecentPostsEvent.update({required List<Post> posts}) = _Update;
}
