import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ballot_filter_cubit.freezed.dart';
part 'ballot_filter_state.dart';

class BallotFilterCubit extends Cubit<BallotFilterState> {
  BallotFilterCubit()
    : super(
        const BallotFilterState.changed(
          searchTerm: '',
          startDate: null,
          endDate: null,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    emit(
      BallotFilterState.changed(
        searchTerm: searchTerm,
        startDate: state.startDate,
        endDate: state.endDate,
      ),
    );
  }

  void datesChanged({required DateTime? startDate, required DateTime? endDate}) {
    emit(
      BallotFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  void clearFilters() {
    emit(
      BallotFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: null,
        endDate: null,
      ),
    );
  }
}
