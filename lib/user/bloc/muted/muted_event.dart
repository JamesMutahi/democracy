part of 'muted_bloc.dart';

@freezed
sealed class MutedEvent with _$MutedEvent {
  const factory MutedEvent.get({User? lastUser}) = _Get;
  const factory MutedEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
