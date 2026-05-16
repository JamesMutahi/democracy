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
    required Meeting meeting,
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

  const factory SpeakerDetailEvent.speakerDecisionReceived({
    required Map<String, dynamic> payload,
  }) = SpeakerDecisionReceived;

  const factory SpeakerDetailEvent.changeMuteStatus({
    required Meeting meeting,
    required bool isMuted,
  }) = ChangeMuteStatus;

  const factory SpeakerDetailEvent.muteStatusReceived({
    required Map<String, dynamic> payload,
  }) = _MuteStatusReceived;

  const factory SpeakerDetailEvent.muteSpeaker({
    required Meeting meeting,
    required User user,
    required bool isMuted,
  }) = MuteSpeaker;

  const factory SpeakerDetailEvent.muteCommandReceived({
    required Map<String, dynamic> payload,
  }) = _MuteCommandReceived;
}
