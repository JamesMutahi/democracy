// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WebsocketEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent()';
}


}

/// @nodoc
class $WebsocketEventCopyWith<$Res>  {
$WebsocketEventCopyWith(WebsocketEvent _, $Res Function(WebsocketEvent) __);
}


/// Adds pattern-matching-related methods to [WebsocketEvent].
extension WebsocketEventPatterns on WebsocketEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Connect value)?  connect,TResult Function( _ChangeState value)?  changeState,TResult Function( _UnsubscribeUsers value)?  unsubscribeUsers,TResult Function( _GetChats value)?  getChats,TResult Function( _ResubscribeChats value)?  resubscribeChats,TResult Function( _GetChat value)?  getChat,TResult Function( _CreateChat value)?  createChat,TResult Function( _SubscribeChat value)?  subscribeChat,TResult Function( _GetMessages value)?  getMessages,TResult Function( _CreateMessage value)?  createMessage,TResult Function( _SendDirectMessage value)?  sendDirectMessage,TResult Function( _EditMessage value)?  editMessage,TResult Function( _DeleteMessage value)?  deleteMessage,TResult Function( _MarkChatAsRead value)?  markChatAsRead,TResult Function( _GetBallots value)?  getBallots,TResult Function( _Vote value)?  vote,TResult Function( _SubmitReason value)?  submitReason,TResult Function( _GetSurveys value)?  getSurveys,TResult Function( _SubmitResponse value)?  submitResponse,TResult Function( _GetUsers value)?  getUsers,TResult Function( _ResubscribeUsers value)?  resubscribeUsers,TResult Function( _GetFollowers value)?  getFollowers,TResult Function( _GetFollowing value)?  getFollowing,TResult Function( _GetMuted value)?  getMuted,TResult Function( _GetBlocked value)?  getBlocked,TResult Function( _GetUser value)?  getUser,TResult Function( _UpdateUser value)?  updateUser,TResult Function( _MuteUser value)?  muteUser,TResult Function( _BlockUser value)?  blockUser,TResult Function( _FollowUser value)?  followUser,TResult Function( _GetNotifications value)?  getNotifications,TResult Function( _MarkNotificationAsRead value)?  markNotificationAsRead,TResult Function( _GetPreferences value)?  getPreferences,TResult Function( _UpdatePreferences value)?  updatePreferences,TResult Function( _ChangeUserNotificationStatus value)?  changeUserNotificationStatus,TResult Function( _GetPetitions value)?  getPetitions,TResult Function( _CreatePetition value)?  createPetition,TResult Function( _ResubscribePetitions value)?  resubscribePetitions,TResult Function( _SupportPetition value)?  supportPetition,TResult Function( _GetPetitionSupporters value)?  getPetitionSupporters,TResult Function( _GetUserPetitions value)?  getUserPetitions,TResult Function( _ResubscribeUserPetitions value)?  resubscribeUserPetitions,TResult Function( _UnsubscribeUserPetitions value)?  unsubscribeUserPetitions,TResult Function( _GetConstitution value)?  getConstitution,TResult Function( _GetConstitutionTags value)?  getConstitutionTags,TResult Function( _BookmarkSection value)?  bookmarkSection,TResult Function( _Disconnect value)?  disconnect,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _UnsubscribeUsers() when unsubscribeUsers != null:
return unsubscribeUsers(_that);case _GetChats() when getChats != null:
return getChats(_that);case _ResubscribeChats() when resubscribeChats != null:
return resubscribeChats(_that);case _GetChat() when getChat != null:
return getChat(_that);case _CreateChat() when createChat != null:
return createChat(_that);case _SubscribeChat() when subscribeChat != null:
return subscribeChat(_that);case _GetMessages() when getMessages != null:
return getMessages(_that);case _CreateMessage() when createMessage != null:
return createMessage(_that);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that);case _EditMessage() when editMessage != null:
return editMessage(_that);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case _MarkChatAsRead() when markChatAsRead != null:
return markChatAsRead(_that);case _GetBallots() when getBallots != null:
return getBallots(_that);case _Vote() when vote != null:
return vote(_that);case _SubmitReason() when submitReason != null:
return submitReason(_that);case _GetSurveys() when getSurveys != null:
return getSurveys(_that);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that);case _GetUsers() when getUsers != null:
return getUsers(_that);case _ResubscribeUsers() when resubscribeUsers != null:
return resubscribeUsers(_that);case _GetFollowers() when getFollowers != null:
return getFollowers(_that);case _GetFollowing() when getFollowing != null:
return getFollowing(_that);case _GetMuted() when getMuted != null:
return getMuted(_that);case _GetBlocked() when getBlocked != null:
return getBlocked(_that);case _GetUser() when getUser != null:
return getUser(_that);case _UpdateUser() when updateUser != null:
return updateUser(_that);case _MuteUser() when muteUser != null:
return muteUser(_that);case _BlockUser() when blockUser != null:
return blockUser(_that);case _FollowUser() when followUser != null:
return followUser(_that);case _GetNotifications() when getNotifications != null:
return getNotifications(_that);case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that);case _GetPreferences() when getPreferences != null:
return getPreferences(_that);case _UpdatePreferences() when updatePreferences != null:
return updatePreferences(_that);case _ChangeUserNotificationStatus() when changeUserNotificationStatus != null:
return changeUserNotificationStatus(_that);case _GetPetitions() when getPetitions != null:
return getPetitions(_that);case _CreatePetition() when createPetition != null:
return createPetition(_that);case _ResubscribePetitions() when resubscribePetitions != null:
return resubscribePetitions(_that);case _SupportPetition() when supportPetition != null:
return supportPetition(_that);case _GetPetitionSupporters() when getPetitionSupporters != null:
return getPetitionSupporters(_that);case _GetUserPetitions() when getUserPetitions != null:
return getUserPetitions(_that);case _ResubscribeUserPetitions() when resubscribeUserPetitions != null:
return resubscribeUserPetitions(_that);case _UnsubscribeUserPetitions() when unsubscribeUserPetitions != null:
return unsubscribeUserPetitions(_that);case _GetConstitution() when getConstitution != null:
return getConstitution(_that);case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that);case _Disconnect() when disconnect != null:
return disconnect(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Connect value)  connect,required TResult Function( _ChangeState value)  changeState,required TResult Function( _UnsubscribeUsers value)  unsubscribeUsers,required TResult Function( _GetChats value)  getChats,required TResult Function( _ResubscribeChats value)  resubscribeChats,required TResult Function( _GetChat value)  getChat,required TResult Function( _CreateChat value)  createChat,required TResult Function( _SubscribeChat value)  subscribeChat,required TResult Function( _GetMessages value)  getMessages,required TResult Function( _CreateMessage value)  createMessage,required TResult Function( _SendDirectMessage value)  sendDirectMessage,required TResult Function( _EditMessage value)  editMessage,required TResult Function( _DeleteMessage value)  deleteMessage,required TResult Function( _MarkChatAsRead value)  markChatAsRead,required TResult Function( _GetBallots value)  getBallots,required TResult Function( _Vote value)  vote,required TResult Function( _SubmitReason value)  submitReason,required TResult Function( _GetSurveys value)  getSurveys,required TResult Function( _SubmitResponse value)  submitResponse,required TResult Function( _GetUsers value)  getUsers,required TResult Function( _ResubscribeUsers value)  resubscribeUsers,required TResult Function( _GetFollowers value)  getFollowers,required TResult Function( _GetFollowing value)  getFollowing,required TResult Function( _GetMuted value)  getMuted,required TResult Function( _GetBlocked value)  getBlocked,required TResult Function( _GetUser value)  getUser,required TResult Function( _UpdateUser value)  updateUser,required TResult Function( _MuteUser value)  muteUser,required TResult Function( _BlockUser value)  blockUser,required TResult Function( _FollowUser value)  followUser,required TResult Function( _GetNotifications value)  getNotifications,required TResult Function( _MarkNotificationAsRead value)  markNotificationAsRead,required TResult Function( _GetPreferences value)  getPreferences,required TResult Function( _UpdatePreferences value)  updatePreferences,required TResult Function( _ChangeUserNotificationStatus value)  changeUserNotificationStatus,required TResult Function( _GetPetitions value)  getPetitions,required TResult Function( _CreatePetition value)  createPetition,required TResult Function( _ResubscribePetitions value)  resubscribePetitions,required TResult Function( _SupportPetition value)  supportPetition,required TResult Function( _GetPetitionSupporters value)  getPetitionSupporters,required TResult Function( _GetUserPetitions value)  getUserPetitions,required TResult Function( _ResubscribeUserPetitions value)  resubscribeUserPetitions,required TResult Function( _UnsubscribeUserPetitions value)  unsubscribeUserPetitions,required TResult Function( _GetConstitution value)  getConstitution,required TResult Function( _GetConstitutionTags value)  getConstitutionTags,required TResult Function( _BookmarkSection value)  bookmarkSection,required TResult Function( _Disconnect value)  disconnect,}){
final _that = this;
switch (_that) {
case _Connect():
return connect(_that);case _ChangeState():
return changeState(_that);case _UnsubscribeUsers():
return unsubscribeUsers(_that);case _GetChats():
return getChats(_that);case _ResubscribeChats():
return resubscribeChats(_that);case _GetChat():
return getChat(_that);case _CreateChat():
return createChat(_that);case _SubscribeChat():
return subscribeChat(_that);case _GetMessages():
return getMessages(_that);case _CreateMessage():
return createMessage(_that);case _SendDirectMessage():
return sendDirectMessage(_that);case _EditMessage():
return editMessage(_that);case _DeleteMessage():
return deleteMessage(_that);case _MarkChatAsRead():
return markChatAsRead(_that);case _GetBallots():
return getBallots(_that);case _Vote():
return vote(_that);case _SubmitReason():
return submitReason(_that);case _GetSurveys():
return getSurveys(_that);case _SubmitResponse():
return submitResponse(_that);case _GetUsers():
return getUsers(_that);case _ResubscribeUsers():
return resubscribeUsers(_that);case _GetFollowers():
return getFollowers(_that);case _GetFollowing():
return getFollowing(_that);case _GetMuted():
return getMuted(_that);case _GetBlocked():
return getBlocked(_that);case _GetUser():
return getUser(_that);case _UpdateUser():
return updateUser(_that);case _MuteUser():
return muteUser(_that);case _BlockUser():
return blockUser(_that);case _FollowUser():
return followUser(_that);case _GetNotifications():
return getNotifications(_that);case _MarkNotificationAsRead():
return markNotificationAsRead(_that);case _GetPreferences():
return getPreferences(_that);case _UpdatePreferences():
return updatePreferences(_that);case _ChangeUserNotificationStatus():
return changeUserNotificationStatus(_that);case _GetPetitions():
return getPetitions(_that);case _CreatePetition():
return createPetition(_that);case _ResubscribePetitions():
return resubscribePetitions(_that);case _SupportPetition():
return supportPetition(_that);case _GetPetitionSupporters():
return getPetitionSupporters(_that);case _GetUserPetitions():
return getUserPetitions(_that);case _ResubscribeUserPetitions():
return resubscribeUserPetitions(_that);case _UnsubscribeUserPetitions():
return unsubscribeUserPetitions(_that);case _GetConstitution():
return getConstitution(_that);case _GetConstitutionTags():
return getConstitutionTags(_that);case _BookmarkSection():
return bookmarkSection(_that);case _Disconnect():
return disconnect(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Connect value)?  connect,TResult? Function( _ChangeState value)?  changeState,TResult? Function( _UnsubscribeUsers value)?  unsubscribeUsers,TResult? Function( _GetChats value)?  getChats,TResult? Function( _ResubscribeChats value)?  resubscribeChats,TResult? Function( _GetChat value)?  getChat,TResult? Function( _CreateChat value)?  createChat,TResult? Function( _SubscribeChat value)?  subscribeChat,TResult? Function( _GetMessages value)?  getMessages,TResult? Function( _CreateMessage value)?  createMessage,TResult? Function( _SendDirectMessage value)?  sendDirectMessage,TResult? Function( _EditMessage value)?  editMessage,TResult? Function( _DeleteMessage value)?  deleteMessage,TResult? Function( _MarkChatAsRead value)?  markChatAsRead,TResult? Function( _GetBallots value)?  getBallots,TResult? Function( _Vote value)?  vote,TResult? Function( _SubmitReason value)?  submitReason,TResult? Function( _GetSurveys value)?  getSurveys,TResult? Function( _SubmitResponse value)?  submitResponse,TResult? Function( _GetUsers value)?  getUsers,TResult? Function( _ResubscribeUsers value)?  resubscribeUsers,TResult? Function( _GetFollowers value)?  getFollowers,TResult? Function( _GetFollowing value)?  getFollowing,TResult? Function( _GetMuted value)?  getMuted,TResult? Function( _GetBlocked value)?  getBlocked,TResult? Function( _GetUser value)?  getUser,TResult? Function( _UpdateUser value)?  updateUser,TResult? Function( _MuteUser value)?  muteUser,TResult? Function( _BlockUser value)?  blockUser,TResult? Function( _FollowUser value)?  followUser,TResult? Function( _GetNotifications value)?  getNotifications,TResult? Function( _MarkNotificationAsRead value)?  markNotificationAsRead,TResult? Function( _GetPreferences value)?  getPreferences,TResult? Function( _UpdatePreferences value)?  updatePreferences,TResult? Function( _ChangeUserNotificationStatus value)?  changeUserNotificationStatus,TResult? Function( _GetPetitions value)?  getPetitions,TResult? Function( _CreatePetition value)?  createPetition,TResult? Function( _ResubscribePetitions value)?  resubscribePetitions,TResult? Function( _SupportPetition value)?  supportPetition,TResult? Function( _GetPetitionSupporters value)?  getPetitionSupporters,TResult? Function( _GetUserPetitions value)?  getUserPetitions,TResult? Function( _ResubscribeUserPetitions value)?  resubscribeUserPetitions,TResult? Function( _UnsubscribeUserPetitions value)?  unsubscribeUserPetitions,TResult? Function( _GetConstitution value)?  getConstitution,TResult? Function( _GetConstitutionTags value)?  getConstitutionTags,TResult? Function( _BookmarkSection value)?  bookmarkSection,TResult? Function( _Disconnect value)?  disconnect,}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _UnsubscribeUsers() when unsubscribeUsers != null:
return unsubscribeUsers(_that);case _GetChats() when getChats != null:
return getChats(_that);case _ResubscribeChats() when resubscribeChats != null:
return resubscribeChats(_that);case _GetChat() when getChat != null:
return getChat(_that);case _CreateChat() when createChat != null:
return createChat(_that);case _SubscribeChat() when subscribeChat != null:
return subscribeChat(_that);case _GetMessages() when getMessages != null:
return getMessages(_that);case _CreateMessage() when createMessage != null:
return createMessage(_that);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that);case _EditMessage() when editMessage != null:
return editMessage(_that);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case _MarkChatAsRead() when markChatAsRead != null:
return markChatAsRead(_that);case _GetBallots() when getBallots != null:
return getBallots(_that);case _Vote() when vote != null:
return vote(_that);case _SubmitReason() when submitReason != null:
return submitReason(_that);case _GetSurveys() when getSurveys != null:
return getSurveys(_that);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that);case _GetUsers() when getUsers != null:
return getUsers(_that);case _ResubscribeUsers() when resubscribeUsers != null:
return resubscribeUsers(_that);case _GetFollowers() when getFollowers != null:
return getFollowers(_that);case _GetFollowing() when getFollowing != null:
return getFollowing(_that);case _GetMuted() when getMuted != null:
return getMuted(_that);case _GetBlocked() when getBlocked != null:
return getBlocked(_that);case _GetUser() when getUser != null:
return getUser(_that);case _UpdateUser() when updateUser != null:
return updateUser(_that);case _MuteUser() when muteUser != null:
return muteUser(_that);case _BlockUser() when blockUser != null:
return blockUser(_that);case _FollowUser() when followUser != null:
return followUser(_that);case _GetNotifications() when getNotifications != null:
return getNotifications(_that);case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that);case _GetPreferences() when getPreferences != null:
return getPreferences(_that);case _UpdatePreferences() when updatePreferences != null:
return updatePreferences(_that);case _ChangeUserNotificationStatus() when changeUserNotificationStatus != null:
return changeUserNotificationStatus(_that);case _GetPetitions() when getPetitions != null:
return getPetitions(_that);case _CreatePetition() when createPetition != null:
return createPetition(_that);case _ResubscribePetitions() when resubscribePetitions != null:
return resubscribePetitions(_that);case _SupportPetition() when supportPetition != null:
return supportPetition(_that);case _GetPetitionSupporters() when getPetitionSupporters != null:
return getPetitionSupporters(_that);case _GetUserPetitions() when getUserPetitions != null:
return getUserPetitions(_that);case _ResubscribeUserPetitions() when resubscribeUserPetitions != null:
return resubscribeUserPetitions(_that);case _UnsubscribeUserPetitions() when unsubscribeUserPetitions != null:
return unsubscribeUserPetitions(_that);case _GetConstitution() when getConstitution != null:
return getConstitution(_that);case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that);case _Disconnect() when disconnect != null:
return disconnect(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connect,TResult Function( WebsocketState state)?  changeState,TResult Function( List<User> users)?  unsubscribeUsers,TResult Function( String? searchTerm,  Chat? lastChat)?  getChats,TResult Function( List<Chat> chats)?  resubscribeChats,TResult Function( Chat chat)?  getChat,TResult Function( User user)?  createChat,TResult Function( Chat chat)?  subscribeChat,TResult Function( Chat chat,  Message? lastMessage)?  getMessages,TResult Function( Chat chat,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition)?  createMessage,TResult Function( List<User> users,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition)?  sendDirectMessage,TResult Function( int messageId,  String text)?  editMessage,TResult Function( List<Message> messages)?  deleteMessage,TResult Function( Chat chat)?  markChatAsRead,TResult Function( String? searchTerm,  Ballot? lastBallot)?  getBallots,TResult Function( Option option)?  vote,TResult Function( Ballot ballot,  String text)?  submitReason,TResult Function( String? searchTerm,  Survey? lastSurvey)?  getSurveys,TResult Function( Survey survey,  DateTime startTime,  DateTime endTime,  List<TextAnswer> textAnswers,  List<ChoiceAnswer> choiceAnswers)?  submitResponse,TResult Function( String? searchTerm,  User? lastUser)?  getUsers,TResult Function( List<User> users)?  resubscribeUsers,TResult Function( User user,  User? lastUser)?  getFollowers,TResult Function( User user,  User? lastUser)?  getFollowing,TResult Function( User? lastUser)?  getMuted,TResult Function( User? lastUser)?  getBlocked,TResult Function( User user)?  getUser,TResult Function( User user,  String name,  String status,  String? imagePath,  String? coverPhotoPath)?  updateUser,TResult Function( int id)?  muteUser,TResult Function( int id)?  blockUser,TResult Function( User user)?  followUser,TResult Function()?  getNotifications,TResult Function( Notification notification)?  markNotificationAsRead,TResult Function()?  getPreferences,TResult Function( bool allowNotifications,  bool allowTagNotifications,  bool allowLikeNotifications,  bool allowReplyNotifications,  bool allowRepostNotifications,  bool allowMessageNotifications,  bool allowFollowNotifications)?  updatePreferences,TResult Function( User user)?  changeUserNotificationStatus,TResult Function( String? searchTerm,  Petition? lastPetition)?  getPetitions,TResult Function( String title,  String imagePath,  String description)?  createPetition,TResult Function( List<Petition> petitions)?  resubscribePetitions,TResult Function( Petition petition)?  supportPetition,TResult Function( Petition petition,  User? lastUser)?  getPetitionSupporters,TResult Function( User user,  Petition? lastPetition)?  getUserPetitions,TResult Function( User user,  List<Petition> petitions)?  resubscribeUserPetitions,TResult Function( User user,  List<Petition> petitions)?  unsubscribeUserPetitions,TResult Function()?  getConstitution,TResult Function( String? searchTerm)?  getConstitutionTags,TResult Function( Section section)?  bookmarkSection,TResult Function()?  disconnect,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _UnsubscribeUsers() when unsubscribeUsers != null:
return unsubscribeUsers(_that.users);case _GetChats() when getChats != null:
return getChats(_that.searchTerm,_that.lastChat);case _ResubscribeChats() when resubscribeChats != null:
return resubscribeChats(_that.chats);case _GetChat() when getChat != null:
return getChat(_that.chat);case _CreateChat() when createChat != null:
return createChat(_that.user);case _SubscribeChat() when subscribeChat != null:
return subscribeChat(_that.chat);case _GetMessages() when getMessages != null:
return getMessages(_that.chat,_that.lastMessage);case _CreateMessage() when createMessage != null:
return createMessage(_that.chat,_that.text,_that.post,_that.ballot,_that.survey,_that.petition);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that.users,_that.text,_that.post,_that.ballot,_that.survey,_that.petition);case _EditMessage() when editMessage != null:
return editMessage(_that.messageId,_that.text);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.messages);case _MarkChatAsRead() when markChatAsRead != null:
return markChatAsRead(_that.chat);case _GetBallots() when getBallots != null:
return getBallots(_that.searchTerm,_that.lastBallot);case _Vote() when vote != null:
return vote(_that.option);case _SubmitReason() when submitReason != null:
return submitReason(_that.ballot,_that.text);case _GetSurveys() when getSurveys != null:
return getSurveys(_that.searchTerm,_that.lastSurvey);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that.survey,_that.startTime,_that.endTime,_that.textAnswers,_that.choiceAnswers);case _GetUsers() when getUsers != null:
return getUsers(_that.searchTerm,_that.lastUser);case _ResubscribeUsers() when resubscribeUsers != null:
return resubscribeUsers(_that.users);case _GetFollowers() when getFollowers != null:
return getFollowers(_that.user,_that.lastUser);case _GetFollowing() when getFollowing != null:
return getFollowing(_that.user,_that.lastUser);case _GetMuted() when getMuted != null:
return getMuted(_that.lastUser);case _GetBlocked() when getBlocked != null:
return getBlocked(_that.lastUser);case _GetUser() when getUser != null:
return getUser(_that.user);case _UpdateUser() when updateUser != null:
return updateUser(_that.user,_that.name,_that.status,_that.imagePath,_that.coverPhotoPath);case _MuteUser() when muteUser != null:
return muteUser(_that.id);case _BlockUser() when blockUser != null:
return blockUser(_that.id);case _FollowUser() when followUser != null:
return followUser(_that.user);case _GetNotifications() when getNotifications != null:
return getNotifications();case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that.notification);case _GetPreferences() when getPreferences != null:
return getPreferences();case _UpdatePreferences() when updatePreferences != null:
return updatePreferences(_that.allowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications,_that.allowFollowNotifications);case _ChangeUserNotificationStatus() when changeUserNotificationStatus != null:
return changeUserNotificationStatus(_that.user);case _GetPetitions() when getPetitions != null:
return getPetitions(_that.searchTerm,_that.lastPetition);case _CreatePetition() when createPetition != null:
return createPetition(_that.title,_that.imagePath,_that.description);case _ResubscribePetitions() when resubscribePetitions != null:
return resubscribePetitions(_that.petitions);case _SupportPetition() when supportPetition != null:
return supportPetition(_that.petition);case _GetPetitionSupporters() when getPetitionSupporters != null:
return getPetitionSupporters(_that.petition,_that.lastUser);case _GetUserPetitions() when getUserPetitions != null:
return getUserPetitions(_that.user,_that.lastPetition);case _ResubscribeUserPetitions() when resubscribeUserPetitions != null:
return resubscribeUserPetitions(_that.user,_that.petitions);case _UnsubscribeUserPetitions() when unsubscribeUserPetitions != null:
return unsubscribeUserPetitions(_that.user,_that.petitions);case _GetConstitution() when getConstitution != null:
return getConstitution();case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that.searchTerm);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that.section);case _Disconnect() when disconnect != null:
return disconnect();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connect,required TResult Function( WebsocketState state)  changeState,required TResult Function( List<User> users)  unsubscribeUsers,required TResult Function( String? searchTerm,  Chat? lastChat)  getChats,required TResult Function( List<Chat> chats)  resubscribeChats,required TResult Function( Chat chat)  getChat,required TResult Function( User user)  createChat,required TResult Function( Chat chat)  subscribeChat,required TResult Function( Chat chat,  Message? lastMessage)  getMessages,required TResult Function( Chat chat,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition)  createMessage,required TResult Function( List<User> users,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition)  sendDirectMessage,required TResult Function( int messageId,  String text)  editMessage,required TResult Function( List<Message> messages)  deleteMessage,required TResult Function( Chat chat)  markChatAsRead,required TResult Function( String? searchTerm,  Ballot? lastBallot)  getBallots,required TResult Function( Option option)  vote,required TResult Function( Ballot ballot,  String text)  submitReason,required TResult Function( String? searchTerm,  Survey? lastSurvey)  getSurveys,required TResult Function( Survey survey,  DateTime startTime,  DateTime endTime,  List<TextAnswer> textAnswers,  List<ChoiceAnswer> choiceAnswers)  submitResponse,required TResult Function( String? searchTerm,  User? lastUser)  getUsers,required TResult Function( List<User> users)  resubscribeUsers,required TResult Function( User user,  User? lastUser)  getFollowers,required TResult Function( User user,  User? lastUser)  getFollowing,required TResult Function( User? lastUser)  getMuted,required TResult Function( User? lastUser)  getBlocked,required TResult Function( User user)  getUser,required TResult Function( User user,  String name,  String status,  String? imagePath,  String? coverPhotoPath)  updateUser,required TResult Function( int id)  muteUser,required TResult Function( int id)  blockUser,required TResult Function( User user)  followUser,required TResult Function()  getNotifications,required TResult Function( Notification notification)  markNotificationAsRead,required TResult Function()  getPreferences,required TResult Function( bool allowNotifications,  bool allowTagNotifications,  bool allowLikeNotifications,  bool allowReplyNotifications,  bool allowRepostNotifications,  bool allowMessageNotifications,  bool allowFollowNotifications)  updatePreferences,required TResult Function( User user)  changeUserNotificationStatus,required TResult Function( String? searchTerm,  Petition? lastPetition)  getPetitions,required TResult Function( String title,  String imagePath,  String description)  createPetition,required TResult Function( List<Petition> petitions)  resubscribePetitions,required TResult Function( Petition petition)  supportPetition,required TResult Function( Petition petition,  User? lastUser)  getPetitionSupporters,required TResult Function( User user,  Petition? lastPetition)  getUserPetitions,required TResult Function( User user,  List<Petition> petitions)  resubscribeUserPetitions,required TResult Function( User user,  List<Petition> petitions)  unsubscribeUserPetitions,required TResult Function()  getConstitution,required TResult Function( String? searchTerm)  getConstitutionTags,required TResult Function( Section section)  bookmarkSection,required TResult Function()  disconnect,}) {final _that = this;
switch (_that) {
case _Connect():
return connect();case _ChangeState():
return changeState(_that.state);case _UnsubscribeUsers():
return unsubscribeUsers(_that.users);case _GetChats():
return getChats(_that.searchTerm,_that.lastChat);case _ResubscribeChats():
return resubscribeChats(_that.chats);case _GetChat():
return getChat(_that.chat);case _CreateChat():
return createChat(_that.user);case _SubscribeChat():
return subscribeChat(_that.chat);case _GetMessages():
return getMessages(_that.chat,_that.lastMessage);case _CreateMessage():
return createMessage(_that.chat,_that.text,_that.post,_that.ballot,_that.survey,_that.petition);case _SendDirectMessage():
return sendDirectMessage(_that.users,_that.text,_that.post,_that.ballot,_that.survey,_that.petition);case _EditMessage():
return editMessage(_that.messageId,_that.text);case _DeleteMessage():
return deleteMessage(_that.messages);case _MarkChatAsRead():
return markChatAsRead(_that.chat);case _GetBallots():
return getBallots(_that.searchTerm,_that.lastBallot);case _Vote():
return vote(_that.option);case _SubmitReason():
return submitReason(_that.ballot,_that.text);case _GetSurveys():
return getSurveys(_that.searchTerm,_that.lastSurvey);case _SubmitResponse():
return submitResponse(_that.survey,_that.startTime,_that.endTime,_that.textAnswers,_that.choiceAnswers);case _GetUsers():
return getUsers(_that.searchTerm,_that.lastUser);case _ResubscribeUsers():
return resubscribeUsers(_that.users);case _GetFollowers():
return getFollowers(_that.user,_that.lastUser);case _GetFollowing():
return getFollowing(_that.user,_that.lastUser);case _GetMuted():
return getMuted(_that.lastUser);case _GetBlocked():
return getBlocked(_that.lastUser);case _GetUser():
return getUser(_that.user);case _UpdateUser():
return updateUser(_that.user,_that.name,_that.status,_that.imagePath,_that.coverPhotoPath);case _MuteUser():
return muteUser(_that.id);case _BlockUser():
return blockUser(_that.id);case _FollowUser():
return followUser(_that.user);case _GetNotifications():
return getNotifications();case _MarkNotificationAsRead():
return markNotificationAsRead(_that.notification);case _GetPreferences():
return getPreferences();case _UpdatePreferences():
return updatePreferences(_that.allowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications,_that.allowFollowNotifications);case _ChangeUserNotificationStatus():
return changeUserNotificationStatus(_that.user);case _GetPetitions():
return getPetitions(_that.searchTerm,_that.lastPetition);case _CreatePetition():
return createPetition(_that.title,_that.imagePath,_that.description);case _ResubscribePetitions():
return resubscribePetitions(_that.petitions);case _SupportPetition():
return supportPetition(_that.petition);case _GetPetitionSupporters():
return getPetitionSupporters(_that.petition,_that.lastUser);case _GetUserPetitions():
return getUserPetitions(_that.user,_that.lastPetition);case _ResubscribeUserPetitions():
return resubscribeUserPetitions(_that.user,_that.petitions);case _UnsubscribeUserPetitions():
return unsubscribeUserPetitions(_that.user,_that.petitions);case _GetConstitution():
return getConstitution();case _GetConstitutionTags():
return getConstitutionTags(_that.searchTerm);case _BookmarkSection():
return bookmarkSection(_that.section);case _Disconnect():
return disconnect();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connect,TResult? Function( WebsocketState state)?  changeState,TResult? Function( List<User> users)?  unsubscribeUsers,TResult? Function( String? searchTerm,  Chat? lastChat)?  getChats,TResult? Function( List<Chat> chats)?  resubscribeChats,TResult? Function( Chat chat)?  getChat,TResult? Function( User user)?  createChat,TResult? Function( Chat chat)?  subscribeChat,TResult? Function( Chat chat,  Message? lastMessage)?  getMessages,TResult? Function( Chat chat,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition)?  createMessage,TResult? Function( List<User> users,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition)?  sendDirectMessage,TResult? Function( int messageId,  String text)?  editMessage,TResult? Function( List<Message> messages)?  deleteMessage,TResult? Function( Chat chat)?  markChatAsRead,TResult? Function( String? searchTerm,  Ballot? lastBallot)?  getBallots,TResult? Function( Option option)?  vote,TResult? Function( Ballot ballot,  String text)?  submitReason,TResult? Function( String? searchTerm,  Survey? lastSurvey)?  getSurveys,TResult? Function( Survey survey,  DateTime startTime,  DateTime endTime,  List<TextAnswer> textAnswers,  List<ChoiceAnswer> choiceAnswers)?  submitResponse,TResult? Function( String? searchTerm,  User? lastUser)?  getUsers,TResult? Function( List<User> users)?  resubscribeUsers,TResult? Function( User user,  User? lastUser)?  getFollowers,TResult? Function( User user,  User? lastUser)?  getFollowing,TResult? Function( User? lastUser)?  getMuted,TResult? Function( User? lastUser)?  getBlocked,TResult? Function( User user)?  getUser,TResult? Function( User user,  String name,  String status,  String? imagePath,  String? coverPhotoPath)?  updateUser,TResult? Function( int id)?  muteUser,TResult? Function( int id)?  blockUser,TResult? Function( User user)?  followUser,TResult? Function()?  getNotifications,TResult? Function( Notification notification)?  markNotificationAsRead,TResult? Function()?  getPreferences,TResult? Function( bool allowNotifications,  bool allowTagNotifications,  bool allowLikeNotifications,  bool allowReplyNotifications,  bool allowRepostNotifications,  bool allowMessageNotifications,  bool allowFollowNotifications)?  updatePreferences,TResult? Function( User user)?  changeUserNotificationStatus,TResult? Function( String? searchTerm,  Petition? lastPetition)?  getPetitions,TResult? Function( String title,  String imagePath,  String description)?  createPetition,TResult? Function( List<Petition> petitions)?  resubscribePetitions,TResult? Function( Petition petition)?  supportPetition,TResult? Function( Petition petition,  User? lastUser)?  getPetitionSupporters,TResult? Function( User user,  Petition? lastPetition)?  getUserPetitions,TResult? Function( User user,  List<Petition> petitions)?  resubscribeUserPetitions,TResult? Function( User user,  List<Petition> petitions)?  unsubscribeUserPetitions,TResult? Function()?  getConstitution,TResult? Function( String? searchTerm)?  getConstitutionTags,TResult? Function( Section section)?  bookmarkSection,TResult? Function()?  disconnect,}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _UnsubscribeUsers() when unsubscribeUsers != null:
return unsubscribeUsers(_that.users);case _GetChats() when getChats != null:
return getChats(_that.searchTerm,_that.lastChat);case _ResubscribeChats() when resubscribeChats != null:
return resubscribeChats(_that.chats);case _GetChat() when getChat != null:
return getChat(_that.chat);case _CreateChat() when createChat != null:
return createChat(_that.user);case _SubscribeChat() when subscribeChat != null:
return subscribeChat(_that.chat);case _GetMessages() when getMessages != null:
return getMessages(_that.chat,_that.lastMessage);case _CreateMessage() when createMessage != null:
return createMessage(_that.chat,_that.text,_that.post,_that.ballot,_that.survey,_that.petition);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that.users,_that.text,_that.post,_that.ballot,_that.survey,_that.petition);case _EditMessage() when editMessage != null:
return editMessage(_that.messageId,_that.text);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.messages);case _MarkChatAsRead() when markChatAsRead != null:
return markChatAsRead(_that.chat);case _GetBallots() when getBallots != null:
return getBallots(_that.searchTerm,_that.lastBallot);case _Vote() when vote != null:
return vote(_that.option);case _SubmitReason() when submitReason != null:
return submitReason(_that.ballot,_that.text);case _GetSurveys() when getSurveys != null:
return getSurveys(_that.searchTerm,_that.lastSurvey);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that.survey,_that.startTime,_that.endTime,_that.textAnswers,_that.choiceAnswers);case _GetUsers() when getUsers != null:
return getUsers(_that.searchTerm,_that.lastUser);case _ResubscribeUsers() when resubscribeUsers != null:
return resubscribeUsers(_that.users);case _GetFollowers() when getFollowers != null:
return getFollowers(_that.user,_that.lastUser);case _GetFollowing() when getFollowing != null:
return getFollowing(_that.user,_that.lastUser);case _GetMuted() when getMuted != null:
return getMuted(_that.lastUser);case _GetBlocked() when getBlocked != null:
return getBlocked(_that.lastUser);case _GetUser() when getUser != null:
return getUser(_that.user);case _UpdateUser() when updateUser != null:
return updateUser(_that.user,_that.name,_that.status,_that.imagePath,_that.coverPhotoPath);case _MuteUser() when muteUser != null:
return muteUser(_that.id);case _BlockUser() when blockUser != null:
return blockUser(_that.id);case _FollowUser() when followUser != null:
return followUser(_that.user);case _GetNotifications() when getNotifications != null:
return getNotifications();case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that.notification);case _GetPreferences() when getPreferences != null:
return getPreferences();case _UpdatePreferences() when updatePreferences != null:
return updatePreferences(_that.allowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications,_that.allowFollowNotifications);case _ChangeUserNotificationStatus() when changeUserNotificationStatus != null:
return changeUserNotificationStatus(_that.user);case _GetPetitions() when getPetitions != null:
return getPetitions(_that.searchTerm,_that.lastPetition);case _CreatePetition() when createPetition != null:
return createPetition(_that.title,_that.imagePath,_that.description);case _ResubscribePetitions() when resubscribePetitions != null:
return resubscribePetitions(_that.petitions);case _SupportPetition() when supportPetition != null:
return supportPetition(_that.petition);case _GetPetitionSupporters() when getPetitionSupporters != null:
return getPetitionSupporters(_that.petition,_that.lastUser);case _GetUserPetitions() when getUserPetitions != null:
return getUserPetitions(_that.user,_that.lastPetition);case _ResubscribeUserPetitions() when resubscribeUserPetitions != null:
return resubscribeUserPetitions(_that.user,_that.petitions);case _UnsubscribeUserPetitions() when unsubscribeUserPetitions != null:
return unsubscribeUserPetitions(_that.user,_that.petitions);case _GetConstitution() when getConstitution != null:
return getConstitution();case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that.searchTerm);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that.section);case _Disconnect() when disconnect != null:
return disconnect();case _:
  return null;

}
}

}

