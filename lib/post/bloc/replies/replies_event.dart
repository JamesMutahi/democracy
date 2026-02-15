part of 'replies_bloc.dart';

@freezed
sealed class RepliesEvent with _$RepliesEvent {
  const factory RepliesEvent.get({required Post post, List<Post>? lastPosts}) =
      _Get;
  const factory RepliesEvent.received({required Map<String, dynamic> payload}) =
      _Received;
  const factory RepliesEvent.resubscribe({
    required Post post,
    required List<Post> replies,
  }) = _Resubscribe;
  const factory RepliesEvent.unsubscribe({
    required Post post,
    required List<Post> replies,
  }) = _Unsubscribe;
}
