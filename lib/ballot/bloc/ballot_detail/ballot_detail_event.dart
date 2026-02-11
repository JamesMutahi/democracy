part of 'ballot_detail_bloc.dart';

@freezed
sealed class BallotDetailEvent with _$BallotDetailEvent {
  const factory BallotDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;
  const factory BallotDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;
  const factory BallotDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;
  const factory BallotDetailEvent.vote({required Option option}) = _Vote;
  const factory BallotDetailEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory BallotDetailEvent.submitReason({
    required Ballot ballot,
    required String text,
  }) = _SubmitReason;
}