/// @nodoc


class _Connect with DiagnosticableTreeMixin implements WebsocketEvent {
  const _Connect();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.connect'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.connect()';
}


}




/// @nodoc


class _ChangeState with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ChangeState({required this.state});
  

 final  WebsocketState state;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeStateCopyWith<_ChangeState> get copyWith => __$ChangeStateCopyWithImpl<_ChangeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.changeState'))
    ..add(DiagnosticsProperty('state', state));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeState&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.changeState(state: $state)';
}


}

/// @nodoc
abstract mixin class _$ChangeStateCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ChangeStateCopyWith(_ChangeState value, $Res Function(_ChangeState) _then) = __$ChangeStateCopyWithImpl;
@useResult
$Res call({
 WebsocketState state
});




}
/// @nodoc
class __$ChangeStateCopyWithImpl<$Res>
    implements _$ChangeStateCopyWith<$Res> {
  __$ChangeStateCopyWithImpl(this._self, this._then);

  final _ChangeState _self;
  final $Res Function(_ChangeState) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(_ChangeState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as WebsocketState,
  ));
}


}

/// @nodoc


class _UnsubscribeUsers with DiagnosticableTreeMixin implements WebsocketEvent {
  const _UnsubscribeUsers({required final  List<User> users}): _users = users;
  

