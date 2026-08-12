part of 'ballots_bloc.dart';

@freezed
sealed class BallotsEvent with _$BallotsEvent {
  const factory BallotsEvent.get({
    String? searchTerm,
    List<Ballot>? previousBallots,
    bool? isOpen,
    String? sortBy,
    bool? filterByRegion,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Get;
  const factory BallotsEvent.received({required Map<String, dynamic> payload}) =
      _Received;
  const factory BallotsEvent.add({required Ballot ballot}) = _Add;
  const factory BallotsEvent.update({required List<Ballot> ballots}) = _Update;
  const factory BallotsEvent.remove({required int ballotId}) = _Remove;
}
