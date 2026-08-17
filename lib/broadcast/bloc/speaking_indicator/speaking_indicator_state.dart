part of 'speaking_indicator_bloc.dart';

class SpeakingState extends Equatable {
  final Set<int> speakingUserIds;
  final bool isLocalSpeaking;

  const SpeakingState({
    this.speakingUserIds = const {},
    this.isLocalSpeaking = false,
  });

  SpeakingState copyWith({Set<int>? speakingUserIds, bool? isLocalSpeaking}) {
    return SpeakingState(
      speakingUserIds: speakingUserIds ?? this.speakingUserIds,
      isLocalSpeaking: isLocalSpeaking ?? this.isLocalSpeaking,
    );
  }

  bool isSpeaking(int userId) => speakingUserIds.contains(userId);

  @override
  List<Object?> get props => [speakingUserIds, isLocalSpeaking];
}