 final  List<User> _users;
 List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeUsersCopyWith<_UnsubscribeUsers> get copyWith => __$UnsubscribeUsersCopyWithImpl<_UnsubscribeUsers>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.unsubscribeUsers'))
    ..add(DiagnosticsProperty('users', users));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnsubscribeUsers&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.unsubscribeUsers(users: $users)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeUsersCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UnsubscribeUsersCopyWith(_UnsubscribeUsers value, $Res Function(_UnsubscribeUsers) _then) = __$UnsubscribeUsersCopyWithImpl;
@useResult
$Res call({
 List<User> users
});




}
/// @nodoc
class __$UnsubscribeUsersCopyWithImpl<$Res>
    implements _$UnsubscribeUsersCopyWith<$Res> {
  __$UnsubscribeUsersCopyWithImpl(this._self, this._then);

  final _UnsubscribeUsers _self;
  final $Res Function(_UnsubscribeUsers) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(_UnsubscribeUsers(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}


}

/// @nodoc


class _GetChats with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetChats({this.searchTerm, this.lastChat});
  

 final  String? searchTerm;
 final  Chat? lastChat;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetChatsCopyWith<_GetChats> get copyWith => __$GetChatsCopyWithImpl<_GetChats>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getChats'))
    ..add(DiagnosticsProperty('searchTerm', searchTerm))..add(DiagnosticsProperty('lastChat', lastChat));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetChats&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.lastChat, lastChat) || other.lastChat == lastChat));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,lastChat);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getChats(searchTerm: $searchTerm, lastChat: $lastChat)';
}


}

