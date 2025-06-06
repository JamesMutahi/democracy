part of 'poll_bloc.dart';

enum PollStatus { initial, loading, success, failure }

const String pollUrl = '/api/polls/';

final class PollState extends Equatable {
  const PollState({
    this.status = PollStatus.initial,
    this.polls = const <Poll>[],
    this.next = '/api/polls/',
  });

  final PollStatus status;
  final List<Poll> polls;
  final String? next;

  PollState copyWith({PollStatus? status, List<Poll>? polls, String? next}) {
    return PollState(
      status: status ?? this.status,
      polls: polls ?? this.polls,
      next: next,
    );
  }

  @override
  String toString() {
    return '''PollState { status: $status, next: $next, polls: ${polls.length} }''';
  }

  @override
  List<Object> get props => [status, polls];
}
