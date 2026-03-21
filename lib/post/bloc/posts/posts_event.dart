part of 'posts_bloc.dart';

@freezed
sealed class PostsEvent with _$PostsEvent {
  const factory PostsEvent.get({
    String? sortBy,
    String? searchTerm,
    List<Post>? previousPosts,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Get;
  const factory PostsEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
