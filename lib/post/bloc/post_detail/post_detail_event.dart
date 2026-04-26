part of 'post_detail_bloc.dart';

@freezed
sealed class PostDetailEvent with _$PostDetailEvent {
  const factory PostDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;

  const factory PostDetailEvent.loaded({
    required Map<String, dynamic> payload,
  }) = _Loaded;

  const factory PostDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;

  const factory PostDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;

  const factory PostDetailEvent.repostDeleted({
    required Map<String, dynamic> payload,
  }) = _RepostDeleted;

  const factory PostDetailEvent.reported({
    required Map<String, dynamic> payload,
  }) = _Reported;

  const factory PostDetailEvent.liked({required Map<String, dynamic> payload}) =
      _Liked;

  const factory PostDetailEvent.bookmarked({
    required Map<String, dynamic> payload,
  }) = _Bookmarked;

  const factory PostDetailEvent.upvoted({
    required Map<String, dynamic> payload,
  }) = _Upvoted;

  const factory PostDetailEvent.downvoted({
    required Map<String, dynamic> payload,
  }) = _Downvoted;

  const factory PostDetailEvent.viewAdded({
    required Map<String, dynamic> payload,
  }) = _ViewAdded;

  const factory PostDetailEvent.clickAdded({
    required Map<String, dynamic> payload,
  }) = _ClickAdded;

  const factory PostDetailEvent.muted({required Map<String, dynamic> payload}) =
      _Muted;

  const factory PostDetailEvent.get({required Post post}) = _Get;

  const factory PostDetailEvent.addView({required Post post}) = _AddView;

  const factory PostDetailEvent.addClick({required Post post}) = _AddClick;

  const factory PostDetailEvent.like({required Post post}) = _Like;

  const factory PostDetailEvent.mute({required Post post}) = _Mute;

  const factory PostDetailEvent.bookmark({required Post post}) = _Bookmark;

  const factory PostDetailEvent.upvote({required Post post}) = _Upvote;

  const factory PostDetailEvent.downvote({required Post post}) = _Downvote;

  const factory PostDetailEvent.delete({required Post post}) = _Delete;

  const factory PostDetailEvent.deleteRepost({required Post post}) =
      _DeleteRepost;

  const factory PostDetailEvent.report({
    required String issue,
    required Post post,
  }) = _Report;

  const factory PostDetailEvent.unsubscribe({required Post post}) =
      _Unsubscribe;
}
