import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hub_filter_state.dart';

class HubFilterCubit extends Cubit<HubFilterState> {
  HubFilterCubit() : super(const HubFilterState());

  void searchTermChanged({
    required bool onHubPage,
    required String searchTerm,
  }) {
    emit(
      state.copyWith(
        onHubPage: onHubPage,
        searchTerm: searchTerm,
        count: countFilters(),
      ),
    );
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
        startDate: startDate,
        endDate: endDate,
        count: countFilters(),
      ),
    );
  }

  void clearFilters({required bool onHubPage}) {
    emit(const HubFilterState());
  }

  int countFilters() {
    int count = 0;
    if (!state.filterByRegion) {
      count += 1;
    }
    if (state.sortBy != initialSortBy) {
      count += 1;
    }
    if (state.startDate != null || state.endDate != null) {
      count += 1;
    }
    return count;
  }
}
