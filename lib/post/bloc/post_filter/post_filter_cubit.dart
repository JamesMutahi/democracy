import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_filter_cubit.freezed.dart';
part 'post_filter_state.dart';

class PostFilterCubit extends Cubit<PostFilterState> {
  PostFilterCubit()
    : super(
        const PostFilterState.changed(
          searchTerm: '',
          startDate: null,
          endDate: null,
        ),
      );

  void searchTermChanged({required String searchTerm}) {
    emit(
      PostFilterState.changed(
        searchTerm: searchTerm,
        startDate: state.startDate,
        endDate: state.endDate,
      ),
    );
  }

  void datesChanged({required DateTime? startDate, required DateTime? endDate}) {
    emit(
      PostFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  void clearFilters() {
    emit(
      PostFilterState.changed(
        searchTerm: state.searchTerm,
        startDate: null,
        endDate: null,
      ),
    );
  }
}
