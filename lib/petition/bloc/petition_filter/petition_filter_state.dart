part of 'petition_filter_cubit.dart';

@freezed
sealed class PetitionFilterState with _$PetitionFilterState {
  const factory PetitionFilterState.changed({
    required String searchTerm,
    required bool? isOpen,
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _Changed;
}
