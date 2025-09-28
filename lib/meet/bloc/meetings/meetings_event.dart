part of 'meetings_bloc.dart';

@freezed
sealed class MeetingsEvent with _$MeetingsEvent {
  const factory MeetingsEvent.get({String? searchTerm, Meeting? lastMeeting}) =
      _Get;
  const factory MeetingsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
