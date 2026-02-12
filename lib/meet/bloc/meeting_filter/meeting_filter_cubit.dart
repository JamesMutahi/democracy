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
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    emit(
      MeetingFilterState.changed(
        searchTerm: searchTerm,
        isActive: state.isActive,
        filterByRegion: state.filterByRegion,
        sortBy: state.sortBy,
        startDate: state.startDate,
        endDate: state.endDate,
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
    emit(
      MeetingFilterState.changed(
        searchTerm: state.searchTerm,
        isActive: isActive,
        filterByRegion: filterByRegion,
        sortBy: sortBy,
        startDate: startDate,
        endDate: endDate,
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
      ),
    );
  }
}
