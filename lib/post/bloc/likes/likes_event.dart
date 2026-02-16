part of 'likes_bloc.dart';

@freezed
sealed class LikesEvent with _$LikesEvent {
  const factory LikesEvent.get({
    required User user,
    List<Post>? previousPosts,
  }) = _Get;
  const factory LikesEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
