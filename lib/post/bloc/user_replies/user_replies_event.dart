part of 'user_replies_bloc.dart';

@freezed
sealed class UserRepliesEvent with _$UserRepliesEvent {
  const factory UserRepliesEvent.get({
    required User user,
    List<Post>? previousPosts,
  }) = _Get;
  const factory UserRepliesEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
