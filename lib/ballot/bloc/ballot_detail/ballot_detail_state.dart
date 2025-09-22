part of 'ballot_detail_bloc.dart';

@freezed
class BallotDetailState with _$BallotDetailState {
  const factory BallotDetailState.initial() = BallotDetailInitial;

  const factory BallotDetailState.loading() = BallotDetailLoading;

  const factory BallotDetailState.created({required Ballot ballot}) =
      BallotCreated;

  const factory BallotDetailState.updated({required Ballot ballot}) =
      BallotUpdated;

  const factory BallotDetailState.deleted({required int ballotId}) =
      BallotDeleted;

  const factory BallotDetailState.failure({required String error}) =
      BallotDetailFailure;
}
