part of 'ballot_bloc.dart';

@freezed
class BallotEvent with _$BallotEvent {
  const factory BallotEvent.load({required int ballotId}) = _Load;
  const factory BallotEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory BallotEvent.updated({required Ballot ballot}) = _Updated;
}
