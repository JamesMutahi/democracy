part of 'draft_post_bloc.dart';

@freezed
class DraftPostState with _$DraftPostState {
  const factory DraftPostState.initial() = _Initial;
  const factory DraftPostState.loading() = _Loading;
  const factory DraftPostState.saved({required DraftPost draft}) =
      DraftPostSaved;
  const factory DraftPostState.deleted({required DraftPost draft}) =
      DraftPostDeleted;
  const factory DraftPostState.cleared() = DraftPostsCleared;
  const factory DraftPostState.failure({required String error}) =
      DraftPostFailure;
}
