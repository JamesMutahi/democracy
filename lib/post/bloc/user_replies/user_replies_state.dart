part of 'user_replies_cubit.dart';

@freezed
class UserRepliesState with _$UserRepliesState {
  const factory UserRepliesState.initial() = UserRepliesInitial;
  const factory UserRepliesState.loading() = UserRepliesLoading;
  const factory UserRepliesState.loaded({
    required int userId,
    required List<Post> posts,
  }) = UserRepliesLoaded;
  const factory UserRepliesState.failure({required int userId}) =
      UserRepliesFailure;
}
