part of 'ballot_filter_cubit.dart';

@freezed
sealed class BallotFilterState with _$BallotFilterState {
  const factory BallotFilterState.changed({
    required String searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _Changed;
}
