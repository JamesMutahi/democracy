part of 'followers_bloc.dart';

@freezed
sealed class FollowersEvent with _$FollowersEvent {
  const factory FollowersEvent.get({required User user, User? lastUser}) = _Get;
  const factory FollowersEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
