part of 'websocket_bloc.dart';

@freezed
class WebsocketEvent with _$WebsocketEvent {
  const factory WebsocketEvent.connect() = _Connect;
  const factory WebsocketEvent.changeState({required WebsocketState state}) =
      _ChangeState;
  const factory WebsocketEvent.createPost({required String body}) = _CreatePost;
  const factory WebsocketEvent.updatePost({
    required int id,
    required String body,
  }) = _UpdatePost;
  const factory WebsocketEvent.likePost({required Post post}) = _LikePost;
  const factory WebsocketEvent.bookmarkPost({required Post post}) =
      _BookmarkPost;
  const factory WebsocketEvent.deletePost({required Post post}) = _DeletePost;
  const factory WebsocketEvent.reportPost({required Post post}) = _ReportPost;
  const factory WebsocketEvent.getReplies({required Post post}) = _GetReplies;
  const factory WebsocketEvent.loadProfile({required User user}) = _LoadProfile;
  const factory WebsocketEvent.loadBookmarks({required User user}) =
      _LoadBookmarks;
}
