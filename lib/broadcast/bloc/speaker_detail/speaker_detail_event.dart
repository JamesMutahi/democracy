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

  const factory SpeakerDetailEvent.requestToSpeakReceived({
    required Map<String, dynamic> payload,
  }) = _RequestToSpeakCompleted;

  const factory SpeakerDetailEvent.handleSpeakerRequest({
    required SpeakerRequest request,
    required bool isApproved,
  }) = HandleSpeakerRequest;

  const factory SpeakerDetailEvent.speakerRequestReceived({
    required Map<String, dynamic> payload,
  }) = SpeakerRequestReceived;

  const factory SpeakerDetailEvent.changeMuteStatus({
    required Broadcast broadcast,
    required bool isMuted,
  }) = ChangeMuteStatus;

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

  const factory SpeakerDetailEvent.mutedEveryoneReceived({
    required Map<String, dynamic> payload,
  }) = _MutedEveryoneReceived;

  const factory SpeakerDetailEvent.manageCoHost({
    required Broadcast broadcast,
    required User user,
  }) = ManageCoHost;

  const factory SpeakerDetailEvent.manageCoHostReceived({
    required Map<String, dynamic> payload,
  }) = _ManageCoHostReceived;

  const factory SpeakerDetailEvent.manageSpeaker({
    required Broadcast broadcast,
    required User user,
  }) = ManageSpeaker;

  const factory SpeakerDetailEvent.manageSpeakerReceived({
    required Map<String, dynamic> payload,
  }) = _ManageSpeakerReceived;
}
