part of 'post_filter_cubit.dart';

@freezed
sealed class PostFilterState with _$PostFilterState {
  const factory PostFilterState.changed({
    required bool onExplorePage,
    required String searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
    required int count,
  }) = _Changed;
}