/// @nodoc
abstract mixin class _$GetChatsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetChatsCopyWith(_GetChats value, $Res Function(_GetChats) _then) = __$GetChatsCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, Chat? lastChat
});


$ChatCopyWith<$Res>? get lastChat;

}
/// @nodoc
class __$GetChatsCopyWithImpl<$Res>
    implements _$GetChatsCopyWith<$Res> {
  __$GetChatsCopyWithImpl(this._self, this._then);

  final _GetChats _self;
  final $Res Function(_GetChats) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? lastChat = freezed,}) {
  return _then(_GetChats(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,lastChat: freezed == lastChat ? _self.lastChat : lastChat // ignore: cast_nullable_to_non_nullable
as Chat?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res>? get lastChat {
    if (_self.lastChat == null) {
    return null;
  }

  return $ChatCopyWith<$Res>(_self.lastChat!, (value) {
    return _then(_self.copyWith(lastChat: value));
  });
}
}

/// @nodoc


class _ResubscribeChats with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ResubscribeChats({required final  List<Chat> chats}): _chats = chats;
  

 final  List<Chat> _chats;
 List<Chat> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResubscribeChatsCopyWith<_ResubscribeChats> get copyWith => __$ResubscribeChatsCopyWithImpl<_ResubscribeChats>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.resubscribeChats'))
    ..add(DiagnosticsProperty('chats', chats));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResubscribeChats&&const DeepCollectionEquality().equals(other._chats, _chats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.resubscribeChats(chats: $chats)';
}


}

/// @nodoc
abstract mixin class _$ResubscribeChatsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ResubscribeChatsCopyWith(_ResubscribeChats value, $Res Function(_ResubscribeChats) _then) = __$ResubscribeChatsCopyWithImpl;
@useResult
$Res call({
 List<Chat> chats
});




}
/// @nodoc
class __$ResubscribeChatsCopyWithImpl<$Res>
    implements _$ResubscribeChatsCopyWith<$Res> {
  __$ResubscribeChatsCopyWithImpl(this._self, this._then);

  final _ResubscribeChats _self;
  final $Res Function(_ResubscribeChats) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chats = null,}) {
  return _then(_ResubscribeChats(
chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<Chat>,
  ));
}


}

/// @nodoc


