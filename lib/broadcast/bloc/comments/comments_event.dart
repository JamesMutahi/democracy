part of 'comments_bloc.dart';

@freezed
class CommentsEvent with _$CommentsEvent {
  const factory CommentsEvent.get({
    required int broadcastId,
    Comment? oldestComment,
    Comment? newestComment,
  }) = _Get;
  const factory CommentsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory CommentsEvent.add({required Comment comment}) = _Add;
  const factory CommentsEvent.update({required Comment comment}) = _Update;
  const factory CommentsEvent.remove({required int commentId}) = _Remove;
}
