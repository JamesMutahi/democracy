import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hub_filter_state.dart';

class HubFilterCubit extends Cubit<HubFilterState> {
  HubFilterCubit() : super(const HubFilterState());

  void initialize({
    required bool onHubPage,
    required String searchTerm,
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    emit(
      state.copyWith(
        onHubPage: onHubPage,
        searchTerm: searchTerm,
        filterByRegion: filterByRegion,
        sortBy: sortBy,
        startDate: () => startDate,
        endDate: () => endDate,
        count: _countFilters(
          filterByRegion: state.filterByRegion,
          sortBy: state.sortBy,
          startDate: state.startDate,
          endDate: state.endDate,
        ),
      ),
    );
  }

  void searchTermChanged({
    required bool onHubPage,
    required String searchTerm,
  }) {
    emit(state.copyWith(onHubPage: onHubPage, searchTerm: searchTerm));
  }

  void filtersChanged({
    required bool onHubPage,
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    emit(
      state.copyWith(
        onHubPage: onHubPage,
        filterByRegion: filterByRegion,
        sortBy: sortBy,
        startDate: () => startDate,
        endDate: () => endDate,
        count: _countFilters(
          filterByRegion: filterByRegion,
          sortBy: sortBy,
          startDate: startDate,
          endDate: endDate,
        ),
      ),
    );
  }

  void clearFilters({required bool onHubPage}) {
    emit(HubFilterState(onHubPage: onHubPage));
  }

  int _countFilters({
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    int count = 0;
    if (!filterByRegion) {
      count += 1;
    }
    if (sortBy != initialSortBy) {
      count += 1;
    }
    if (startDate != null || endDate != null) {
      count += 1;
    }
    return count;
  }
}
