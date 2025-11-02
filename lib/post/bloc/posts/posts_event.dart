part of 'posts_bloc.dart';

@freezed
sealed class PostsEvent with _$PostsEvent {
  const factory PostsEvent.get({
    String? searchTerm,
    Post? lastPost,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Get;
  const factory PostsEvent.received({required Map<String, dynamic> payload}) =
      _Received;
  const factory PostsEvent.resubscribe({required List<Post> posts}) =
      _Resubscribe;
}
