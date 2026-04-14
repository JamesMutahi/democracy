part of 'replies_bloc.dart';

@freezed
sealed class RepliesEvent with _$RepliesEvent {
  const factory RepliesEvent.get({
    required Post post,
    List<Post>? previousPosts,
  }) = _Get;
  const factory RepliesEvent.received({required Map<String, dynamic> payload}) =
      _Received;
  const factory RepliesEvent.add({required int postId, required Post reply}) =
      _Add;
  const factory RepliesEvent.update({
    required int postId,
    required List<Post> replies,
  }) = _Update;
}
