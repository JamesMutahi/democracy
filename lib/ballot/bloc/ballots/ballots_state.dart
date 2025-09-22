part of 'ballots_bloc.dart';

enum BallotsStatus { initial, loading, success, failure }

final class BallotsState extends Equatable {
  const BallotsState({
    this.status = BallotsStatus.initial,
    this.ballots = const [],
    this.hasNext = false,
  });

  final BallotsStatus status;
  final List<Ballot> ballots;
  final bool hasNext;

  BallotsState copyWith({
    BallotsStatus? status,
    List<Ballot>? ballots,
    bool? hasNext,
  }) {
    return BallotsState(
      status: status ?? this.status,
      ballots: ballots ?? this.ballots,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''BallotsState { status: $status, ballots: ${ballots.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, ballots];
}
