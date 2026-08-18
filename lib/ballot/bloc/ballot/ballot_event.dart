part of 'ballot_bloc.dart';

@freezed
class BallotEvent with _$BallotEvent {
  const factory BallotEvent.load({required int ballotId}) = _Load;
  const factory BallotEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory BallotEvent.ballotDetailUpdated({
    required String title,
    required String description,
    required County? county,
    required Constituency? constituency,
    required Ward? ward,
    required DateTime startTime,
    required DateTime endTime,
    required bool hasStarted,
    required bool hasEnded,
    required int totalVotes,
    required List<Option> options,
    required bool isActive,
  }) = _BallotDetailUpdated;
  const factory BallotEvent.votedOptionUpdated({
    required int votedOptionId,
  }) = _VotedOptionUpdated;
    const factory BallotEvent.reasonUpdated({
    required String? reason,
  }) = _ReasonUpdated;
}
