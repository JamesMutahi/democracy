part of 'ballots_bloc.dart';

@freezed
sealed class BallotsEvent with _$BallotsEvent {
  const factory BallotsEvent.get({
    String? searchTerm,
    List<Ballot>? previousBallots,
    bool? isActive,
    String? sortBy,
    bool? filterByRegion,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Get;
  const factory BallotsEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
