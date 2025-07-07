part of 'websocket_bloc.dart';

@freezed
abstract class WebsocketEvent with _$WebsocketEvent {
  const factory WebsocketEvent.connect() = _Connect;
  const factory WebsocketEvent.changeState({required WebsocketState state}) =
      _ChangeState;
  const factory WebsocketEvent.createPost({
    required String body,
    required PostStatus status,
    required Post? repostOf,
    required Post? replyTo,
    required Poll? poll,
    required Survey? survey,
  }) = _CreatePost;
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
  const factory WebsocketEvent.loadChats() = _LoadChats;
  const factory WebsocketEvent.createChat({required User user}) = _CreateChat;
  const factory WebsocketEvent.createMessage({
    required Chat chat,
    required String text,
  }) = _CreateMessage;
  const factory WebsocketEvent.editMessage({
    required int messageId,
    required String text,
  }) = _EditMessage;
  const factory WebsocketEvent.deleteMessage({
    required List<Message> messages,
  }) = _DeleteMessage;
  const factory WebsocketEvent.markAsRead({required Chat chat}) = _MarkAsRead;
  const factory WebsocketEvent.userBlocked({required User user}) = _UserBlocked;
  const factory WebsocketEvent.getPolls() = _GetPolls;
  const factory WebsocketEvent.vote({required Option option}) = _Vote;
  const factory WebsocketEvent.submitReason({
    required Poll poll,
    required String text,
  }) = _SubmitReason;
  const factory WebsocketEvent.getSurveys() = _GetSurveys;
  const factory WebsocketEvent.submitResponse({
    required Survey survey,
    required DateTime startTime,
    required DateTime endTime,
    required List<TextAnswer> textAnswers,
    required List<ChoiceAnswer> choiceAnswers,
  }) = _SubmitResponse;
  const factory WebsocketEvent.unsubscribeReplies({required Post post}) =
      _UnsubscribeReplies;
  const factory WebsocketEvent.disconnect() = _Disconnect;
}
