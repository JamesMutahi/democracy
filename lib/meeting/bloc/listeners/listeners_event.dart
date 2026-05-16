part of 'listeners_bloc.dart';

@freezed
sealed class ListenersEvent with _$ListenersEvent {
  const factory ListenersEvent.get({required Meeting meeting, User? lastUser}) =
      _Get;
  const factory ListenersEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory ListenersEvent.update({required List<User> users}) = _Update;
}