class _GetChat with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetChat({required this.chat});
  

 final  Chat chat;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetChatCopyWith<_GetChat> get copyWith => __$GetChatCopyWithImpl<_GetChat>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getChat'))
    ..add(DiagnosticsProperty('chat', chat));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetChat&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getChat(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$GetChatCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetChatCopyWith(_GetChat value, $Res Function(_GetChat) _then) = __$GetChatCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$GetChatCopyWithImpl<$Res>
    implements _$GetChatCopyWith<$Res> {
  __$GetChatCopyWithImpl(this._self, this._then);

  final _GetChat _self;
  final $Res Function(_GetChat) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_GetChat(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}
}

/// @nodoc


class _CreateChat with DiagnosticableTreeMixin implements WebsocketEvent {
  const _CreateChat({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateChatCopyWith<_CreateChat> get copyWith => __$CreateChatCopyWithImpl<_CreateChat>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.createChat'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateChat&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.createChat(user: $user)';
}


}

/// @nodoc
abstract mixin class _$CreateChatCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$CreateChatCopyWith(_CreateChat value, $Res Function(_CreateChat) _then) = __$CreateChatCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$CreateChatCopyWithImpl<$Res>
    implements _$CreateChatCopyWith<$Res> {
  __$CreateChatCopyWithImpl(this._self, this._then);

  final _CreateChat _self;
  final $Res Function(_CreateChat) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_CreateChat(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _SubscribeChat with DiagnosticableTreeMixin implements WebsocketEvent {
  const _SubscribeChat({required this.chat});
  

 final  Chat chat;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribeChatCopyWith<_SubscribeChat> get copyWith => __$SubscribeChatCopyWithImpl<_SubscribeChat>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.subscribeChat'))
    ..add(DiagnosticsProperty('chat', chat));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscribeChat&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.subscribeChat(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$SubscribeChatCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SubscribeChatCopyWith(_SubscribeChat value, $Res Function(_SubscribeChat) _then) = __$SubscribeChatCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$SubscribeChatCopyWithImpl<$Res>
    implements _$SubscribeChatCopyWith<$Res> {
  __$SubscribeChatCopyWithImpl(this._self, this._then);

  final _SubscribeChat _self;
  final $Res Function(_SubscribeChat) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_SubscribeChat(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}
}

/// @nodoc


class _GetMessages with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetMessages({required this.chat, this.lastMessage});
  

 final  Chat chat;
 final  Message? lastMessage;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMessagesCopyWith<_GetMessages> get copyWith => __$GetMessagesCopyWithImpl<_GetMessages>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getMessages'))
    ..add(DiagnosticsProperty('chat', chat))..add(DiagnosticsProperty('lastMessage', lastMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMessages&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}


@override
int get hashCode => Object.hash(runtimeType,chat,lastMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getMessages(chat: $chat, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class _$GetMessagesCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetMessagesCopyWith(_GetMessages value, $Res Function(_GetMessages) _then) = __$GetMessagesCopyWithImpl;
@useResult
$Res call({
 Chat chat, Message? lastMessage
});


$ChatCopyWith<$Res> get chat;$MessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$GetMessagesCopyWithImpl<$Res>
    implements _$GetMessagesCopyWith<$Res> {
  __$GetMessagesCopyWithImpl(this._self, this._then);

  final _GetMessages _self;
  final $Res Function(_GetMessages) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,Object? lastMessage = freezed,}) {
  return _then(_GetMessages(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as Message?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

/// @nodoc


class _CreateMessage with DiagnosticableTreeMixin implements WebsocketEvent {
  const _CreateMessage({required this.chat, required this.text, this.post, this.ballot, this.survey, this.petition});
  

 final  Chat chat;
 final  String text;
 final  Post? post;
 final  Ballot? ballot;
 final  Survey? survey;
 final  Petition? petition;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMessageCopyWith<_CreateMessage> get copyWith => __$CreateMessageCopyWithImpl<_CreateMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.createMessage'))
    ..add(DiagnosticsProperty('chat', chat))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('post', post))..add(DiagnosticsProperty('ballot', ballot))..add(DiagnosticsProperty('survey', survey))..add(DiagnosticsProperty('petition', petition));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMessage&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.text, text) || other.text == text)&&(identical(other.post, post) || other.post == post)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,chat,text,post,ballot,survey,petition);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.createMessage(chat: $chat, text: $text, post: $post, ballot: $ballot, survey: $survey, petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$CreateMessageCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$CreateMessageCopyWith(_CreateMessage value, $Res Function(_CreateMessage) _then) = __$CreateMessageCopyWithImpl;
@useResult
$Res call({
 Chat chat, String text, Post? post, Ballot? ballot, Survey? survey, Petition? petition
});


$ChatCopyWith<$Res> get chat;$PostCopyWith<$Res>? get post;$BallotCopyWith<$Res>? get ballot;$SurveyCopyWith<$Res>? get survey;$PetitionCopyWith<$Res>? get petition;

}
/// @nodoc
class __$CreateMessageCopyWithImpl<$Res>
    implements _$CreateMessageCopyWith<$Res> {
  __$CreateMessageCopyWithImpl(this._self, this._then);

  final _CreateMessage _self;
  final $Res Function(_CreateMessage) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,Object? text = null,Object? post = freezed,Object? ballot = freezed,Object? survey = freezed,Object? petition = freezed,}) {
  return _then(_CreateMessage(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post?,ballot: freezed == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,petition: freezed == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res>? get ballot {
    if (_self.ballot == null) {
    return null;
  }

  return $BallotCopyWith<$Res>(_self.ballot!, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res>? get survey {
    if (_self.survey == null) {
    return null;
  }

  return $SurveyCopyWith<$Res>(_self.survey!, (value) {
    return _then(_self.copyWith(survey: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res>? get petition {
    if (_self.petition == null) {
    return null;
  }

  return $PetitionCopyWith<$Res>(_self.petition!, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _SendDirectMessage with DiagnosticableTreeMixin implements WebsocketEvent {
  const _SendDirectMessage({required final  List<User> users, required this.text, this.post, this.ballot, this.survey, this.petition}): _users = users;
  

 final  List<User> _users;
 List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

 final  String text;
 final  Post? post;
 final  Ballot? ballot;
 final  Survey? survey;
 final  Petition? petition;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendDirectMessageCopyWith<_SendDirectMessage> get copyWith => __$SendDirectMessageCopyWithImpl<_SendDirectMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.sendDirectMessage'))
    ..add(DiagnosticsProperty('users', users))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('post', post))..add(DiagnosticsProperty('ballot', ballot))..add(DiagnosticsProperty('survey', survey))..add(DiagnosticsProperty('petition', petition));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendDirectMessage&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.text, text) || other.text == text)&&(identical(other.post, post) || other.post == post)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),text,post,ballot,survey,petition);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.sendDirectMessage(users: $users, text: $text, post: $post, ballot: $ballot, survey: $survey, petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$SendDirectMessageCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SendDirectMessageCopyWith(_SendDirectMessage value, $Res Function(_SendDirectMessage) _then) = __$SendDirectMessageCopyWithImpl;
@useResult
$Res call({
 List<User> users, String text, Post? post, Ballot? ballot, Survey? survey, Petition? petition
});


$PostCopyWith<$Res>? get post;$BallotCopyWith<$Res>? get ballot;$SurveyCopyWith<$Res>? get survey;$PetitionCopyWith<$Res>? get petition;

}
/// @nodoc
class __$SendDirectMessageCopyWithImpl<$Res>
    implements _$SendDirectMessageCopyWith<$Res> {
  __$SendDirectMessageCopyWithImpl(this._self, this._then);

  final _SendDirectMessage _self;
  final $Res Function(_SendDirectMessage) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,Object? text = null,Object? post = freezed,Object? ballot = freezed,Object? survey = freezed,Object? petition = freezed,}) {
  return _then(_SendDirectMessage(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post?,ballot: freezed == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,petition: freezed == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res>? get ballot {
    if (_self.ballot == null) {
    return null;
  }

  return $BallotCopyWith<$Res>(_self.ballot!, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res>? get survey {
    if (_self.survey == null) {
    return null;
  }

  return $SurveyCopyWith<$Res>(_self.survey!, (value) {
    return _then(_self.copyWith(survey: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res>? get petition {
    if (_self.petition == null) {
    return null;
  }

  return $PetitionCopyWith<$Res>(_self.petition!, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _EditMessage with DiagnosticableTreeMixin implements WebsocketEvent {
  const _EditMessage({required this.messageId, required this.text});
  

 final  int messageId;
 final  String text;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditMessageCopyWith<_EditMessage> get copyWith => __$EditMessageCopyWithImpl<_EditMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.editMessage'))
    ..add(DiagnosticsProperty('messageId', messageId))..add(DiagnosticsProperty('text', text));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditMessage&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,messageId,text);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.editMessage(messageId: $messageId, text: $text)';
}


}

/// @nodoc
abstract mixin class _$EditMessageCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$EditMessageCopyWith(_EditMessage value, $Res Function(_EditMessage) _then) = __$EditMessageCopyWithImpl;
@useResult
$Res call({
 int messageId, String text
});




}
/// @nodoc
class __$EditMessageCopyWithImpl<$Res>
    implements _$EditMessageCopyWith<$Res> {
  __$EditMessageCopyWithImpl(this._self, this._then);

  final _EditMessage _self;
  final $Res Function(_EditMessage) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? text = null,}) {
  return _then(_EditMessage(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteMessage with DiagnosticableTreeMixin implements WebsocketEvent {
  const _DeleteMessage({required final  List<Message> messages}): _messages = messages;
  

 final  List<Message> _messages;
 List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteMessageCopyWith<_DeleteMessage> get copyWith => __$DeleteMessageCopyWithImpl<_DeleteMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.deleteMessage'))
    ..add(DiagnosticsProperty('messages', messages));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteMessage&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.deleteMessage(messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$DeleteMessageCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$DeleteMessageCopyWith(_DeleteMessage value, $Res Function(_DeleteMessage) _then) = __$DeleteMessageCopyWithImpl;
@useResult
$Res call({
 List<Message> messages
});




}
/// @nodoc
class __$DeleteMessageCopyWithImpl<$Res>
    implements _$DeleteMessageCopyWith<$Res> {
  __$DeleteMessageCopyWithImpl(this._self, this._then);

  final _DeleteMessage _self;
  final $Res Function(_DeleteMessage) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(_DeleteMessage(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}


}

/// @nodoc


class _MarkChatAsRead with DiagnosticableTreeMixin implements WebsocketEvent {
  const _MarkChatAsRead({required this.chat});
  

 final  Chat chat;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkChatAsReadCopyWith<_MarkChatAsRead> get copyWith => __$MarkChatAsReadCopyWithImpl<_MarkChatAsRead>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.markChatAsRead'))
    ..add(DiagnosticsProperty('chat', chat));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkChatAsRead&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.markChatAsRead(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$MarkChatAsReadCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$MarkChatAsReadCopyWith(_MarkChatAsRead value, $Res Function(_MarkChatAsRead) _then) = __$MarkChatAsReadCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$MarkChatAsReadCopyWithImpl<$Res>
    implements _$MarkChatAsReadCopyWith<$Res> {
  __$MarkChatAsReadCopyWithImpl(this._self, this._then);

  final _MarkChatAsRead _self;
  final $Res Function(_MarkChatAsRead) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_MarkChatAsRead(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}
}

/// @nodoc


class _GetBallots with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetBallots({this.searchTerm, this.lastBallot});
  

 final  String? searchTerm;
 final  Ballot? lastBallot;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetBallotsCopyWith<_GetBallots> get copyWith => __$GetBallotsCopyWithImpl<_GetBallots>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getBallots'))
    ..add(DiagnosticsProperty('searchTerm', searchTerm))..add(DiagnosticsProperty('lastBallot', lastBallot));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetBallots&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.lastBallot, lastBallot) || other.lastBallot == lastBallot));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,lastBallot);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getBallots(searchTerm: $searchTerm, lastBallot: $lastBallot)';
}


}

/// @nodoc
abstract mixin class _$GetBallotsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetBallotsCopyWith(_GetBallots value, $Res Function(_GetBallots) _then) = __$GetBallotsCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, Ballot? lastBallot
});


$BallotCopyWith<$Res>? get lastBallot;

}
/// @nodoc
class __$GetBallotsCopyWithImpl<$Res>
    implements _$GetBallotsCopyWith<$Res> {
  __$GetBallotsCopyWithImpl(this._self, this._then);

  final _GetBallots _self;
  final $Res Function(_GetBallots) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? lastBallot = freezed,}) {
  return _then(_GetBallots(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,lastBallot: freezed == lastBallot ? _self.lastBallot : lastBallot // ignore: cast_nullable_to_non_nullable
as Ballot?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res>? get lastBallot {
    if (_self.lastBallot == null) {
    return null;
  }

  return $BallotCopyWith<$Res>(_self.lastBallot!, (value) {
    return _then(_self.copyWith(lastBallot: value));
  });
}
}

/// @nodoc


class _Vote with DiagnosticableTreeMixin implements WebsocketEvent {
  const _Vote({required this.option});
  

 final  Option option;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoteCopyWith<_Vote> get copyWith => __$VoteCopyWithImpl<_Vote>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.vote'))
    ..add(DiagnosticsProperty('option', option));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vote&&(identical(other.option, option) || other.option == option));
}


@override
int get hashCode => Object.hash(runtimeType,option);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.vote(option: $option)';
}


}

/// @nodoc
abstract mixin class _$VoteCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$VoteCopyWith(_Vote value, $Res Function(_Vote) _then) = __$VoteCopyWithImpl;
@useResult
$Res call({
 Option option
});


$OptionCopyWith<$Res> get option;

}
/// @nodoc
class __$VoteCopyWithImpl<$Res>
    implements _$VoteCopyWith<$Res> {
  __$VoteCopyWithImpl(this._self, this._then);

  final _Vote _self;
  final $Res Function(_Vote) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? option = null,}) {
  return _then(_Vote(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as Option,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptionCopyWith<$Res> get option {
  
  return $OptionCopyWith<$Res>(_self.option, (value) {
    return _then(_self.copyWith(option: value));
  });
}
}

/// @nodoc


class _SubmitReason with DiagnosticableTreeMixin implements WebsocketEvent {
  const _SubmitReason({required this.ballot, required this.text});
  

 final  Ballot ballot;
 final  String text;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitReasonCopyWith<_SubmitReason> get copyWith => __$SubmitReasonCopyWithImpl<_SubmitReason>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.submitReason'))
    ..add(DiagnosticsProperty('ballot', ballot))..add(DiagnosticsProperty('text', text));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitReason&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,ballot,text);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.submitReason(ballot: $ballot, text: $text)';
}


}

/// @nodoc
abstract mixin class _$SubmitReasonCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SubmitReasonCopyWith(_SubmitReason value, $Res Function(_SubmitReason) _then) = __$SubmitReasonCopyWithImpl;
@useResult
$Res call({
 Ballot ballot, String text
});


$BallotCopyWith<$Res> get ballot;

}
/// @nodoc
class __$SubmitReasonCopyWithImpl<$Res>
    implements _$SubmitReasonCopyWith<$Res> {
  __$SubmitReasonCopyWithImpl(this._self, this._then);

  final _SubmitReason _self;
  final $Res Function(_SubmitReason) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ballot = null,Object? text = null,}) {
  return _then(_SubmitReason(
ballot: null == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res> get ballot {
  
  return $BallotCopyWith<$Res>(_self.ballot, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}
}

/// @nodoc


class _GetSurveys with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetSurveys({this.searchTerm, this.lastSurvey});
  

 final  String? searchTerm;
 final  Survey? lastSurvey;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSurveysCopyWith<_GetSurveys> get copyWith => __$GetSurveysCopyWithImpl<_GetSurveys>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getSurveys'))
    ..add(DiagnosticsProperty('searchTerm', searchTerm))..add(DiagnosticsProperty('lastSurvey', lastSurvey));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSurveys&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.lastSurvey, lastSurvey) || other.lastSurvey == lastSurvey));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,lastSurvey);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getSurveys(searchTerm: $searchTerm, lastSurvey: $lastSurvey)';
}


}

/// @nodoc
abstract mixin class _$GetSurveysCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetSurveysCopyWith(_GetSurveys value, $Res Function(_GetSurveys) _then) = __$GetSurveysCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, Survey? lastSurvey
});


$SurveyCopyWith<$Res>? get lastSurvey;

}
/// @nodoc
class __$GetSurveysCopyWithImpl<$Res>
    implements _$GetSurveysCopyWith<$Res> {
  __$GetSurveysCopyWithImpl(this._self, this._then);

  final _GetSurveys _self;
  final $Res Function(_GetSurveys) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? lastSurvey = freezed,}) {
  return _then(_GetSurveys(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,lastSurvey: freezed == lastSurvey ? _self.lastSurvey : lastSurvey // ignore: cast_nullable_to_non_nullable
as Survey?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res>? get lastSurvey {
    if (_self.lastSurvey == null) {
    return null;
  }

  return $SurveyCopyWith<$Res>(_self.lastSurvey!, (value) {
    return _then(_self.copyWith(lastSurvey: value));
  });
}
}

/// @nodoc


class _SubmitResponse with DiagnosticableTreeMixin implements WebsocketEvent {
  const _SubmitResponse({required this.survey, required this.startTime, required this.endTime, required final  List<TextAnswer> textAnswers, required final  List<ChoiceAnswer> choiceAnswers}): _textAnswers = textAnswers,_choiceAnswers = choiceAnswers;
  

 final  Survey survey;
 final  DateTime startTime;
 final  DateTime endTime;
 final  List<TextAnswer> _textAnswers;
 List<TextAnswer> get textAnswers {
  if (_textAnswers is EqualUnmodifiableListView) return _textAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_textAnswers);
}

 final  List<ChoiceAnswer> _choiceAnswers;
 List<ChoiceAnswer> get choiceAnswers {
  if (_choiceAnswers is EqualUnmodifiableListView) return _choiceAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choiceAnswers);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitResponseCopyWith<_SubmitResponse> get copyWith => __$SubmitResponseCopyWithImpl<_SubmitResponse>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.submitResponse'))
    ..add(DiagnosticsProperty('survey', survey))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('endTime', endTime))..add(DiagnosticsProperty('textAnswers', textAnswers))..add(DiagnosticsProperty('choiceAnswers', choiceAnswers));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitResponse&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other._textAnswers, _textAnswers)&&const DeepCollectionEquality().equals(other._choiceAnswers, _choiceAnswers));
}


@override
int get hashCode => Object.hash(runtimeType,survey,startTime,endTime,const DeepCollectionEquality().hash(_textAnswers),const DeepCollectionEquality().hash(_choiceAnswers));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.submitResponse(survey: $survey, startTime: $startTime, endTime: $endTime, textAnswers: $textAnswers, choiceAnswers: $choiceAnswers)';
}


}

/// @nodoc
abstract mixin class _$SubmitResponseCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SubmitResponseCopyWith(_SubmitResponse value, $Res Function(_SubmitResponse) _then) = __$SubmitResponseCopyWithImpl;
@useResult
$Res call({
 Survey survey, DateTime startTime, DateTime endTime, List<TextAnswer> textAnswers, List<ChoiceAnswer> choiceAnswers
});


$SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class __$SubmitResponseCopyWithImpl<$Res>
    implements _$SubmitResponseCopyWith<$Res> {
  __$SubmitResponseCopyWithImpl(this._self, this._then);

  final _SubmitResponse _self;
  final $Res Function(_SubmitResponse) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? survey = null,Object? startTime = null,Object? endTime = null,Object? textAnswers = null,Object? choiceAnswers = null,}) {
  return _then(_SubmitResponse(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,textAnswers: null == textAnswers ? _self._textAnswers : textAnswers // ignore: cast_nullable_to_non_nullable
as List<TextAnswer>,choiceAnswers: null == choiceAnswers ? _self._choiceAnswers : choiceAnswers // ignore: cast_nullable_to_non_nullable
as List<ChoiceAnswer>,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res> get survey {
  
  return $SurveyCopyWith<$Res>(_self.survey, (value) {
    return _then(_self.copyWith(survey: value));
  });
}
}

/// @nodoc


class _GetUsers with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetUsers({this.searchTerm, this.lastUser});
  

 final  String? searchTerm;
 final  User? lastUser;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetUsersCopyWith<_GetUsers> get copyWith => __$GetUsersCopyWithImpl<_GetUsers>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getUsers'))
    ..add(DiagnosticsProperty('searchTerm', searchTerm))..add(DiagnosticsProperty('lastUser', lastUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUsers&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.lastUser, lastUser) || other.lastUser == lastUser));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,lastUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getUsers(searchTerm: $searchTerm, lastUser: $lastUser)';
}


}

/// @nodoc
abstract mixin class _$GetUsersCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetUsersCopyWith(_GetUsers value, $Res Function(_GetUsers) _then) = __$GetUsersCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, User? lastUser
});


