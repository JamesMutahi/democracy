import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_filter_cubit.freezed.dart';
part 'meeting_filter_state.dart';

class MeetingFilterCubit extends Cubit<MeetingFilterState> {
  MeetingFilterCubit()
    : super(
        const MeetingFilterState.changed(
          searchTerm: '',
          startDate: null,
          endDate: null,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    emit(
      MeetingFilterState.changed(
        searchTerm: searchTerm,
        startDate: state.startDate,
        endDate: state.endDate,
      ),
    );
  }

  void datesChanged({required DateTime? startDate, required DateTime? endDate}) {
    emit(
      MeetingFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  void clearFilters() {
    emit(
      MeetingFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: null,
        endDate: null,
      ),
    );
  }
}
