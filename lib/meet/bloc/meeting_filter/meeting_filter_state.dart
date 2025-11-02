part of 'meeting_filter_cubit.dart';

@freezed
sealed class MeetingFilterState with _$MeetingFilterState {
  const factory MeetingFilterState.changed({
    required String searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _Changed;
}
