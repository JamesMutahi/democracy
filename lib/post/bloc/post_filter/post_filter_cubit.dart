import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_filter_state.dart';

class PostFilterCubit extends Cubit<PostFilterState> {
  PostFilterCubit() : super(const PostFilterState());

  void initialize({
    required bool onExplorePage,
    required String searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    emit(
      state.copyWith(
        onExplorePage: onExplorePage,
        searchTerm: searchTerm,
        startDate: () => startDate,
        endDate: () => endDate,
        count: _countFilters(startDate, endDate),
      ),
    );
  }

  void searchTermChanged({
    required bool onExplorePage,
    required String searchTerm,
  }) {
    emit(state.copyWith(onExplorePage: onExplorePage, searchTerm: searchTerm));
  }

  void datesChanged({
    required bool onExplorePage,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    emit(
      state.copyWith(
        onExplorePage: onExplorePage,
        startDate: () => startDate,
        endDate: () => endDate,
        count: _countFilters(startDate, endDate),
      ),
    );
  }

  void clearFilters({required bool onExplorePage}) {
    emit(PostFilterState(onExplorePage: onExplorePage));
  }

  int _countFilters(DateTime? start, DateTime? end) {
    return (start != null || end != null) ? 1 : 0;
  }
}
