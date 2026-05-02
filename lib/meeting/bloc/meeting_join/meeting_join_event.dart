part of 'meeting_join_bloc.dart';

@freezed
sealed class MeetingJoinEvent with _$MeetingJoinEvent {
  const factory MeetingJoinEvent.join({
    required RtcEngine engine,
    required Meeting meeting,
    required User user,
}) = _Join;
}
