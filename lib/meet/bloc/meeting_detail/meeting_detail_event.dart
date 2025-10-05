part of 'meeting_detail_bloc.dart';

@freezed
sealed class MeetingDetailEvent with _$MeetingDetailEvent {
  const factory MeetingDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;
  const factory MeetingDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;
  const factory MeetingDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;
  const factory MeetingDetailEvent.join({required Meeting meeting}) = _Join;
  const factory MeetingDetailEvent.joined({
    required Map<String, dynamic> payload,
  }) = _Joined;
  const factory MeetingDetailEvent.leave({required Meeting meeting}) = _Leave;
  const factory MeetingDetailEvent.left({
    required Map<String, dynamic> payload,
  }) = _Left;
}
