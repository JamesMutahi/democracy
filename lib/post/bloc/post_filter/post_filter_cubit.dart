import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_filter_cubit.freezed.dart';
part 'post_filter_state.dart';

class PostFilterCubit extends Cubit<PostFilterState> {
  PostFilterCubit()
    : super(
        const PostFilterState.changed(
          onExplorePage: true,
          searchTerm: '',
          startDate: null,
          endDate: null,
          count: 0,
        ),
      );

  void searchTermChanged({
    required bool onExplorePage,
    required String searchTerm,
  }) {
    emit(
      PostFilterState.changed(
        onExplorePage: onExplorePage,
        searchTerm: searchTerm,
        startDate: state.startDate,
        endDate: state.endDate,
        count: countFilters(),
      ),
    );
  }

  void datesChanged({
    required bool onExplorePage,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    emit(
      PostFilterState.changed(
        onExplorePage: onExplorePage,
        searchTerm: state.searchTerm,
        startDate: startDate,
        endDate: endDate,
        count: countFilters(),
      ),
    );
  }

  void clearFilters({required bool onExplorePage}) {
    emit(
      PostFilterState.changed(
        onExplorePage: onExplorePage,
        searchTerm: state.searchTerm,
        startDate: null,
        endDate: null,
        count: 0,
      ),
    );
  }

  int countFilters() {
    int count = 0;
    if (state.startDate != null || state.endDate != null) {
      count += 1;
    }
    return count;
  }
}
