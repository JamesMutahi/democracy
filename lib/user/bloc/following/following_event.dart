part of 'following_bloc.dart';

@freezed
sealed class FollowingEvent with _$FollowingEvent {
  const factory FollowingEvent.get({required User user, User? lastUser}) = _Get;
  const factory FollowingEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
