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
      ),
    );
  }
}
