import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petition_filter_cubit.freezed.dart';
part 'petition_filter_state.dart';

class PetitionFilterCubit extends Cubit<PetitionFilterState> {
  PetitionFilterCubit()
    : super(
        const PetitionFilterState.changed(
          searchTerm: '',
          isOpen: true,
          filterByRegion: true,
          sortBy: 'popular',
          startDate: null,
          endDate: null,
          count: 0,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    int count = 0;
    if (state.isOpen != true) {
      count += 1;
    }
    if (state.filterByRegion != true) {
      count += 1;
    }
    if (state.sortBy != 'popular') {
      count += 1;
    }
    if (state.startDate != null || state.endDate != null) {
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
    if (isOpen != true) {
      count += 1;
    }
    if (filterByRegion != true) {
      count += 1;
    }
    if (sortBy != 'popular') {
      count += 1;
    }
    if (startDate != null || endDate != null) {
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
        isOpen: true,
        filterByRegion: true,
        sortBy: 'popular',
        startDate: null,
        endDate: null,
        count: 0,
      ),
    );
  }
}
