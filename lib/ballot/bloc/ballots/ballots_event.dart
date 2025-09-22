part of 'ballots_bloc.dart';

@freezed
sealed class BallotsEvent with _$BallotsEvent {
  const factory BallotsEvent.get({String? searchTerm, Ballot? lastBallot}) =
      _Get;
  const factory BallotsEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
