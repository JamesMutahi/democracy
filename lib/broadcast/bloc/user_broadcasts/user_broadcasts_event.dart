part of 'user_broadcasts_bloc.dart';

@freezed
sealed class UserBroadcastsEvent with _$UserBroadcastsEvent {
  const factory UserBroadcastsEvent.get({
    required User user,
    List<Broadcast>? previousBroadcasts,
  }) = _Get;
  const factory UserBroadcastsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory UserBroadcastsEvent.add({required Broadcast broadcast}) = _Add;
  const factory UserBroadcastsEvent.update({required Broadcast broadcast}) =
      _Update;
  const factory UserBroadcastsEvent.remove({required int broadcastId}) =
      _Remove;
}
