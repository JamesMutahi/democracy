import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_filter_cubit.freezed.dart';
part 'survey_filter_state.dart';

class SurveyFilterCubit extends Cubit<SurveyFilterState> {
  SurveyFilterCubit()
    : super(
        const SurveyFilterState.changed(
          searchTerm: '',
          status: 'open',
          filterByRegion: true,
          sortBy: 'recent',
          startDate: null,
          endDate: null,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    emit(
      SurveyFilterState.changed(
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
      SurveyFilterState.changed(
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
      SurveyFilterState.changed(
        searchTerm: state.searchTerm,
        status: 'open',
        filterByRegion: true,
        sortBy: 'recent',
        startDate: null,
        endDate: null,
      ),
    );
  }
}
