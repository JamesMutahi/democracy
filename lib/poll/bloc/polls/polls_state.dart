part of 'polls_cubit.dart';

@freezed
class PollsState with _$PollsState {
  const factory PollsState.initial() = PollsInitial;
  const factory PollsState.loading() = PollsLoading;
  const factory PollsState.loaded({required List<Poll> polls}) = PollsLoaded;
  const factory PollsState.failure({required String error}) = PollsFailure;
}
