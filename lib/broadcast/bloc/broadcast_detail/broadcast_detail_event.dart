part of 'broadcast_detail_bloc.dart';

@freezed
sealed class BroadcastDetailEvent with _$BroadcastDetailEvent {
  const factory BroadcastDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;
  const factory BroadcastDetailEvent.loaded({
    required Map<String, dynamic> payload,
  }) = _Loaded;
  const factory BroadcastDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;
  const factory BroadcastDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;
  const factory BroadcastDetailEvent.create({
    required BroadcastType type,
    required String title,
    required String description,
    DateTime? startTime,
  }) = _Create;
  const factory BroadcastDetailEvent.join({
    required RtcEngine engine,
    required Broadcast broadcast,
    required User user,
  }) = _Join;
  const factory BroadcastDetailEvent.retrieve({required Broadcast broadcast}) =
      _Retrieve;
  const factory BroadcastDetailEvent.subscribe({
    required Broadcast broadcast,
    required bool isMuted,
  }) = _Subscribe;
  const factory BroadcastDetailEvent.unsubscribe({
    required Broadcast broadcast,
  }) = _Unsubscribe;
  const factory BroadcastDetailEvent.startRecording({
    required Broadcast broadcast,
  }) = _StartRecording;
  const factory BroadcastDetailEvent.stopRecording({
    required Broadcast broadcast,
  }) = _StopRecording;
  const factory BroadcastDetailEvent.inviteToSpeak({
    required Broadcast broadcast,
    required User user,
  }) = _InviteToSpeak;
  const factory BroadcastDetailEvent.inviteToSpeakCompleted({
    required Map<String, dynamic> payload,
  }) = _InviteToSpeakCompleted;
    const factory BroadcastDetailEvent.inviteToCoHost({
    required Broadcast broadcast,
    required User user,
  }) = _InviteToCoHost;
    const factory BroadcastDetailEvent.cancelInvite({
    required SpeakerInvite invite,
  }) = _CancelInvite;
  const factory BroadcastDetailEvent.respondToInvite({
    required SpeakerInvite invite,
    required bool isAccepted,
  }) = _RespondToInvite;
  const factory BroadcastDetailEvent.respondToInviteCompleted({
    required Map<String, dynamic> payload,
  }) = _RespondToInviteCompleted;
}
