part of 'ballots_bloc.dart';

enum BallotsStatus { initial, loading, success, failure }

final class BallotsState extends Equatable {
  const BallotsState({
    this.status = BallotsStatus.initial,
    this.searchTerm = '',
    this.ballots = const [],
    this.hasNext = false,
  });

  final BallotsStatus status;
  final String searchTerm;
  final List<Ballot> ballots;
  final bool hasNext;

  BallotsState copyWith({
    BallotsStatus? status,
    String? searchTerm,
    List<Ballot>? ballots,
    bool? hasNext,
  }) {
    return BallotsState(
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      ballots: ballots ?? this.ballots,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''BallotsState { status: $status, searchTerm: $searchTerm, ballots: ${ballots.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, ballots];
}
