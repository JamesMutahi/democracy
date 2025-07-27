part of 'polls_cubit.dart';

enum PollsStatus { initial, loading, success, failure }

final class PollsState extends Equatable {
  const PollsState({
    this.status = PollsStatus.initial,
    this.polls = const [],
    this.currentPage = 1,
    this.hasNext = false,
    this.hasPrevious = false,
  });

  final PollsStatus status;
  final List<Poll> polls;
  final int currentPage;
  final bool hasNext;
  final bool hasPrevious;

  PollsState copyWith({
    PollsStatus? status,
    List<Poll>? polls,
    int? currentPage,
    bool? hasNext,
  }) {
    return PollsState(
      status: status ?? this.status,
      polls: polls ?? this.polls,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''PollsState { status: $status, polls: ${polls.length}, 
    currentPage: $currentPage, hasNext: $hasNext, hasPrevious: $hasPrevious }''';
  }

  @override
  List<Object> get props => [status, polls];
}
