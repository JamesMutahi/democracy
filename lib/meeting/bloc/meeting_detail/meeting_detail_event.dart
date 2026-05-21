part of 'meeting_detail_bloc.dart';

@freezed
sealed class MeetingDetailEvent with _$MeetingDetailEvent {
  const factory MeetingDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;
  const factory MeetingDetailEvent.loaded({
    required Map<String, dynamic> payload,
  }) = _Loaded;
  const factory MeetingDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;
  const factory MeetingDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;
  const factory MeetingDetailEvent.create({
    required String title,
    required String description,
    DateTime? startTime,
    required bool isRecorded,
    @Default(false) bool isLiveStream,
  }) = _Create;
  const factory MeetingDetailEvent.join({
    required RtcEngine engine,
    required Meeting meeting,
    required User user,
  }) = _Join;
  const factory MeetingDetailEvent.retrieve({required Meeting meeting}) =
      _Retrieve;
  const factory MeetingDetailEvent.subscribe({
    required Meeting meeting,
    required bool isMuted,
  }) = _Subscribe;
  const factory MeetingDetailEvent.unsubscribe({required Meeting meeting}) =
      _Unsubscribe;
}
