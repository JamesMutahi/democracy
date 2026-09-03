import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'speaking_indicator_event.dart';
part 'speaking_indicator_state.dart';

/// Emits the first event immediately, then drops all subsequent events
/// for the specified [duration].
EventTransformer<Event> throttle<Event>(Duration duration) {
  return (events, mapper) {
    return events
        .transform(_ThrottleStreamTransformer(duration))
        .asyncExpand(mapper);
  };
}

class _ThrottleStreamTransformer<T> extends StreamTransformerBase<T, T> {
  _ThrottleStreamTransformer(this.duration);

  final Duration duration;

  @override
  Stream<T> bind(Stream<T> stream) {
    return Stream<T>.multi((controller) {
      bool isThrottled = false;
      StreamSubscription<T>? subscription;

      subscription = stream.listen(
        (event) {
          if (!isThrottled) {
            controller.add(event);
            isThrottled = true;
            Future.delayed(duration, () {
              isThrottled = false;
            });
          }
          // If throttled, silently drop the event
        },
        onError: controller.addError,
        onDone: controller.close,
      );

      controller.onCancel = () => subscription?.cancel();
    });
  }
}

class SpeakingIndicatorBloc extends Bloc<SpeakingEvent, SpeakingState> {
  SpeakingIndicatorBloc() : super(const SpeakingState()) {
    on<UpdateSpeakingUsers>(
      (event, emit) => _onUpdateSpeakingUsers(event, emit),
      transformer: throttle(const Duration(milliseconds: 250)),
    );
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
