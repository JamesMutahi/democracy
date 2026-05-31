part of 'ballot_bloc.dart';

enum BallotStatus { initial, loading, success, failure }

final class BallotState extends Equatable {
  const BallotState({
    this.status = BallotStatus.initial,
    this.ballot,
    this.ballotId,
  });

  final BallotStatus status;
  final Ballot? ballot;
  final int? ballotId;

  BallotState copyWith({BallotStatus? status, Ballot? ballot, int? ballotId}) {
    return BallotState(
      status: status ?? this.status,
      ballot: ballot ?? this.ballot,
      ballotId: ballotId ?? this.ballotId,
    );
  }

  @override
  String toString() {
    return '''BallotState { status: $status, ballot: $ballot, ballotId: $ballotId }''';
  }

  @override
  List<Object?> get props => [status, ballot, ballotId];
}
