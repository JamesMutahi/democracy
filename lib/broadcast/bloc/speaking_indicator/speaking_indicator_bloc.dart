import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'speaking_indicator_event.dart';
part 'speaking_indicator_state.dart';

class SpeakingIndicatorBloc extends Bloc<SpeakingEvent, SpeakingState> {
  SpeakingIndicatorBloc() : super(const SpeakingState()) {
    on<UpdateSpeakingUsers>(_onUpdateSpeakingUsers);
  }

  void _onUpdateSpeakingUsers(
    UpdateSpeakingUsers event,
    Emitter<SpeakingState> emit,
  ) {
    final newSpeakingUsers = <int>{};
    bool newLocalSpeaking = false;

    for (var speaker in event.speakers) {
      final uid = speaker.uid;
      final volume = speaker.volume ?? 0;
      final isSpeakingNow = volume > event.threshold;

      if (uid != null) {
        if (uid == event.localUid) {
          newLocalSpeaking = isSpeakingNow;
        } else {
          if (isSpeakingNow) {
            newSpeakingUsers.add(uid);
          }
        }
      }
    }

    // Only emit if the state has actually changed to prevent redundant rebuilds
    if (newSpeakingUsers != state.speakingUserIds ||
        newLocalSpeaking != state.isLocalSpeaking) {
      emit(
        state.copyWith(
          speakingUserIds: newSpeakingUsers,
          isLocalSpeaking: newLocalSpeaking,
        ),
      );
    }
  }
}
