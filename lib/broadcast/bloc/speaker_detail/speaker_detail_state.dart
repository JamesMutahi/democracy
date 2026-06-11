part of 'speaker_detail_bloc.dart';

@freezed
class SpeakerDetailState with _$SpeakerDetailState {
  const factory SpeakerDetailState.initial() = SpeakerDetailInitial;

  const factory SpeakerDetailState.loading() = SpeakerDetailLoading;

  const factory SpeakerDetailState.requestCreated({
    required SpeakerRequest request,
  }) = SpeakerRequestCreated;

  const factory SpeakerDetailState.requestLoaded({
    required SpeakerRequest request,
  }) = SpeakerRequestLoaded;

  const factory SpeakerDetailState.updated({required SpeakerRequest request}) =
      SpeakerRequestUpdated;

  const factory SpeakerDetailState.deleted({required int requestId}) =
      SpeakerRequestDeleted;

  const factory SpeakerDetailState.requestedToSpeak() = RequestedToSpeak;

  const factory SpeakerDetailState.muteStatusChanged({required bool isMuted}) =
      MuteStatusChanged;

  const factory SpeakerDetailState.mutedEveryone() = MutedEveryone;

  const factory SpeakerDetailState.coHostStatusChanged({
    required bool isCoHost,
  }) = CoHostStatusChanged;

  const factory SpeakerDetailState.speakerStatusChanged({
    required bool isSpeaker,
  }) = SpeakerStatusChanged;

  const factory SpeakerDetailState.failure({required String error}) =
      SpeakerDetailFailure;
}
