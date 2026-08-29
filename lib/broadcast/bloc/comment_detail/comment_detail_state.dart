part of 'comment_detail_bloc.dart';

@freezed
class CommentDetailState with _$CommentDetailState {
  const factory CommentDetailState.initial() = CommentDetailInitial;

  const factory CommentDetailState.loading() = CommentDetailLoading;

  const factory CommentDetailState.created({required Comment comment}) =
      CommentCreated;

  const factory CommentDetailState.updated({required Comment comment}) =
      CommentUpdated;

  const factory CommentDetailState.deleted({required int commentId}) =
      CommentDeleted;

  const factory CommentDetailState.failure({required String error}) =
      CommentDetailFailure;
}
