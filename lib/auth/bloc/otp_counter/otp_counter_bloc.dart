import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_counter_event.dart';
part 'otp_counter_state.dart';
part 'otp_counter_bloc.freezed.dart';

class OTPCounterBloc extends Bloc<OTPCounterEvent, OTPCounterState> {
  OTPCounterBloc() : super(const OTPCounterState.initial()) {
    on<_Started>((event, emit) async {
      await _onStarted(emit);
    });
    on<_Tick>((event, emit) async {
      await _onTick(emit, event);
    });
    on<_Complete>((event, emit) async {
      await _onComplete(emit);
    });
    on<_Cancel>((event, emit) async {
      await _onCancel(emit);
    });
  }
  Future _onStarted(Emitter<OTPCounterState> emit) async {
    await _timerSubscription?.cancel();
    const duration = Duration(minutes: 5);
    final inSeconds = duration.inSeconds;
    _stream = Stream.periodic(const Duration(seconds: 1), (idx) => idx);
    _timerSubscription = _stream.listen(
      (idx) {
        if (idx == inSeconds) {
          add(const _Complete());
        } else {
          add(_Tick(seconds: inSeconds - idx));
        }
      },
    );
  }

  Future _onTick(Emitter<OTPCounterState> emit, _Tick event) async {
    emit(OTPCounterState.running(Duration(seconds: event.seconds)));
  }

  Future _onComplete(Emitter<OTPCounterState> emit) async {
    _timerSubscription?.cancel();
    emit(const OTPCounterState.expired('OTP Verification expired'));
  }

  Future _onCancel(Emitter<OTPCounterState> emit) async {
    _timerSubscription?.cancel();
    emit(const OTPCounterState.initial());
  }

  StreamSubscription? _timerSubscription;
  late Stream<int> _stream;

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
