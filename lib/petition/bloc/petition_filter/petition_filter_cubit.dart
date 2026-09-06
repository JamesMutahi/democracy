import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petition_filter_cubit.freezed.dart';
part 'petition_filter_state.dart';

const defaultSearchTerm = '';
const defaultIsOpen = null;
const defaultFilterByRegion = true;
const defaultSortBy = 'popular';
const defaultStartDate = null;
const defaultEndDate = null;

class PetitionFilterCubit extends Cubit<PetitionFilterState> {
  PetitionFilterCubit()
    : super(
        const PetitionFilterState.changed(
          searchTerm: defaultSearchTerm,
          isOpen: defaultIsOpen,
          filterByRegion: defaultFilterByRegion,
          sortBy: defaultSortBy,
          startDate: defaultStartDate,
          endDate: defaultEndDate,
          count: 0,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    int count = 0;
    if (state.isOpen != defaultIsOpen) {
      count += 1;
    }
    if (state.filterByRegion != defaultFilterByRegion) {
      count += 1;
    }
    if (state.sortBy != defaultSortBy) {
      count += 1;
    }
    if (state.startDate != defaultStartDate ||
        state.endDate != defaultEndDate) {
      count += 1;
    }
    emit(
      PetitionFilterState.changed(
        searchTerm: searchTerm,
        isOpen: state.isOpen,
        filterByRegion: state.filterByRegion,
        sortBy: state.sortBy,
        startDate: state.startDate,
        endDate: state.endDate,
        count: count,
      ),
    );
  }

  void filtersChanged({
    required bool? isOpen,
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    int count = 0;
    if (isOpen != defaultIsOpen) {
      count += 1;
    }
    if (filterByRegion != defaultFilterByRegion) {
      count += 1;
    }
    if (sortBy != defaultSortBy) {
      count += 1;
    }
    if (startDate != defaultStartDate || endDate != defaultEndDate) {
      count += 1;
    }
    emit(
      PetitionFilterState.changed(
        searchTerm: state.searchTerm,
        isOpen: isOpen,
        filterByRegion: filterByRegion,
        sortBy: sortBy,
        startDate: startDate,
        endDate: endDate,
        count: count,
      ),
    );
  }

  void clearFilters() {
    emit(
      PetitionFilterState.changed(
        searchTerm: state.searchTerm,
        isOpen: defaultIsOpen,
        filterByRegion: defaultFilterByRegion,
        sortBy: defaultSortBy,
        startDate: defaultStartDate,
        endDate: defaultEndDate,
        count: 0,
      ),
    );
  }
}
