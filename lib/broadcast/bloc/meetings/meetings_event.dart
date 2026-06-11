part of 'meetings_bloc.dart';

@freezed
sealed class MeetingsEvent with _$MeetingsEvent {
  const factory MeetingsEvent.get({
    String? searchTerm,
    List<Broadcast>? previousBroadcasts,
    bool? isActive,
    String? sortBy,
    bool? filterByRegion,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Get;
  const factory MeetingsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory MeetingsEvent.add({required Broadcast broadcast}) = _Add;
  const factory MeetingsEvent.update({required Broadcast broadcast}) = _Update;
  const factory MeetingsEvent.remove({required int broadcastId}) = _Remove;
}