$UserCopyWith<$Res>? get lastUser;

}
/// @nodoc
class __$GetUsersCopyWithImpl<$Res>
    implements _$GetUsersCopyWith<$Res> {
  __$GetUsersCopyWithImpl(this._self, this._then);

  final _GetUsers _self;
  final $Res Function(_GetUsers) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? lastUser = freezed,}) {
  return _then(_GetUsers(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,lastUser: freezed == lastUser ? _self.lastUser : lastUser // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get lastUser {
    if (_self.lastUser == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.lastUser!, (value) {
    return _then(_self.copyWith(lastUser: value));
  });
}
}

/// @nodoc


class _ResubscribeUsers with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ResubscribeUsers({required final  List<User> users}): _users = users;
  

 final  List<User> _users;
 List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResubscribeUsersCopyWith<_ResubscribeUsers> get copyWith => __$ResubscribeUsersCopyWithImpl<_ResubscribeUsers>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.resubscribeUsers'))
    ..add(DiagnosticsProperty('users', users));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResubscribeUsers&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.resubscribeUsers(users: $users)';
}


}

/// @nodoc
abstract mixin class _$ResubscribeUsersCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ResubscribeUsersCopyWith(_ResubscribeUsers value, $Res Function(_ResubscribeUsers) _then) = __$ResubscribeUsersCopyWithImpl;
@useResult
$Res call({
 List<User> users
});




}
/// @nodoc
class __$ResubscribeUsersCopyWithImpl<$Res>
    implements _$ResubscribeUsersCopyWith<$Res> {
  __$ResubscribeUsersCopyWithImpl(this._self, this._then);

  final _ResubscribeUsers _self;
  final $Res Function(_ResubscribeUsers) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(_ResubscribeUsers(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}


}

/// @nodoc


class _GetFollowers with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetFollowers({required this.user, this.lastUser});
  

 final  User user;
 final  User? lastUser;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetFollowersCopyWith<_GetFollowers> get copyWith => __$GetFollowersCopyWithImpl<_GetFollowers>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getFollowers'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('lastUser', lastUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetFollowers&&(identical(other.user, user) || other.user == user)&&(identical(other.lastUser, lastUser) || other.lastUser == lastUser));
}


@override
int get hashCode => Object.hash(runtimeType,user,lastUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getFollowers(user: $user, lastUser: $lastUser)';
}


}

/// @nodoc
abstract mixin class _$GetFollowersCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetFollowersCopyWith(_GetFollowers value, $Res Function(_GetFollowers) _then) = __$GetFollowersCopyWithImpl;
@useResult
$Res call({
 User user, User? lastUser
});


$UserCopyWith<$Res> get user;$UserCopyWith<$Res>? get lastUser;

}
/// @nodoc
class __$GetFollowersCopyWithImpl<$Res>
    implements _$GetFollowersCopyWith<$Res> {
  __$GetFollowersCopyWithImpl(this._self, this._then);

  final _GetFollowers _self;
  final $Res Function(_GetFollowers) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? lastUser = freezed,}) {
  return _then(_GetFollowers(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,lastUser: freezed == lastUser ? _self.lastUser : lastUser // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get lastUser {
    if (_self.lastUser == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.lastUser!, (value) {
    return _then(_self.copyWith(lastUser: value));
  });
}
}

/// @nodoc


class _GetFollowing with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetFollowing({required this.user, this.lastUser});
  

 final  User user;
 final  User? lastUser;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetFollowingCopyWith<_GetFollowing> get copyWith => __$GetFollowingCopyWithImpl<_GetFollowing>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getFollowing'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('lastUser', lastUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetFollowing&&(identical(other.user, user) || other.user == user)&&(identical(other.lastUser, lastUser) || other.lastUser == lastUser));
}


@override
int get hashCode => Object.hash(runtimeType,user,lastUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getFollowing(user: $user, lastUser: $lastUser)';
}


}

/// @nodoc
abstract mixin class _$GetFollowingCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetFollowingCopyWith(_GetFollowing value, $Res Function(_GetFollowing) _then) = __$GetFollowingCopyWithImpl;
@useResult
$Res call({
 User user, User? lastUser
});


$UserCopyWith<$Res> get user;$UserCopyWith<$Res>? get lastUser;

}
/// @nodoc
class __$GetFollowingCopyWithImpl<$Res>
    implements _$GetFollowingCopyWith<$Res> {
  __$GetFollowingCopyWithImpl(this._self, this._then);

  final _GetFollowing _self;
  final $Res Function(_GetFollowing) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? lastUser = freezed,}) {
  return _then(_GetFollowing(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,lastUser: freezed == lastUser ? _self.lastUser : lastUser // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get lastUser {
    if (_self.lastUser == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.lastUser!, (value) {
    return _then(_self.copyWith(lastUser: value));
  });
}
}

/// @nodoc


class _GetMuted with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetMuted({this.lastUser});
  

 final  User? lastUser;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMutedCopyWith<_GetMuted> get copyWith => __$GetMutedCopyWithImpl<_GetMuted>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getMuted'))
    ..add(DiagnosticsProperty('lastUser', lastUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMuted&&(identical(other.lastUser, lastUser) || other.lastUser == lastUser));
}


@override
int get hashCode => Object.hash(runtimeType,lastUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getMuted(lastUser: $lastUser)';
}


}

/// @nodoc
abstract mixin class _$GetMutedCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetMutedCopyWith(_GetMuted value, $Res Function(_GetMuted) _then) = __$GetMutedCopyWithImpl;
@useResult
$Res call({
 User? lastUser
});


$UserCopyWith<$Res>? get lastUser;

}
/// @nodoc
class __$GetMutedCopyWithImpl<$Res>
    implements _$GetMutedCopyWith<$Res> {
  __$GetMutedCopyWithImpl(this._self, this._then);

  final _GetMuted _self;
  final $Res Function(_GetMuted) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastUser = freezed,}) {
  return _then(_GetMuted(
lastUser: freezed == lastUser ? _self.lastUser : lastUser // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get lastUser {
    if (_self.lastUser == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.lastUser!, (value) {
    return _then(_self.copyWith(lastUser: value));
  });
}
}

/// @nodoc


class _GetBlocked with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetBlocked({this.lastUser});
  

 final  User? lastUser;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetBlockedCopyWith<_GetBlocked> get copyWith => __$GetBlockedCopyWithImpl<_GetBlocked>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getBlocked'))
    ..add(DiagnosticsProperty('lastUser', lastUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetBlocked&&(identical(other.lastUser, lastUser) || other.lastUser == lastUser));
}


@override
int get hashCode => Object.hash(runtimeType,lastUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getBlocked(lastUser: $lastUser)';
}


}

/// @nodoc
abstract mixin class _$GetBlockedCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetBlockedCopyWith(_GetBlocked value, $Res Function(_GetBlocked) _then) = __$GetBlockedCopyWithImpl;
@useResult
$Res call({
 User? lastUser
});


