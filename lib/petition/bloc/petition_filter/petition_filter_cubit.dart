import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petition_filter_cubit.freezed.dart';
part 'petition_filter_state.dart';

class PetitionFilterCubit extends Cubit<PetitionFilterState> {
  PetitionFilterCubit()
    : super(
        const PetitionFilterState.changed(
          searchTerm: '',
          startDate: null,
          endDate: null,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    emit(
      PetitionFilterState.changed(
        searchTerm: searchTerm,
        startDate: state.startDate,
        endDate: state.endDate,
      ),
    );
  }

  void datesChanged({required DateTime? startDate, required DateTime? endDate}) {
    emit(
      PetitionFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  void clearFilters() {
    emit(
      PetitionFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: null,
        endDate: null,
      ),
    );
  }
}
