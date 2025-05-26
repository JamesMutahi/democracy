part of 'otp_counter_bloc.dart';

@freezed
sealed class OTPCounterState with _$OTPCounterState {
  const factory OTPCounterState.initial() = OTPCounterInitial;

  const factory OTPCounterState.running(Duration time) = OTPCounterRunning;

  const factory OTPCounterState.expired(String message) = OTPCounterExpired;
}