$UserCopyWith<$Res>? get lastUser;

}
/// @nodoc
class __$GetBlockedCopyWithImpl<$Res>
    implements _$GetBlockedCopyWith<$Res> {
  __$GetBlockedCopyWithImpl(this._self, this._then);

  final _GetBlocked _self;
  final $Res Function(_GetBlocked) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastUser = freezed,}) {
  return _then(_GetBlocked(
lastUser: freezed == lastUser ? _self.lastUser : lastUser // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get lastUser {
    if (_self.lastUser == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.lastUser!, (value) {
    return _then(_self.copyWith(lastUser: value));
  });
}
}

/// @nodoc


class _GetUser with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetUser({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetUserCopyWith<_GetUser> get copyWith => __$GetUserCopyWithImpl<_GetUser>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getUser'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$GetUserCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetUserCopyWith(_GetUser value, $Res Function(_GetUser) _then) = __$GetUserCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$GetUserCopyWithImpl<$Res>
    implements _$GetUserCopyWith<$Res> {
  __$GetUserCopyWithImpl(this._self, this._then);

  final _GetUser _self;
  final $Res Function(_GetUser) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_GetUser(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _UpdateUser with DiagnosticableTreeMixin implements WebsocketEvent {
  const _UpdateUser({required this.user, required this.name, required this.status, required this.imagePath, required this.coverPhotoPath});
  

 final  User user;
 final  String name;
 final  String status;
 final  String? imagePath;
 final  String? coverPhotoPath;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserCopyWith<_UpdateUser> get copyWith => __$UpdateUserCopyWithImpl<_UpdateUser>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.updateUser'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('imagePath', imagePath))..add(DiagnosticsProperty('coverPhotoPath', coverPhotoPath));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUser&&(identical(other.user, user) || other.user == user)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.coverPhotoPath, coverPhotoPath) || other.coverPhotoPath == coverPhotoPath));
}


@override
int get hashCode => Object.hash(runtimeType,user,name,status,imagePath,coverPhotoPath);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.updateUser(user: $user, name: $name, status: $status, imagePath: $imagePath, coverPhotoPath: $coverPhotoPath)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UpdateUserCopyWith(_UpdateUser value, $Res Function(_UpdateUser) _then) = __$UpdateUserCopyWithImpl;
@useResult
$Res call({
 User user, String name, String status, String? imagePath, String? coverPhotoPath
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UpdateUserCopyWithImpl<$Res>
    implements _$UpdateUserCopyWith<$Res> {
  __$UpdateUserCopyWithImpl(this._self, this._then);

  final _UpdateUser _self;
  final $Res Function(_UpdateUser) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? name = null,Object? status = null,Object? imagePath = freezed,Object? coverPhotoPath = freezed,}) {
  return _then(_UpdateUser(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,coverPhotoPath: freezed == coverPhotoPath ? _self.coverPhotoPath : coverPhotoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _MuteUser with DiagnosticableTreeMixin implements WebsocketEvent {
  const _MuteUser({required this.id});
  

 final  int id;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuteUserCopyWith<_MuteUser> get copyWith => __$MuteUserCopyWithImpl<_MuteUser>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.muteUser'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuteUser&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.muteUser(id: $id)';
}


}

/// @nodoc
abstract mixin class _$MuteUserCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$MuteUserCopyWith(_MuteUser value, $Res Function(_MuteUser) _then) = __$MuteUserCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$MuteUserCopyWithImpl<$Res>
    implements _$MuteUserCopyWith<$Res> {
  __$MuteUserCopyWithImpl(this._self, this._then);

  final _MuteUser _self;
  final $Res Function(_MuteUser) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_MuteUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _BlockUser with DiagnosticableTreeMixin implements WebsocketEvent {
  const _BlockUser({required this.id});
  

 final  int id;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockUserCopyWith<_BlockUser> get copyWith => __$BlockUserCopyWithImpl<_BlockUser>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.blockUser'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockUser&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.blockUser(id: $id)';
}


}

/// @nodoc
abstract mixin class _$BlockUserCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$BlockUserCopyWith(_BlockUser value, $Res Function(_BlockUser) _then) = __$BlockUserCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$BlockUserCopyWithImpl<$Res>
    implements _$BlockUserCopyWith<$Res> {
  __$BlockUserCopyWithImpl(this._self, this._then);

  final _BlockUser _self;
  final $Res Function(_BlockUser) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_BlockUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FollowUser with DiagnosticableTreeMixin implements WebsocketEvent {
  const _FollowUser({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowUserCopyWith<_FollowUser> get copyWith => __$FollowUserCopyWithImpl<_FollowUser>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.followUser'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.followUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$FollowUserCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$FollowUserCopyWith(_FollowUser value, $Res Function(_FollowUser) _then) = __$FollowUserCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$FollowUserCopyWithImpl<$Res>
    implements _$FollowUserCopyWith<$Res> {
  __$FollowUserCopyWithImpl(this._self, this._then);

  final _FollowUser _self;
  final $Res Function(_FollowUser) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_FollowUser(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _GetNotifications with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetNotifications();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getNotifications'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNotifications);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getNotifications()';
}


}




/// @nodoc


class _MarkNotificationAsRead with DiagnosticableTreeMixin implements WebsocketEvent {
  const _MarkNotificationAsRead({required this.notification});
  

 final  Notification notification;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkNotificationAsReadCopyWith<_MarkNotificationAsRead> get copyWith => __$MarkNotificationAsReadCopyWithImpl<_MarkNotificationAsRead>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.markNotificationAsRead'))
    ..add(DiagnosticsProperty('notification', notification));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkNotificationAsRead&&(identical(other.notification, notification) || other.notification == notification));
}


@override
int get hashCode => Object.hash(runtimeType,notification);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.markNotificationAsRead(notification: $notification)';
}


}

/// @nodoc
abstract mixin class _$MarkNotificationAsReadCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$MarkNotificationAsReadCopyWith(_MarkNotificationAsRead value, $Res Function(_MarkNotificationAsRead) _then) = __$MarkNotificationAsReadCopyWithImpl;
@useResult
$Res call({
 Notification notification
});


$NotificationCopyWith<$Res> get notification;

}
/// @nodoc
class __$MarkNotificationAsReadCopyWithImpl<$Res>
    implements _$MarkNotificationAsReadCopyWith<$Res> {
  __$MarkNotificationAsReadCopyWithImpl(this._self, this._then);

  final _MarkNotificationAsRead _self;
  final $Res Function(_MarkNotificationAsRead) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notification = null,}) {
  return _then(_MarkNotificationAsRead(
notification: null == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as Notification,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationCopyWith<$Res> get notification {
  
  return $NotificationCopyWith<$Res>(_self.notification, (value) {
    return _then(_self.copyWith(notification: value));
  });
}
}

/// @nodoc


class _GetPreferences with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetPreferences();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getPreferences'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPreferences);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getPreferences()';
}


}




/// @nodoc


class _UpdatePreferences with DiagnosticableTreeMixin implements WebsocketEvent {
  const _UpdatePreferences({required this.allowNotifications, required this.allowTagNotifications, required this.allowLikeNotifications, required this.allowReplyNotifications, required this.allowRepostNotifications, required this.allowMessageNotifications, required this.allowFollowNotifications});
  

 final  bool allowNotifications;
 final  bool allowTagNotifications;
 final  bool allowLikeNotifications;
 final  bool allowReplyNotifications;
 final  bool allowRepostNotifications;
 final  bool allowMessageNotifications;
 final  bool allowFollowNotifications;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePreferencesCopyWith<_UpdatePreferences> get copyWith => __$UpdatePreferencesCopyWithImpl<_UpdatePreferences>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.updatePreferences'))
    ..add(DiagnosticsProperty('allowNotifications', allowNotifications))..add(DiagnosticsProperty('allowTagNotifications', allowTagNotifications))..add(DiagnosticsProperty('allowLikeNotifications', allowLikeNotifications))..add(DiagnosticsProperty('allowReplyNotifications', allowReplyNotifications))..add(DiagnosticsProperty('allowRepostNotifications', allowRepostNotifications))..add(DiagnosticsProperty('allowMessageNotifications', allowMessageNotifications))..add(DiagnosticsProperty('allowFollowNotifications', allowFollowNotifications));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePreferences&&(identical(other.allowNotifications, allowNotifications) || other.allowNotifications == allowNotifications)&&(identical(other.allowTagNotifications, allowTagNotifications) || other.allowTagNotifications == allowTagNotifications)&&(identical(other.allowLikeNotifications, allowLikeNotifications) || other.allowLikeNotifications == allowLikeNotifications)&&(identical(other.allowReplyNotifications, allowReplyNotifications) || other.allowReplyNotifications == allowReplyNotifications)&&(identical(other.allowRepostNotifications, allowRepostNotifications) || other.allowRepostNotifications == allowRepostNotifications)&&(identical(other.allowMessageNotifications, allowMessageNotifications) || other.allowMessageNotifications == allowMessageNotifications)&&(identical(other.allowFollowNotifications, allowFollowNotifications) || other.allowFollowNotifications == allowFollowNotifications));
}


@override
int get hashCode => Object.hash(runtimeType,allowNotifications,allowTagNotifications,allowLikeNotifications,allowReplyNotifications,allowRepostNotifications,allowMessageNotifications,allowFollowNotifications);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.updatePreferences(allowNotifications: $allowNotifications, allowTagNotifications: $allowTagNotifications, allowLikeNotifications: $allowLikeNotifications, allowReplyNotifications: $allowReplyNotifications, allowRepostNotifications: $allowRepostNotifications, allowMessageNotifications: $allowMessageNotifications, allowFollowNotifications: $allowFollowNotifications)';
}


}

/// @nodoc
abstract mixin class _$UpdatePreferencesCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UpdatePreferencesCopyWith(_UpdatePreferences value, $Res Function(_UpdatePreferences) _then) = __$UpdatePreferencesCopyWithImpl;
@useResult
$Res call({
 bool allowNotifications, bool allowTagNotifications, bool allowLikeNotifications, bool allowReplyNotifications, bool allowRepostNotifications, bool allowMessageNotifications, bool allowFollowNotifications
});




}
/// @nodoc
class __$UpdatePreferencesCopyWithImpl<$Res>
    implements _$UpdatePreferencesCopyWith<$Res> {
  __$UpdatePreferencesCopyWithImpl(this._self, this._then);

  final _UpdatePreferences _self;
  final $Res Function(_UpdatePreferences) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allowNotifications = null,Object? allowTagNotifications = null,Object? allowLikeNotifications = null,Object? allowReplyNotifications = null,Object? allowRepostNotifications = null,Object? allowMessageNotifications = null,Object? allowFollowNotifications = null,}) {
  return _then(_UpdatePreferences(
allowNotifications: null == allowNotifications ? _self.allowNotifications : allowNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowTagNotifications: null == allowTagNotifications ? _self.allowTagNotifications : allowTagNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowLikeNotifications: null == allowLikeNotifications ? _self.allowLikeNotifications : allowLikeNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowReplyNotifications: null == allowReplyNotifications ? _self.allowReplyNotifications : allowReplyNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowRepostNotifications: null == allowRepostNotifications ? _self.allowRepostNotifications : allowRepostNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowMessageNotifications: null == allowMessageNotifications ? _self.allowMessageNotifications : allowMessageNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowFollowNotifications: null == allowFollowNotifications ? _self.allowFollowNotifications : allowFollowNotifications // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ChangeUserNotificationStatus with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ChangeUserNotificationStatus({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeUserNotificationStatusCopyWith<_ChangeUserNotificationStatus> get copyWith => __$ChangeUserNotificationStatusCopyWithImpl<_ChangeUserNotificationStatus>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.changeUserNotificationStatus'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeUserNotificationStatus&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.changeUserNotificationStatus(user: $user)';
}


}

/// @nodoc
abstract mixin class _$ChangeUserNotificationStatusCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ChangeUserNotificationStatusCopyWith(_ChangeUserNotificationStatus value, $Res Function(_ChangeUserNotificationStatus) _then) = __$ChangeUserNotificationStatusCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$ChangeUserNotificationStatusCopyWithImpl<$Res>
    implements _$ChangeUserNotificationStatusCopyWith<$Res> {
  __$ChangeUserNotificationStatusCopyWithImpl(this._self, this._then);

  final _ChangeUserNotificationStatus _self;
  final $Res Function(_ChangeUserNotificationStatus) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_ChangeUserNotificationStatus(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _GetPetitions with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetPetitions({this.searchTerm, this.lastPetition});
  

 final  String? searchTerm;
 final  Petition? lastPetition;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPetitionsCopyWith<_GetPetitions> get copyWith => __$GetPetitionsCopyWithImpl<_GetPetitions>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getPetitions'))
    ..add(DiagnosticsProperty('searchTerm', searchTerm))..add(DiagnosticsProperty('lastPetition', lastPetition));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPetitions&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.lastPetition, lastPetition) || other.lastPetition == lastPetition));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,lastPetition);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getPetitions(searchTerm: $searchTerm, lastPetition: $lastPetition)';
}


}

/// @nodoc
abstract mixin class _$GetPetitionsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetPetitionsCopyWith(_GetPetitions value, $Res Function(_GetPetitions) _then) = __$GetPetitionsCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, Petition? lastPetition
});


