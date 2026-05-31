part of 'meeting_bloc.dart';

enum MeetingStatus { initial, loading, success, failure }

final class MeetingState extends Equatable {
  const MeetingState({
    this.status = MeetingStatus.initial,
    this.meeting,
    this.meetingId,
  });

  final MeetingStatus status;
  final Meeting? meeting;
  final int? meetingId;

  MeetingState copyWith({
    MeetingStatus? status,
    Meeting? meeting,
    int? meetingId,
  }) {
    return MeetingState(
      status: status ?? this.status,
      meeting: meeting ?? this.meeting,
      meetingId: meetingId ?? this.meetingId,
    );
  }

  @override
  String toString() {
    return '''MeetingState { status: $status, meeting: $meeting, meetingId: $meetingId }''';
  }

  @override
  List<Object?> get props => [status, meeting, meetingId];
}
