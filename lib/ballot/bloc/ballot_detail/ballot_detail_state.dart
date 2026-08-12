part of 'ballot_detail_bloc.dart';

@freezed
class BallotDetailState with _$BallotDetailState {
  const factory BallotDetailState.initial() = BallotDetailInitial;

  const factory BallotDetailState.loading() = BallotDetailLoading;

  const factory BallotDetailState.created({required Ballot ballot}) =
      BallotCreated;

  const factory BallotDetailState.loaded({required Ballot ballot}) =
      BallotLoaded;

  const factory BallotDetailState.updated({
    required int ballotId,
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
  }) = BallotUpdated;

  const factory BallotDetailState.voted({
    required int ballotId,
    required int optionId,
    required bool hasChanged,
    required bool alreadyVoted,
  }) = BallotVoted;

  const factory BallotDetailState.reasonSubmitted({
    required int ballotId,
    required String? reason,
  }) = BallotReasonSubmitted;

  const factory BallotDetailState.deleted({required int ballotId}) =
      BallotDeleted;

  const factory BallotDetailState.failure({required String error}) =
      BallotDetailFailure;
}
