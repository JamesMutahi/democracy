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
  const factory WebsocketEvent.loadUserPosts({required User user}) =
      _LoadUserPosts;
  const factory WebsocketEvent.loadBookmarks({required User user}) =
      _LoadBookmarks;
  const factory WebsocketEvent.loadLikedPosts({required User user}) =
      _LoadLikedPosts;
  const factory WebsocketEvent.loadUserReplies({required User user}) =
      _LoadUserReplies;
  const factory WebsocketEvent.loadRooms() = _LoadRooms;
  const factory WebsocketEvent.createRoom({required List<User> users}) =
      _CreateRoom;
  const factory WebsocketEvent.createMessage({
    required Room room,
    required String message,
  }) = _CreateMessage;
}
