part of 'replies_cubit.dart';

@freezed
class RepliesState with _$RepliesState {
  const factory RepliesState.initial() = RepliesInitial;
  const factory RepliesState.loading() = RepliesLoading;
  const factory RepliesState.loaded({
    required int postId,
    required List<Post> posts,
  }) = RepliesLoaded;
  const factory RepliesState.failure({required int? postId}) = RepliesFailure;
}
