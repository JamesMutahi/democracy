part of 'poll_detail_cubit.dart';

@freezed
class PollDetailState with _$PollDetailState {
  const factory PollDetailState.initial() = PollDetailInitial;
  const factory PollDetailState.loading() = PollDetailLoading;
  const factory PollDetailState.created({required Poll poll}) = PollCreated;
  const factory PollDetailState.updated({required Poll poll}) = PollUpdated;
  const factory PollDetailState.deleted({required int pollId}) = PollDeleted;
  const factory PollDetailState.failure({required String error}) =
      PollDetailFailure;
}
