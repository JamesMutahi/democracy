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
}