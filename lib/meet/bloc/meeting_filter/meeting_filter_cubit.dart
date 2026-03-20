import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_filter_cubit.freezed.dart';
part 'meeting_filter_state.dart';

class MeetingFilterCubit extends Cubit<MeetingFilterState> {
  MeetingFilterCubit()
    : super(
        const MeetingFilterState.changed(
          searchTerm: '',
          isActive: true,
          filterByRegion: true,
          sortBy: 'recent',
          startDate: null,
          endDate: null,
          count: 0,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    int count = 0;
    if (state.isActive != true) {
      count += 1;
    }
    if (state.filterByRegion != true) {
      count += 1;
    }
    if (state.sortBy != 'recent') {
      count += 1;
    }
    if (state.startDate != null || state.endDate != null) {
      count += 1;
    }
    emit(
      MeetingFilterState.changed(
        searchTerm: searchTerm,
        isActive: state.isActive,
        filterByRegion: state.filterByRegion,
        sortBy: state.sortBy,
        startDate: state.startDate,
        endDate: state.endDate,
        count: count,
      ),
    );
  }

  void filtersChanged({
    required bool? isActive,
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    int count = 0;
    if (isActive != true) {
      count += 1;
    }
    if (filterByRegion != true) {
      count += 1;
    }
    if (sortBy != 'recent') {
      count += 1;
    }
    if (startDate != null || endDate != null) {
      count += 1;
    }
    emit(
      MeetingFilterState.changed(
        searchTerm: state.searchTerm,
        isActive: isActive,
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
      MeetingFilterState.changed(
        searchTerm: state.searchTerm,
        isActive: true,
        filterByRegion: true,
        sortBy: 'recent',
        startDate: null,
        endDate: null,
        count: 0,
      ),
    );
  }
}
