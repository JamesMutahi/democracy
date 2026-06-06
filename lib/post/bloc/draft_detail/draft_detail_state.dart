part of 'draft_detail_bloc.dart';

@freezed
class DraftDetailState with _$DraftDetailState {
  const factory DraftDetailState.initial() = _Initial;
  const factory DraftDetailState.loading() = _Loading;
  const factory DraftDetailState.saved({required DraftPost draft}) = DraftSaved;
  const factory DraftDetailState.deleted({required DraftPost draft}) =
      DraftDeleted;
  const factory DraftDetailState.cleared() = DraftsCleared;
  const factory DraftDetailState.failure({required String error}) =
      DraftDetailFailure;
}
