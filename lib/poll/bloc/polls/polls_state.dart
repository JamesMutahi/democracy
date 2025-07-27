part of 'polls_cubit.dart';

enum PollsStatus { initial, loading, success, failure }

final class PollsState extends Equatable {
  const PollsState({
    this.status = PollsStatus.initial,
    this.polls = const [],
    this.since,
    this.hasNext = false,
  });

  final PollsStatus status;
  final List<Poll> polls;
  final int? since;
  final bool hasNext;

  PollsState copyWith({
    PollsStatus? status,
    List<Poll>? polls,
    int? since,
    bool? hasNext,
  }) {
    return PollsState(
      status: status ?? this.status,
      polls: polls ?? this.polls,
      since: since ?? this.since,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''PollsState { status: $status, polls: ${polls.length}, 
    since: $since, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, polls];
}
