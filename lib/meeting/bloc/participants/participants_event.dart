part of 'participants_bloc.dart';

@freezed
sealed class ParticipantsEvent with _$ParticipantsEvent {
  const factory ParticipantsEvent.get({
    required Meeting meeting,
    User? lastUser,
  }) = _Get;
  const factory ParticipantsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory ParticipantsEvent.update({required List<User> users}) = _Update;
}
