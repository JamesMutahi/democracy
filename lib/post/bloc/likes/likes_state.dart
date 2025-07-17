part of 'likes_cubit.dart';

@freezed
class LikesState with _$LikesState {
  const factory LikesState.initial() = LikesInitial;
  const factory LikesState.loading() = LikesLoading;
  const factory LikesState.loaded({
    required int userId,
    required List<Post> posts,
  }) = LikesLoaded;
  const factory LikesState.failure({required int userId}) = LikesFailure;
}
