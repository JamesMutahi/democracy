part of 'meeting_detail_bloc.dart';

@freezed
class MeetingDetailState with _$MeetingDetailState {
  const factory MeetingDetailState.initial() = MeetingDetailInitial;

  const factory MeetingDetailState.loading() = MeetingDetailLoading;

  const factory MeetingDetailState.created({required Meeting meeting}) =
      MeetingCreated;

  const factory MeetingDetailState.loaded({required Meeting meeting}) =
      MeetingLoaded;

  const factory MeetingDetailState.updated({
    required int id,
    required String title,
    required String description,
    required County? county,
    required Constituency? constituency,
    required Ward? ward,
    required int participantsCount,
    required bool isActive,
  }) = MeetingUpdated;

  const factory MeetingDetailState.deleted({required int meetingId}) =
      MeetingDeleted;

  const factory MeetingDetailState.left({required int meetingId}) = MeetingLeft;

  const factory MeetingDetailState.failure({required String error}) =
      MeetingDetailFailure;
}
