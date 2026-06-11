part of 'broadcast_bloc.dart';

@freezed
class BroadcastEvent with _$BroadcastEvent {
  const factory BroadcastEvent.load({required int broadcastId}) = _Load;
  const factory BroadcastEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory BroadcastEvent.updated({required Broadcast broadcast}) = _Updated;
}
