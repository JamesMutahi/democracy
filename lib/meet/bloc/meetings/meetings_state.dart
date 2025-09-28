part of 'meetings_bloc.dart';

enum MeetingsStatus { initial, loading, success, failure }

final class MeetingsState extends Equatable {
  const MeetingsState({
    this.status = MeetingsStatus.initial,
    this.meetings = const [],
    this.hasNext = false,
  });

  final MeetingsStatus status;
  final List<Meeting> meetings;
  final bool hasNext;

  MeetingsState copyWith({
    MeetingsStatus? status,
    List<Meeting>? meetings,
    bool? hasNext,
  }) {
    return MeetingsState(
      status: status ?? this.status,
      meetings: meetings ?? this.meetings,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''MeetingsState { status: $status, ballots: ${meetings.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, meetings];
}
