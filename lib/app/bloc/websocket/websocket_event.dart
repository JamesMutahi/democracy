part of 'websocket_bloc.dart';

@freezed
abstract class WebsocketEvent with _$WebsocketEvent {
  const factory WebsocketEvent.connect() = _Connect;

  const factory WebsocketEvent.changeState({required WebsocketState state}) =
      _ChangeState;

  const factory WebsocketEvent.unsubscribeUsers({required List<User> users}) =
      _UnsubscribeUsers;

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
    Petition? petition,
  }) = _CreateMessage;

  const factory WebsocketEvent.sendDirectMessage({
    required List<User> users,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
  }) = _SendDirectMessage;

  const factory WebsocketEvent.editMessage({
    required int messageId,
    required String text,
  }) = _EditMessage;

  const factory WebsocketEvent.deleteMessage({
    required List<Message> messages,
  }) = _DeleteMessage;

  const factory WebsocketEvent.markChatAsRead({required Chat chat}) =
      _MarkChatAsRead;

  const factory WebsocketEvent.getSurveys({
    String? searchTerm,
    Survey? lastSurvey,
  }) = _GetSurveys;

  const factory WebsocketEvent.submitResponse({
    required Survey survey,
    required DateTime startTime,
    required DateTime endTime,
    required List<TextAnswer> textAnswers,
    required List<ChoiceAnswer> choiceAnswers,
  }) = _SubmitResponse;

  const factory WebsocketEvent.getUsers({String? searchTerm, User? lastUser}) =
      _GetUsers;

  const factory WebsocketEvent.resubscribeUsers({required List<User> users}) =
      _ResubscribeUsers;

  const factory WebsocketEvent.getFollowers({
    required User user,
    User? lastUser,
  }) = _GetFollowers;

  const factory WebsocketEvent.getFollowing({
    required User user,
    User? lastUser,
  }) = _GetFollowing;

  const factory WebsocketEvent.getMuted({User? lastUser}) = _GetMuted;

  const factory WebsocketEvent.getBlocked({User? lastUser}) = _GetBlocked;

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

  const factory WebsocketEvent.createPetition({
    required String title,
    required String imagePath,
    required String description,
  }) = _CreatePetition;

  const factory WebsocketEvent.resubscribePetitions({
    required List<Petition> petitions,
  }) = _ResubscribePetitions;

  const factory WebsocketEvent.supportPetition({required Petition petition}) =
      _SupportPetition;

  const factory WebsocketEvent.getPetitionSupporters({
    required Petition petition,
    User? lastUser,
  }) = _GetPetitionSupporters;

  const factory WebsocketEvent.getUserPetitions({
    required User user,
    Petition? lastPetition,
  }) = _GetUserPetitions;

  const factory WebsocketEvent.resubscribeUserPetitions({
    required User user,
    required List<Petition> petitions,
  }) = _ResubscribeUserPetitions;

  const factory WebsocketEvent.unsubscribeUserPetitions({
    required User user,
    required List<Petition> petitions,
  }) = _UnsubscribeUserPetitions;

  const factory WebsocketEvent.getConstitution() = _GetConstitution;

  const factory WebsocketEvent.getConstitutionTags({String? searchTerm}) =
      _GetConstitutionTags;

  const factory WebsocketEvent.bookmarkSection({required Section section}) =
      _BookmarkSection;

  const factory WebsocketEvent.disconnect() = _Disconnect;
}
