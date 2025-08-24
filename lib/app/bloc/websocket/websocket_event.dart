part of 'websocket_bloc.dart';

@freezed
abstract class WebsocketEvent with _$WebsocketEvent {
  const factory WebsocketEvent.connect() = _Connect;

  const factory WebsocketEvent.changeState({required WebsocketState state}) =
      _ChangeState;

  const factory WebsocketEvent.getPosts({String? searchTerm, Post? lastPost}) =
      _GetPosts;

  const factory WebsocketEvent.getForYouPosts() = _GetForYouPosts;

  const factory WebsocketEvent.resubscribePosts({required List<Post> posts}) =
      _ResubscribePosts;

  const factory WebsocketEvent.resubscribeUserPosts({
    required User user,
    required List<Post> posts,
  }) = _ResubscribeUserPosts;

  const factory WebsocketEvent.resubscribeReplies({
    required Post post,
    required List<Post> replies,
  }) = _ResubscribeReplies;

  const factory WebsocketEvent.createPost({
    required String body,
    required PostStatus status,
    required Post? repostOf,
    required Post? replyTo,
    required Ballot? ballot,
    required Survey? survey,
    required List<int> taggedUserIds,
  }) = _CreatePost;

  const factory WebsocketEvent.getPost({required Post post}) = _GetPost;

  const factory WebsocketEvent.updatePost({
    required int id,
    required String body,
  }) = _UpdatePost;

  const factory WebsocketEvent.likePost({required Post post}) = _LikePost;

  const factory WebsocketEvent.bookmarkPost({required Post post}) =
      _BookmarkPost;

  const factory WebsocketEvent.deletePost({required Post post}) = _DeletePost;

  const factory WebsocketEvent.reportPost({
    required String issue,
    required Post post,
  }) = _ReportPost;

  const factory WebsocketEvent.getFollowingPosts({Post? lastPost}) =
      _GetFollowingPosts;

  const factory WebsocketEvent.getReplies({
    required Post post,
    Post? lastPost,
  }) = _GetReplies;

  const factory WebsocketEvent.unsubscribeReplies({required Post post}) =
      _UnsubscribeReplies;

  const factory WebsocketEvent.getUserPosts({
    required User user,
    Post? lastPost,
  }) = _GetUserPosts;

  const factory WebsocketEvent.getBookmarks({
    required User user,
    Post? lastPost,
  }) = _GetBookmarks;

  const factory WebsocketEvent.getLikedPosts({
    required User user,
    Post? lastPost,
  }) = _GetLikedPosts;

  const factory WebsocketEvent.getDraftPosts({Post? lastPost}) = _GetDraftPosts;

  const factory WebsocketEvent.getUserReplies({
    required User user,
    Post? lastPost,
  }) = _GetUserReplies;

  const factory WebsocketEvent.unsubscribeUsers({required List<User> users}) =
      _UnsubscribeUsers;

  const factory WebsocketEvent.unsubscribeUserPosts({
    required User user,
    required List<Post> posts,
  }) = _UnsubscribeUserPosts;

  const factory WebsocketEvent.getChats({String? searchTerm, Chat? lastChat}) =
      _GetChats;

  const factory WebsocketEvent.resubscribeChats({required List<Chat> chats}) =
      _ResubscribeChats;

  const factory WebsocketEvent.getChat({required Chat chat}) = _GetChat;

  const factory WebsocketEvent.createChat({required User user}) = _CreateChat;

  const factory WebsocketEvent.subscribeChat({required Chat chat}) =
      _SubscribeChat;

  const factory WebsocketEvent.getMessages({
    required Chat chat,
    Message? lastMessage,
  }) = _GetMessages;

  const factory WebsocketEvent.createMessage({
    required Chat chat,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
  }) = _CreateMessage;

  const factory WebsocketEvent.editMessage({
    required int messageId,
    required String text,
  }) = _EditMessage;

  const factory WebsocketEvent.deleteMessage({
    required List<Message> messages,
  }) = _DeleteMessage;

  const factory WebsocketEvent.markChatAsRead({required Chat chat}) =
      _MarkChatAsRead;

  const factory WebsocketEvent.getBallots({
    String? searchTerm,
    Ballot? lastBallot,
  }) = _GetBallots;

  const factory WebsocketEvent.resubscribeBallots({
    required List<Ballot> ballots,
  }) = _ResubscribeBallots;

  const factory WebsocketEvent.subscribeBallot({required Ballot ballot}) =
      _SubscribeBallot;

  const factory WebsocketEvent.vote({required Option option}) = _Vote;

  const factory WebsocketEvent.submitReason({
    required Ballot ballot,
    required String text,
  }) = _SubmitReason;

  const factory WebsocketEvent.getSurveys({
    String? searchTerm,
    Survey? lastSurvey,
  }) = _GetSurveys;

  const factory WebsocketEvent.resubscribeSurveys({
    required List<Survey> surveys,
  }) = _ResubscribeSurveys;

  const factory WebsocketEvent.submitResponse({
    required Survey survey,
    required DateTime startTime,
    required DateTime endTime,
    required List<TextAnswer> textAnswers,
    required List<ChoiceAnswer> choiceAnswers,
  }) = _SubmitResponse;

  const factory WebsocketEvent.getUsers({String? searchTerm, int? page}) =
      _GetUsers;

  const factory WebsocketEvent.resubscribeUsers({required List<User> users}) =
      _ResubscribeUsers;

  const factory WebsocketEvent.getFollowers({required User user, int? page}) =
      _GetFollowers;

  const factory WebsocketEvent.getFollowing({required User user, int? page}) =
      _GetFollowing;

  const factory WebsocketEvent.getMuted({int? page}) = _GetMuted;

  const factory WebsocketEvent.getBlocked({int? page}) = _GetBlocked;

  const factory WebsocketEvent.getUser({required User user}) = _GetUser;

  const factory WebsocketEvent.updateUser({
    required User user,
    required String name,
    required String status,
    required String? imagePath,
    required String? coverPhotoPath,
  }) = _UpdateUser;

  const factory WebsocketEvent.muteUser({required int id}) = _MuteUser;

  const factory WebsocketEvent.blockUser({required int id}) = _BlockUser;

  const factory WebsocketEvent.followUser({required User user}) = _FollowUser;

  const factory WebsocketEvent.sendDirectMessage({
    required List<User> users,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
  }) = _SendDirectMessage;

  const factory WebsocketEvent.getNotifications() = _GetNotifications;

  const factory WebsocketEvent.markNotificationAsRead({
    required Notification notification,
  }) = _MarkNotificationAsRead;

  const factory WebsocketEvent.getPreferences() = _GetPreferences;

  const factory WebsocketEvent.updatePreferences({
    required bool allowNotifications,
    required bool allowTagNotifications,
    required bool allowLikeNotifications,
    required bool allowReplyNotifications,
    required bool allowRepostNotifications,
    required bool allowMessageNotifications,
    required bool allowFollowNotifications,
  }) = _UpdatePreferences;

  const factory WebsocketEvent.changeUserNotificationStatus({
    required User user,
  }) = _ChangeUserNotificationStatus;

  const factory WebsocketEvent.getPetitions({
    String? searchTerm,
    Petition? lastPetition,
  }) = _GetPetitions;
  const factory WebsocketEvent.resubscribePetitions({
    required List<Petition> petitions,
  }) = _ResubscribePetitions;
  const factory WebsocketEvent.supportPetition({required Petition petition}) =
      _SupportPetition;
  const factory WebsocketEvent.disconnect() = _Disconnect;
}