$PetitionCopyWith<$Res>? get lastPetition;

}
/// @nodoc
class __$GetPetitionsCopyWithImpl<$Res>
    implements _$GetPetitionsCopyWith<$Res> {
  __$GetPetitionsCopyWithImpl(this._self, this._then);

  final _GetPetitions _self;
  final $Res Function(_GetPetitions) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? lastPetition = freezed,}) {
  return _then(_GetPetitions(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,lastPetition: freezed == lastPetition ? _self.lastPetition : lastPetition // ignore: cast_nullable_to_non_nullable
as Petition?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res>? get lastPetition {
    if (_self.lastPetition == null) {
    return null;
  }

  return $PetitionCopyWith<$Res>(_self.lastPetition!, (value) {
    return _then(_self.copyWith(lastPetition: value));
  });
}
}

/// @nodoc


class _CreatePetition with DiagnosticableTreeMixin implements WebsocketEvent {
  const _CreatePetition({required this.title, required this.imagePath, required this.description});
  

 final  String title;
 final  String imagePath;
 final  String description;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePetitionCopyWith<_CreatePetition> get copyWith => __$CreatePetitionCopyWithImpl<_CreatePetition>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.createPetition'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('imagePath', imagePath))..add(DiagnosticsProperty('description', description));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePetition&&(identical(other.title, title) || other.title == title)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,imagePath,description);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.createPetition(title: $title, imagePath: $imagePath, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreatePetitionCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$CreatePetitionCopyWith(_CreatePetition value, $Res Function(_CreatePetition) _then) = __$CreatePetitionCopyWithImpl;
@useResult
$Res call({
 String title, String imagePath, String description
});




}
/// @nodoc
class __$CreatePetitionCopyWithImpl<$Res>
    implements _$CreatePetitionCopyWith<$Res> {
  __$CreatePetitionCopyWithImpl(this._self, this._then);

  final _CreatePetition _self;
  final $Res Function(_CreatePetition) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? imagePath = null,Object? description = null,}) {
  return _then(_CreatePetition(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResubscribePetitions with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ResubscribePetitions({required final  List<Petition> petitions}): _petitions = petitions;
  

 final  List<Petition> _petitions;
 List<Petition> get petitions {
  if (_petitions is EqualUnmodifiableListView) return _petitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_petitions);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResubscribePetitionsCopyWith<_ResubscribePetitions> get copyWith => __$ResubscribePetitionsCopyWithImpl<_ResubscribePetitions>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.resubscribePetitions'))
    ..add(DiagnosticsProperty('petitions', petitions));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResubscribePetitions&&const DeepCollectionEquality().equals(other._petitions, _petitions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_petitions));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.resubscribePetitions(petitions: $petitions)';
}


}

/// @nodoc
abstract mixin class _$ResubscribePetitionsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ResubscribePetitionsCopyWith(_ResubscribePetitions value, $Res Function(_ResubscribePetitions) _then) = __$ResubscribePetitionsCopyWithImpl;
@useResult
$Res call({
 List<Petition> petitions
});




}
/// @nodoc
class __$ResubscribePetitionsCopyWithImpl<$Res>
    implements _$ResubscribePetitionsCopyWith<$Res> {
  __$ResubscribePetitionsCopyWithImpl(this._self, this._then);

  final _ResubscribePetitions _self;
  final $Res Function(_ResubscribePetitions) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petitions = null,}) {
  return _then(_ResubscribePetitions(
petitions: null == petitions ? _self._petitions : petitions // ignore: cast_nullable_to_non_nullable
as List<Petition>,
  ));
}


}

/// @nodoc


class _SupportPetition with DiagnosticableTreeMixin implements WebsocketEvent {
  const _SupportPetition({required this.petition});
  

 final  Petition petition;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportPetitionCopyWith<_SupportPetition> get copyWith => __$SupportPetitionCopyWithImpl<_SupportPetition>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.supportPetition'))
    ..add(DiagnosticsProperty('petition', petition));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportPetition&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.supportPetition(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$SupportPetitionCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SupportPetitionCopyWith(_SupportPetition value, $Res Function(_SupportPetition) _then) = __$SupportPetitionCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$SupportPetitionCopyWithImpl<$Res>
    implements _$SupportPetitionCopyWith<$Res> {
  __$SupportPetitionCopyWithImpl(this._self, this._then);

  final _SupportPetition _self;
  final $Res Function(_SupportPetition) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_SupportPetition(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _GetPetitionSupporters with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetPetitionSupporters({required this.petition, this.lastUser});
  

 final  Petition petition;
 final  User? lastUser;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPetitionSupportersCopyWith<_GetPetitionSupporters> get copyWith => __$GetPetitionSupportersCopyWithImpl<_GetPetitionSupporters>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getPetitionSupporters'))
    ..add(DiagnosticsProperty('petition', petition))..add(DiagnosticsProperty('lastUser', lastUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPetitionSupporters&&(identical(other.petition, petition) || other.petition == petition)&&(identical(other.lastUser, lastUser) || other.lastUser == lastUser));
}


@override
int get hashCode => Object.hash(runtimeType,petition,lastUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getPetitionSupporters(petition: $petition, lastUser: $lastUser)';
}


}

/// @nodoc
abstract mixin class _$GetPetitionSupportersCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetPetitionSupportersCopyWith(_GetPetitionSupporters value, $Res Function(_GetPetitionSupporters) _then) = __$GetPetitionSupportersCopyWithImpl;
@useResult
$Res call({
 Petition petition, User? lastUser
});


$PetitionCopyWith<$Res> get petition;$UserCopyWith<$Res>? get lastUser;

}
/// @nodoc
class __$GetPetitionSupportersCopyWithImpl<$Res>
    implements _$GetPetitionSupportersCopyWith<$Res> {
  __$GetPetitionSupportersCopyWithImpl(this._self, this._then);

  final _GetPetitionSupporters _self;
  final $Res Function(_GetPetitionSupporters) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,Object? lastUser = freezed,}) {
  return _then(_GetPetitionSupporters(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,lastUser: freezed == lastUser ? _self.lastUser : lastUser // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get lastUser {
    if (_self.lastUser == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.lastUser!, (value) {
    return _then(_self.copyWith(lastUser: value));
  });
}
}

/// @nodoc


class _GetUserPetitions with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetUserPetitions({required this.user, this.lastPetition});
  

 final  User user;
 final  Petition? lastPetition;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetUserPetitionsCopyWith<_GetUserPetitions> get copyWith => __$GetUserPetitionsCopyWithImpl<_GetUserPetitions>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getUserPetitions'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('lastPetition', lastPetition));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUserPetitions&&(identical(other.user, user) || other.user == user)&&(identical(other.lastPetition, lastPetition) || other.lastPetition == lastPetition));
}


@override
int get hashCode => Object.hash(runtimeType,user,lastPetition);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getUserPetitions(user: $user, lastPetition: $lastPetition)';
}


}

/// @nodoc
abstract mixin class _$GetUserPetitionsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetUserPetitionsCopyWith(_GetUserPetitions value, $Res Function(_GetUserPetitions) _then) = __$GetUserPetitionsCopyWithImpl;
@useResult
$Res call({
 User user, Petition? lastPetition
});


$UserCopyWith<$Res> get user;$PetitionCopyWith<$Res>? get lastPetition;

}
/// @nodoc
class __$GetUserPetitionsCopyWithImpl<$Res>
    implements _$GetUserPetitionsCopyWith<$Res> {
  __$GetUserPetitionsCopyWithImpl(this._self, this._then);

  final _GetUserPetitions _self;
  final $Res Function(_GetUserPetitions) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? lastPetition = freezed,}) {
  return _then(_GetUserPetitions(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,lastPetition: freezed == lastPetition ? _self.lastPetition : lastPetition // ignore: cast_nullable_to_non_nullable
as Petition?,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res>? get lastPetition {
    if (_self.lastPetition == null) {
    return null;
  }

  return $PetitionCopyWith<$Res>(_self.lastPetition!, (value) {
    return _then(_self.copyWith(lastPetition: value));
  });
}
}

/// @nodoc


class _ResubscribeUserPetitions with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ResubscribeUserPetitions({required this.user, required final  List<Petition> petitions}): _petitions = petitions;
  

 final  User user;
 final  List<Petition> _petitions;
 List<Petition> get petitions {
  if (_petitions is EqualUnmodifiableListView) return _petitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_petitions);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResubscribeUserPetitionsCopyWith<_ResubscribeUserPetitions> get copyWith => __$ResubscribeUserPetitionsCopyWithImpl<_ResubscribeUserPetitions>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.resubscribeUserPetitions'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('petitions', petitions));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResubscribeUserPetitions&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._petitions, _petitions));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_petitions));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.resubscribeUserPetitions(user: $user, petitions: $petitions)';
}


}

/// @nodoc
abstract mixin class _$ResubscribeUserPetitionsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ResubscribeUserPetitionsCopyWith(_ResubscribeUserPetitions value, $Res Function(_ResubscribeUserPetitions) _then) = __$ResubscribeUserPetitionsCopyWithImpl;
@useResult
$Res call({
 User user, List<Petition> petitions
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$ResubscribeUserPetitionsCopyWithImpl<$Res>
    implements _$ResubscribeUserPetitionsCopyWith<$Res> {
  __$ResubscribeUserPetitionsCopyWithImpl(this._self, this._then);

  final _ResubscribeUserPetitions _self;
  final $Res Function(_ResubscribeUserPetitions) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? petitions = null,}) {
  return _then(_ResubscribeUserPetitions(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,petitions: null == petitions ? _self._petitions : petitions // ignore: cast_nullable_to_non_nullable
as List<Petition>,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _UnsubscribeUserPetitions with DiagnosticableTreeMixin implements WebsocketEvent {
  const _UnsubscribeUserPetitions({required this.user, required final  List<Petition> petitions}): _petitions = petitions;
  

 final  User user;
 final  List<Petition> _petitions;
 List<Petition> get petitions {
  if (_petitions is EqualUnmodifiableListView) return _petitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_petitions);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeUserPetitionsCopyWith<_UnsubscribeUserPetitions> get copyWith => __$UnsubscribeUserPetitionsCopyWithImpl<_UnsubscribeUserPetitions>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.unsubscribeUserPetitions'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('petitions', petitions));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnsubscribeUserPetitions&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._petitions, _petitions));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_petitions));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.unsubscribeUserPetitions(user: $user, petitions: $petitions)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeUserPetitionsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UnsubscribeUserPetitionsCopyWith(_UnsubscribeUserPetitions value, $Res Function(_UnsubscribeUserPetitions) _then) = __$UnsubscribeUserPetitionsCopyWithImpl;
@useResult
$Res call({
 User user, List<Petition> petitions
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UnsubscribeUserPetitionsCopyWithImpl<$Res>
    implements _$UnsubscribeUserPetitionsCopyWith<$Res> {
  __$UnsubscribeUserPetitionsCopyWithImpl(this._self, this._then);

  final _UnsubscribeUserPetitions _self;
  final $Res Function(_UnsubscribeUserPetitions) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? petitions = null,}) {
  return _then(_UnsubscribeUserPetitions(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,petitions: null == petitions ? _self._petitions : petitions // ignore: cast_nullable_to_non_nullable
as List<Petition>,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _GetConstitution with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetConstitution();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getConstitution'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConstitution);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getConstitution()';
}


}




/// @nodoc


class _GetConstitutionTags with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetConstitutionTags({this.searchTerm});
  

 final  String? searchTerm;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetConstitutionTagsCopyWith<_GetConstitutionTags> get copyWith => __$GetConstitutionTagsCopyWithImpl<_GetConstitutionTags>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getConstitutionTags'))
    ..add(DiagnosticsProperty('searchTerm', searchTerm));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConstitutionTags&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getConstitutionTags(searchTerm: $searchTerm)';
}


}

/// @nodoc
abstract mixin class _$GetConstitutionTagsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetConstitutionTagsCopyWith(_GetConstitutionTags value, $Res Function(_GetConstitutionTags) _then) = __$GetConstitutionTagsCopyWithImpl;
@useResult
$Res call({
 String? searchTerm
});




}
/// @nodoc
class __$GetConstitutionTagsCopyWithImpl<$Res>
    implements _$GetConstitutionTagsCopyWith<$Res> {
  __$GetConstitutionTagsCopyWithImpl(this._self, this._then);

  final _GetConstitutionTags _self;
  final $Res Function(_GetConstitutionTags) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,}) {
  return _then(_GetConstitutionTags(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _BookmarkSection with DiagnosticableTreeMixin implements WebsocketEvent {
  const _BookmarkSection({required this.section});
  

 final  Section section;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkSectionCopyWith<_BookmarkSection> get copyWith => __$BookmarkSectionCopyWithImpl<_BookmarkSection>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.bookmarkSection'))
    ..add(DiagnosticsProperty('section', section));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkSection&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.bookmarkSection(section: $section)';
}


}

/// @nodoc
abstract mixin class _$BookmarkSectionCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$BookmarkSectionCopyWith(_BookmarkSection value, $Res Function(_BookmarkSection) _then) = __$BookmarkSectionCopyWithImpl;
@useResult
$Res call({
 Section section
});


$SectionCopyWith<$Res> get section;

}
/// @nodoc
class __$BookmarkSectionCopyWithImpl<$Res>
    implements _$BookmarkSectionCopyWith<$Res> {
  __$BookmarkSectionCopyWithImpl(this._self, this._then);

  final _BookmarkSection _self;
  final $Res Function(_BookmarkSection) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(_BookmarkSection(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res> get section {
  
  return $SectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc


class _Disconnect with DiagnosticableTreeMixin implements WebsocketEvent {
  const _Disconnect();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.disconnect'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disconnect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.disconnect()';
}


}




// dart format on
