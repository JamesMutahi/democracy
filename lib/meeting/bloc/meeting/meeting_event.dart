part of 'meeting_bloc.dart';

@freezed
class MeetingEvent with _$MeetingEvent {
  const factory MeetingEvent.load({required int meetingId}) = _Load;
  const factory MeetingEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory MeetingEvent.updated({required Meeting meeting}) = _Updated;
}
