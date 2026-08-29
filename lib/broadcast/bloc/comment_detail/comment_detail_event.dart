part of 'comment_detail_bloc.dart';

@freezed
sealed class CommentDetailEvent with _$CommentDetailEvent {
  const factory CommentDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;
  const factory CommentDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;
  const factory CommentDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;
  const factory CommentDetailEvent.create({
    required int broadcastId,
    required String text,
  }) = _Create;
    const factory CommentDetailEvent.delete({
    required Comment comment,
  }) = _Delete;
}
