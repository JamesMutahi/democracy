part of 'vote_cubit.dart';

@freezed
class VoteState with _$VoteState {
  const factory VoteState.initial() = _Initial;
  const factory VoteState.loading() = _Loading;
  const factory VoteState.voted({required Poll poll}) = PollVoted;
  const factory VoteState.failure({required String error}) = _Failure;
}
