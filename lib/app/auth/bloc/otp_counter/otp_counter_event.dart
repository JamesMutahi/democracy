part of 'otp_counter_bloc.dart';

@freezed
class OTPCounterEvent with _$OTPCounterEvent {
  const factory OTPCounterEvent.started() = _Started;
  const factory OTPCounterEvent.tick({required int seconds}) = _Tick;
  const factory OTPCounterEvent.complete() = _Complete;
  const factory OTPCounterEvent.cancel() = _Cancel;
}
