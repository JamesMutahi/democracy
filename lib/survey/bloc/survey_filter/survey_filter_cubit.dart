import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_filter_cubit.freezed.dart';
part 'survey_filter_state.dart';

class SurveyFilterCubit extends Cubit<SurveyFilterState> {
  SurveyFilterCubit()
    : super(
        const SurveyFilterState.changed(
          searchTerm: '',
          startDate: null,
          endDate: null,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    emit(
      SurveyFilterState.changed(
        searchTerm: searchTerm,
        startDate: state.startDate,
        endDate: state.endDate,
      ),
    );
  }

  void datesChanged({required DateTime? startDate, required DateTime? endDate}) {
    emit(
      SurveyFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  void clearFilters() {
    emit(
      SurveyFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: null,
        endDate: null,
      ),
    );
  }
}
