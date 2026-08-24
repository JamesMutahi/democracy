part of 'speaker_detail_bloc.dart';

@freezed
sealed class SpeakerDetailEvent with _$SpeakerDetailEvent {
  const factory SpeakerDetailEvent.requestCreated({
    required Map<String, dynamic> payload,
  }) = _RequestCreated;
  const factory SpeakerDetailEvent.requestLoaded({
    required Map<String, dynamic> payload,
  }) = _RequestLoaded;
  const factory SpeakerDetailEvent.requestUpdated({
    required Map<String, dynamic> payload,
  }) = _RequestUpdated;
  const factory SpeakerDetailEvent.requestDeleted({
    required Map<String, dynamic> payload,
  }) = _RequestDeleted;
  const factory SpeakerDetailEvent.requestToSpeak({
    required Broadcast broadcast,
  }) = RequestToSpeak;

  const factory SpeakerDetailEvent.requestToSpeakCompleted({
    required Map<String, dynamic> payload,
  }) = _RequestToSpeakCompleted;

  const factory SpeakerDetailEvent.handleSpeakerRequest({
    required SpeakerRequest request,
    required bool isApproved,
  }) = HandleSpeakerRequest;

  const factory SpeakerDetailEvent.speakerRequestReceived({
    required Map<String, dynamic> payload,
  }) = SpeakerRequestReceived;

  const factory SpeakerDetailEvent.toggleMute({
    required Broadcast broadcast,
    required bool isMuted,
  }) = _ToggleMute;

  const factory SpeakerDetailEvent.muteStatusReceived({
    required Map<String, dynamic> payload,
  }) = _MuteStatusReceived;

  const factory SpeakerDetailEvent.muteSpeaker({
    required Broadcast broadcast,
    required User user,
  }) = MuteSpeaker;

  const factory SpeakerDetailEvent.muteEveryone({
    required Broadcast broadcast,
  }) = MuteEveryone;

  const factory SpeakerDetailEvent.removeCoHost({
    required Broadcast broadcast,
    required User user,
  }) = _RemoveCoHost;

  const factory SpeakerDetailEvent.removeSpeaker({
    required Broadcast broadcast,
    required User user,
  }) = _RemoveSpeaker;
}
