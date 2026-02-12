import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_filter_cubit.freezed.dart';
part 'survey_filter_state.dart';

class SurveyFilterCubit extends Cubit<SurveyFilterState> {
  SurveyFilterCubit()
    : super(
        const SurveyFilterState.changed(
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
      SurveyFilterState.changed(
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
      SurveyFilterState.changed(
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
      SurveyFilterState.changed(
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
