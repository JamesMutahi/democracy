part of 'speaking_indicator_bloc.dart';

abstract class SpeakingEvent extends Equatable {
  const SpeakingEvent();
  @override
  List<Object?> get props => [];
}

class UpdateSpeakingUsers extends SpeakingEvent {
  final List<AudioVolumeInfo> speakers;
  final int threshold;
  final int localUid;

  const UpdateSpeakingUsers({
    required this.speakers,
    this.threshold = 25, // Volume threshold (0-255)
    this.localUid = 0, // Agora usually uses 0 for the local user
  });

  @override
  List<Object?> get props => [speakers, threshold, localUid];
}
