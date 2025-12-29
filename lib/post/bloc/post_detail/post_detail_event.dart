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

  const factory PostDetailEvent.reported({
    required Map<String, dynamic> payload,
  }) = _Reported;

  const factory PostDetailEvent.create({
    required String body,
    required PostStatus status,
    required Post? repostOf,
    required Post? replyTo,
    required Post? communityNoteOf,
    required Ballot? ballot,
    required Survey? survey,
    required Petition? petition,
    required Meeting? meeting,
    required List<Map> tags,
  }) = _Create;

  const factory PostDetailEvent.get({required Post post}) = _Get;

  const factory PostDetailEvent.update({
    required int id,
    required String body,
    required PostStatus status,
    required List<Map> tags,
  }) = _Update;

  const factory PostDetailEvent.like({required Post post}) = _Like;

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
}
