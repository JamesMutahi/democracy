part of 'draft_post_bloc.dart';

@freezed
class DraftPostState with _$DraftPostState {
  const factory DraftPostState.initial() = _Initial;
  const factory DraftPostState.loading() = _Loading;
  const factory DraftPostState.saved({required DraftPost draft}) = DraftSaved;
  const factory DraftPostState.deleted({required DraftPost draft}) =
      DraftDeleted;
  const factory DraftPostState.failure({required String error}) = DraftFailure;
}
