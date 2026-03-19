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
    int count = 0;
    if (state.startDate != null || state.endDate != null) {
      count += 1;
    }
    emit(
      PostFilterState.changed(
        onExplorePage: onExplorePage,
        searchTerm: searchTerm,
        startDate: state.startDate,
        endDate: state.endDate,
        count: count
      ),
    );
  }

  void datesChanged({
    required bool onExplorePage,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    int count = 0;
    if (startDate != null || endDate != null) {
      count += 1;
    }
    emit(
      PostFilterState.changed(
        onExplorePage: onExplorePage,
        searchTerm: state.searchTerm,
        startDate: startDate,
        endDate: endDate,
        count: count,
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
}
