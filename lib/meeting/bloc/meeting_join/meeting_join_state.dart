part of 'meeting_join_bloc.dart';

@freezed
class MeetingJoinState with _$MeetingJoinState {
  const factory MeetingJoinState.initial() = MeetingJoinInitial;
  const factory MeetingJoinState.loading() = MeetingJoinLoading;
  const factory MeetingJoinState.success() = MeetingJoinSuccess;
  const factory MeetingJoinState.failure({required String error}) =
      MeetingJoinFailure;
}
