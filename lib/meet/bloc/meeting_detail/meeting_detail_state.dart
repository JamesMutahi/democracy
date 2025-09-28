part of 'meeting_detail_bloc.dart';

@freezed
class MeetingDetailState with _$MeetingDetailState {
  const factory MeetingDetailState.initial() = MeetingDetailInitial;

  const factory MeetingDetailState.loading() = MeetingDetailLoading;

  const factory MeetingDetailState.created({required Meeting meeting}) =
      MeetingCreated;

  const factory MeetingDetailState.updated({required Meeting meeting}) =
      MeetingUpdated;

  const factory MeetingDetailState.deleted({required int meetingId}) =
      MeetingDeleted;

  const factory MeetingDetailState.failure({required String error}) =
      MeetingDetailFailure;
}
