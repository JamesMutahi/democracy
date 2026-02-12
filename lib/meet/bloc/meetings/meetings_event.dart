part of 'meetings_bloc.dart';

@freezed
sealed class MeetingsEvent with _$MeetingsEvent {
  const factory MeetingsEvent.get({
    String? searchTerm,
    Meeting? lastMeeting,
    bool? isActive,
    String? sortBy,
    bool? filterByRegion,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Get;
  const factory MeetingsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory MeetingsEvent.resubscribe({required List<Meeting> meetings}) =
      _Resubscribe;
}
