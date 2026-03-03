part of 'replies_bloc.dart';

@freezed
sealed class RepliesEvent with _$RepliesEvent {
  const factory RepliesEvent.get({
    required Post post,
    List<Post>? previousPosts,
  }) = _Get;
  const factory RepliesEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
