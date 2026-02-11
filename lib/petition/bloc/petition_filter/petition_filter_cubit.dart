import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petition_filter_cubit.freezed.dart';
part 'petition_filter_state.dart';

class PetitionFilterCubit extends Cubit<PetitionFilterState> {
  PetitionFilterCubit()
    : super(
        const PetitionFilterState.changed(
          searchTerm: '',
          status: 'open',
          filterByRegion: true,
          sortBy: 'popular',
          startDate: null,
          endDate: null,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    emit(
      PetitionFilterState.changed(
        searchTerm: searchTerm,
        status: state.status,
        filterByRegion: state.filterByRegion,
        sortBy: state.sortBy,
        startDate: state.startDate,
        endDate: state.endDate,
      ),
    );
  }

  void filtersChanged({
    required String status,
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    emit(
      PetitionFilterState.changed(
        searchTerm: state.searchTerm,
        status: status,
        filterByRegion: filterByRegion,
        sortBy: sortBy,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  void clearFilters() {
    emit(
      PetitionFilterState.changed(
        searchTerm: state.searchTerm,
        status: 'open',
        filterByRegion: true,
        sortBy: 'popular',
        startDate: null,
        endDate: null,
      ),
    );
  }
}
