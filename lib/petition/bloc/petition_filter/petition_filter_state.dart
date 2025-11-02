part of 'petition_filter_cubit.dart';

@freezed
sealed class PetitionFilterState with _$PetitionFilterState {
  const factory PetitionFilterState.changed({
    required String searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _Changed;
}
