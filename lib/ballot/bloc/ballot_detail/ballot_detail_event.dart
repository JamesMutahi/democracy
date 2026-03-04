part of 'ballot_detail_bloc.dart';

@freezed
sealed class BallotDetailEvent with _$BallotDetailEvent {
  const factory BallotDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;
  const factory BallotDetailEvent.loaded({
    required Map<String, dynamic> payload,
  }) = _Loaded;
  const factory BallotDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;
  const factory BallotDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;
  const factory BallotDetailEvent.retrieve({required Ballot ballot}) =
      _Retrieve;
  const factory BallotDetailEvent.vote({required Option option}) = _Vote;
  const factory BallotDetailEvent.voted({
    required Map<String, dynamic> payload,
  }) = _Voted;
  const factory BallotDetailEvent.submitReason({
    required Ballot ballot,
    required String text,
  }) = _SubmitReason;
  const factory BallotDetailEvent.unsubscribe({required Ballot ballot}) =
      _Unsubscribe;
}
