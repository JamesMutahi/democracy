part of 'blocked_bloc.dart';

@freezed
sealed class BlockedEvent with _$BlockedEvent {
  const factory BlockedEvent.get({User? lastUser}) = _Get;
  const factory BlockedEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
