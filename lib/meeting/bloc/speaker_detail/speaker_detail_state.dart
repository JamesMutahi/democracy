part of 'speaker_detail_bloc.dart';

@freezed
class SpeakerDetailState with _$SpeakerDetailState {
  const factory SpeakerDetailState.initial() =
      SpeakerDetailInitial;

  const factory SpeakerDetailState.loading() =
      SpeakerDetailLoading;

  const factory SpeakerDetailState.requestCreated({
    required SpeakerRequest request,
  }) = SpeakerRequestCreated;

  const factory SpeakerDetailState.requestLoaded({
    required SpeakerRequest request,
  }) = SpeakerRequestLoaded;

  const factory SpeakerDetailState.updated({
    required SpeakerRequest request,
  }) = SpeakerRequestUpdated;

  const factory SpeakerDetailState.deleted({required int requestId}) =
      SpeakerRequestDeleted;

  const factory SpeakerDetailState.requestedToSpeak() = RequestedToSpeak;

  const factory SpeakerDetailState.speakerDecision({
    required int userId,
    required bool isApproved,
    required int decidedBy,
  }) = SpeakerDecision;

  const factory SpeakerDetailState.muteStatusChanged({
    required bool isMuted,
  }) = MuteStatusChanged;

  const factory SpeakerDetailState.muteCommand({
    required int userId,
    required bool isMuted,
    required int mutedBy,
  }) = MuteCommand;

  const factory SpeakerDetailState.failure({required String error}) =
      SpeakerDetailFailure;
}
