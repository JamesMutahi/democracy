part of 'followers_bloc.dart';

@freezed
sealed class FollowersEvent with _$FollowersEvent {
  const factory FollowersEvent.get({required int userId, User? lastUser}) =
      _Get;
  const factory FollowersEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory FollowersEvent.update({required List<User> users}) = _Update;
}
