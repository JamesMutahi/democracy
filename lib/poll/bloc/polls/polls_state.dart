part of 'polls_cubit.dart';

enum PollsStatus { initial, loading, success, failure }

final class PollsState extends Equatable {
  const PollsState({
    this.status = PollsStatus.initial,
    this.polls = const [],
    this.hasNext = false,
  });

  final PollsStatus status;
  final List<Poll> polls;
  final bool hasNext;

  PollsState copyWith({PollsStatus? status, List<Poll>? polls, bool? hasNext}) {
    return PollsState(
      status: status ?? this.status,
      polls: polls ?? this.polls,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''PollsState { status: $status, polls: ${polls.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, polls];
}
