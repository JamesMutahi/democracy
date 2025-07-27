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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Connect value)?  connect,TResult Function( _ChangeState value)?  changeState,TResult Function( _GetPosts value)?  getPosts,TResult Function( _CreatePost value)?  createPost,TResult Function( _UpdatePost value)?  updatePost,TResult Function( _LikePost value)?  likePost,TResult Function( _BookmarkPost value)?  bookmarkPost,TResult Function( _DeletePost value)?  deletePost,TResult Function( _ReportPost value)?  reportPost,TResult Function( _GetFollowingPosts value)?  getFollowingPosts,TResult Function( _GetReplies value)?  getReplies,TResult Function( _UnsubscribeReplies value)?  unsubscribeReplies,TResult Function( _LoadUserPosts value)?  loadUserPosts,TResult Function( _LoadBookmarks value)?  loadBookmarks,TResult Function( _LoadLikedPosts value)?  loadLikedPosts,TResult Function( _LoadUserReplies value)?  loadUserReplies,TResult Function( _UnsubscribeUser value)?  unsubscribeUser,TResult Function( _UnsubscribeUserProfilePosts value)?  unsubscribeUserProfilePosts,TResult Function( _GetChats value)?  getChats,TResult Function( _CreateChat value)?  createChat,TResult Function( _SubscribeChat value)?  subscribeChat,TResult Function( _GetMessages value)?  getMessages,TResult Function( _CreateMessage value)?  createMessage,TResult Function( _EditMessage value)?  editMessage,TResult Function( _DeleteMessage value)?  deleteMessage,TResult Function( _MarkChatAsRead value)?  markChatAsRead,TResult Function( _GetPolls value)?  getPolls,TResult Function( _SubscribePoll value)?  subscribePoll,TResult Function( _Vote value)?  vote,TResult Function( _SubmitReason value)?  submitReason,TResult Function( _GetSurveys value)?  getSurveys,TResult Function( _SubmitResponse value)?  submitResponse,TResult Function( _GetUsers value)?  getUsers,TResult Function( _GetUser value)?  getUser,TResult Function( _UpdateUser value)?  updateUser,TResult Function( _MuteUser value)?  muteUser,TResult Function( _BlockUser value)?  blockUser,TResult Function( _FollowUser value)?  followUser,TResult Function( _SendDirectMessage value)?  sendDirectMessage,TResult Function( _GetNotifications value)?  getNotifications,TResult Function( _MarkNotificationAsRead value)?  markNotificationAsRead,TResult Function( _Disconnect value)?  disconnect,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _GetPosts() when getPosts != null:
return getPosts(_that);case _CreatePost() when createPost != null:
return createPost(_that);case _UpdatePost() when updatePost != null:
return updatePost(_that);case _LikePost() when likePost != null:
return likePost(_that);case _BookmarkPost() when bookmarkPost != null:
return bookmarkPost(_that);case _DeletePost() when deletePost != null:
return deletePost(_that);case _ReportPost() when reportPost != null:
return reportPost(_that);case _GetFollowingPosts() when getFollowingPosts != null:
return getFollowingPosts(_that);case _GetReplies() when getReplies != null:
return getReplies(_that);case _UnsubscribeReplies() when unsubscribeReplies != null:
return unsubscribeReplies(_that);case _LoadUserPosts() when loadUserPosts != null:
return loadUserPosts(_that);case _LoadBookmarks() when loadBookmarks != null:
return loadBookmarks(_that);case _LoadLikedPosts() when loadLikedPosts != null:
return loadLikedPosts(_that);case _LoadUserReplies() when loadUserReplies != null:
return loadUserReplies(_that);case _UnsubscribeUser() when unsubscribeUser != null:
return unsubscribeUser(_that);case _UnsubscribeUserProfilePosts() when unsubscribeUserProfilePosts != null:
return unsubscribeUserProfilePosts(_that);case _GetChats() when getChats != null:
return getChats(_that);case _CreateChat() when createChat != null:
return createChat(_that);case _SubscribeChat() when subscribeChat != null:
return subscribeChat(_that);case _GetMessages() when getMessages != null:
return getMessages(_that);case _CreateMessage() when createMessage != null:
return createMessage(_that);case _EditMessage() when editMessage != null:
return editMessage(_that);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case _MarkChatAsRead() when markChatAsRead != null:
return markChatAsRead(_that);case _GetPolls() when getPolls != null:
return getPolls(_that);case _SubscribePoll() when subscribePoll != null:
return subscribePoll(_that);case _Vote() when vote != null:
return vote(_that);case _SubmitReason() when submitReason != null:
return submitReason(_that);case _GetSurveys() when getSurveys != null:
return getSurveys(_that);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that);case _GetUsers() when getUsers != null:
return getUsers(_that);case _GetUser() when getUser != null:
return getUser(_that);case _UpdateUser() when updateUser != null:
return updateUser(_that);case _MuteUser() when muteUser != null:
return muteUser(_that);case _BlockUser() when blockUser != null:
return blockUser(_that);case _FollowUser() when followUser != null:
return followUser(_that);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that);case _GetNotifications() when getNotifications != null:
return getNotifications(_that);case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that);case _Disconnect() when disconnect != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Connect value)  connect,required TResult Function( _ChangeState value)  changeState,required TResult Function( _GetPosts value)  getPosts,required TResult Function( _CreatePost value)  createPost,required TResult Function( _UpdatePost value)  updatePost,required TResult Function( _LikePost value)  likePost,required TResult Function( _BookmarkPost value)  bookmarkPost,required TResult Function( _DeletePost value)  deletePost,required TResult Function( _ReportPost value)  reportPost,required TResult Function( _GetFollowingPosts value)  getFollowingPosts,required TResult Function( _GetReplies value)  getReplies,required TResult Function( _UnsubscribeReplies value)  unsubscribeReplies,required TResult Function( _LoadUserPosts value)  loadUserPosts,required TResult Function( _LoadBookmarks value)  loadBookmarks,required TResult Function( _LoadLikedPosts value)  loadLikedPosts,required TResult Function( _LoadUserReplies value)  loadUserReplies,required TResult Function( _UnsubscribeUser value)  unsubscribeUser,required TResult Function( _UnsubscribeUserProfilePosts value)  unsubscribeUserProfilePosts,required TResult Function( _GetChats value)  getChats,required TResult Function( _CreateChat value)  createChat,required TResult Function( _SubscribeChat value)  subscribeChat,required TResult Function( _GetMessages value)  getMessages,required TResult Function( _CreateMessage value)  createMessage,required TResult Function( _EditMessage value)  editMessage,required TResult Function( _DeleteMessage value)  deleteMessage,required TResult Function( _MarkChatAsRead value)  markChatAsRead,required TResult Function( _GetPolls value)  getPolls,required TResult Function( _SubscribePoll value)  subscribePoll,required TResult Function( _Vote value)  vote,required TResult Function( _SubmitReason value)  submitReason,required TResult Function( _GetSurveys value)  getSurveys,required TResult Function( _SubmitResponse value)  submitResponse,required TResult Function( _GetUsers value)  getUsers,required TResult Function( _GetUser value)  getUser,required TResult Function( _UpdateUser value)  updateUser,required TResult Function( _MuteUser value)  muteUser,required TResult Function( _BlockUser value)  blockUser,required TResult Function( _FollowUser value)  followUser,required TResult Function( _SendDirectMessage value)  sendDirectMessage,required TResult Function( _GetNotifications value)  getNotifications,required TResult Function( _MarkNotificationAsRead value)  markNotificationAsRead,required TResult Function( _Disconnect value)  disconnect,}){
final _that = this;
switch (_that) {
case _Connect():
return connect(_that);case _ChangeState():
return changeState(_that);case _GetPosts():
return getPosts(_that);case _CreatePost():
return createPost(_that);case _UpdatePost():
return updatePost(_that);case _LikePost():
return likePost(_that);case _BookmarkPost():
return bookmarkPost(_that);case _DeletePost():
return deletePost(_that);case _ReportPost():
return reportPost(_that);case _GetFollowingPosts():
return getFollowingPosts(_that);case _GetReplies():
return getReplies(_that);case _UnsubscribeReplies():
return unsubscribeReplies(_that);case _LoadUserPosts():
return loadUserPosts(_that);case _LoadBookmarks():
return loadBookmarks(_that);case _LoadLikedPosts():
return loadLikedPosts(_that);case _LoadUserReplies():
return loadUserReplies(_that);case _UnsubscribeUser():
return unsubscribeUser(_that);case _UnsubscribeUserProfilePosts():
return unsubscribeUserProfilePosts(_that);case _GetChats():
return getChats(_that);case _CreateChat():
return createChat(_that);case _SubscribeChat():
return subscribeChat(_that);case _GetMessages():
return getMessages(_that);case _CreateMessage():
return createMessage(_that);case _EditMessage():
return editMessage(_that);case _DeleteMessage():
return deleteMessage(_that);case _MarkChatAsRead():
return markChatAsRead(_that);case _GetPolls():
return getPolls(_that);case _SubscribePoll():
return subscribePoll(_that);case _Vote():
return vote(_that);case _SubmitReason():
return submitReason(_that);case _GetSurveys():
return getSurveys(_that);case _SubmitResponse():
return submitResponse(_that);case _GetUsers():
return getUsers(_that);case _GetUser():
return getUser(_that);case _UpdateUser():
return updateUser(_that);case _MuteUser():
return muteUser(_that);case _BlockUser():
return blockUser(_that);case _FollowUser():
return followUser(_that);case _SendDirectMessage():
return sendDirectMessage(_that);case _GetNotifications():
return getNotifications(_that);case _MarkNotificationAsRead():
return markNotificationAsRead(_that);case _Disconnect():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Connect value)?  connect,TResult? Function( _ChangeState value)?  changeState,TResult? Function( _GetPosts value)?  getPosts,TResult? Function( _CreatePost value)?  createPost,TResult? Function( _UpdatePost value)?  updatePost,TResult? Function( _LikePost value)?  likePost,TResult? Function( _BookmarkPost value)?  bookmarkPost,TResult? Function( _DeletePost value)?  deletePost,TResult? Function( _ReportPost value)?  reportPost,TResult? Function( _GetFollowingPosts value)?  getFollowingPosts,TResult? Function( _GetReplies value)?  getReplies,TResult? Function( _UnsubscribeReplies value)?  unsubscribeReplies,TResult? Function( _LoadUserPosts value)?  loadUserPosts,TResult? Function( _LoadBookmarks value)?  loadBookmarks,TResult? Function( _LoadLikedPosts value)?  loadLikedPosts,TResult? Function( _LoadUserReplies value)?  loadUserReplies,TResult? Function( _UnsubscribeUser value)?  unsubscribeUser,TResult? Function( _UnsubscribeUserProfilePosts value)?  unsubscribeUserProfilePosts,TResult? Function( _GetChats value)?  getChats,TResult? Function( _CreateChat value)?  createChat,TResult? Function( _SubscribeChat value)?  subscribeChat,TResult? Function( _GetMessages value)?  getMessages,TResult? Function( _CreateMessage value)?  createMessage,TResult? Function( _EditMessage value)?  editMessage,TResult? Function( _DeleteMessage value)?  deleteMessage,TResult? Function( _MarkChatAsRead value)?  markChatAsRead,TResult? Function( _GetPolls value)?  getPolls,TResult? Function( _SubscribePoll value)?  subscribePoll,TResult? Function( _Vote value)?  vote,TResult? Function( _SubmitReason value)?  submitReason,TResult? Function( _GetSurveys value)?  getSurveys,TResult? Function( _SubmitResponse value)?  submitResponse,TResult? Function( _GetUsers value)?  getUsers,TResult? Function( _GetUser value)?  getUser,TResult? Function( _UpdateUser value)?  updateUser,TResult? Function( _MuteUser value)?  muteUser,TResult? Function( _BlockUser value)?  blockUser,TResult? Function( _FollowUser value)?  followUser,TResult? Function( _SendDirectMessage value)?  sendDirectMessage,TResult? Function( _GetNotifications value)?  getNotifications,TResult? Function( _MarkNotificationAsRead value)?  markNotificationAsRead,TResult? Function( _Disconnect value)?  disconnect,}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _GetPosts() when getPosts != null:
return getPosts(_that);case _CreatePost() when createPost != null:
return createPost(_that);case _UpdatePost() when updatePost != null:
return updatePost(_that);case _LikePost() when likePost != null:
return likePost(_that);case _BookmarkPost() when bookmarkPost != null:
return bookmarkPost(_that);case _DeletePost() when deletePost != null:
return deletePost(_that);case _ReportPost() when reportPost != null:
return reportPost(_that);case _GetFollowingPosts() when getFollowingPosts != null:
return getFollowingPosts(_that);case _GetReplies() when getReplies != null:
return getReplies(_that);case _UnsubscribeReplies() when unsubscribeReplies != null:
return unsubscribeReplies(_that);case _LoadUserPosts() when loadUserPosts != null:
return loadUserPosts(_that);case _LoadBookmarks() when loadBookmarks != null:
return loadBookmarks(_that);case _LoadLikedPosts() when loadLikedPosts != null:
return loadLikedPosts(_that);case _LoadUserReplies() when loadUserReplies != null:
return loadUserReplies(_that);case _UnsubscribeUser() when unsubscribeUser != null:
return unsubscribeUser(_that);case _UnsubscribeUserProfilePosts() when unsubscribeUserProfilePosts != null:
return unsubscribeUserProfilePosts(_that);case _GetChats() when getChats != null:
return getChats(_that);case _CreateChat() when createChat != null:
return createChat(_that);case _SubscribeChat() when subscribeChat != null:
return subscribeChat(_that);case _GetMessages() when getMessages != null:
return getMessages(_that);case _CreateMessage() when createMessage != null:
return createMessage(_that);case _EditMessage() when editMessage != null:
return editMessage(_that);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case _MarkChatAsRead() when markChatAsRead != null:
return markChatAsRead(_that);case _GetPolls() when getPolls != null:
return getPolls(_that);case _SubscribePoll() when subscribePoll != null:
return subscribePoll(_that);case _Vote() when vote != null:
return vote(_that);case _SubmitReason() when submitReason != null:
return submitReason(_that);case _GetSurveys() when getSurveys != null:
return getSurveys(_that);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that);case _GetUsers() when getUsers != null:
return getUsers(_that);case _GetUser() when getUser != null:
return getUser(_that);case _UpdateUser() when updateUser != null:
return updateUser(_that);case _MuteUser() when muteUser != null:
return muteUser(_that);case _BlockUser() when blockUser != null:
return blockUser(_that);case _FollowUser() when followUser != null:
return followUser(_that);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that);case _GetNotifications() when getNotifications != null:
return getNotifications(_that);case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that);case _Disconnect() when disconnect != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connect,TResult Function( WebsocketState state)?  changeState,TResult Function()?  getPosts,TResult Function( String body,  PostStatus status,  Post? repostOf,  Post? replyTo,  Poll? poll,  Survey? survey,  List<int> taggedUserIds)?  createPost,TResult Function( int id,  String body)?  updatePost,TResult Function( Post post)?  likePost,TResult Function( Post post)?  bookmarkPost,TResult Function( Post post)?  deletePost,TResult Function( String issue,  Post post)?  reportPost,TResult Function()?  getFollowingPosts,TResult Function( Post post)?  getReplies,TResult Function( Post post)?  unsubscribeReplies,TResult Function( User user)?  loadUserPosts,TResult Function( User user)?  loadBookmarks,TResult Function( User user)?  loadLikedPosts,TResult Function( User user)?  loadUserReplies,TResult Function( User user)?  unsubscribeUser,TResult Function( User user)?  unsubscribeUserProfilePosts,TResult Function( int page)?  getChats,TResult Function( User user)?  createChat,TResult Function( Chat chat)?  subscribeChat,TResult Function( Chat chat)?  getMessages,TResult Function( Chat chat,  String text,  Post? post,  Poll? poll,  Survey? survey)?  createMessage,TResult Function( int messageId,  String text)?  editMessage,TResult Function( List<Message> messages)?  deleteMessage,TResult Function( Chat chat)?  markChatAsRead,TResult Function( int page)?  getPolls,TResult Function( Poll poll)?  subscribePoll,TResult Function( Option option)?  vote,TResult Function( Poll poll,  String text)?  submitReason,TResult Function( int page)?  getSurveys,TResult Function( Survey survey,  DateTime startTime,  DateTime endTime,  List<TextAnswer> textAnswers,  List<ChoiceAnswer> choiceAnswers)?  submitResponse,TResult Function( String searchTerm,  int page)?  getUsers,TResult Function( User user)?  getUser,TResult Function( User user,  String name,  String status,  String? imagePath,  String? coverPhotoPath)?  updateUser,TResult Function( User user)?  muteUser,TResult Function( User user)?  blockUser,TResult Function( User user)?  followUser,TResult Function( List<User> users,  String text,  Post? post,  Poll? poll,  Survey? survey)?  sendDirectMessage,TResult Function()?  getNotifications,TResult Function( Notification notification)?  markNotificationAsRead,TResult Function()?  disconnect,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _GetPosts() when getPosts != null:
return getPosts();case _CreatePost() when createPost != null:
return createPost(_that.body,_that.status,_that.repostOf,_that.replyTo,_that.poll,_that.survey,_that.taggedUserIds);case _UpdatePost() when updatePost != null:
return updatePost(_that.id,_that.body);case _LikePost() when likePost != null:
return likePost(_that.post);case _BookmarkPost() when bookmarkPost != null:
return bookmarkPost(_that.post);case _DeletePost() when deletePost != null:
return deletePost(_that.post);case _ReportPost() when reportPost != null:
return reportPost(_that.issue,_that.post);case _GetFollowingPosts() when getFollowingPosts != null:
return getFollowingPosts();case _GetReplies() when getReplies != null:
return getReplies(_that.post);case _UnsubscribeReplies() when unsubscribeReplies != null:
return unsubscribeReplies(_that.post);case _LoadUserPosts() when loadUserPosts != null:
return loadUserPosts(_that.user);case _LoadBookmarks() when loadBookmarks != null:
return loadBookmarks(_that.user);case _LoadLikedPosts() when loadLikedPosts != null:
return loadLikedPosts(_that.user);case _LoadUserReplies() when loadUserReplies != null:
return loadUserReplies(_that.user);case _UnsubscribeUser() when unsubscribeUser != null:
return unsubscribeUser(_that.user);case _UnsubscribeUserProfilePosts() when unsubscribeUserProfilePosts != null:
return unsubscribeUserProfilePosts(_that.user);case _GetChats() when getChats != null:
return getChats(_that.page);case _CreateChat() when createChat != null:
return createChat(_that.user);case _SubscribeChat() when subscribeChat != null:
return subscribeChat(_that.chat);case _GetMessages() when getMessages != null:
return getMessages(_that.chat);case _CreateMessage() when createMessage != null:
return createMessage(_that.chat,_that.text,_that.post,_that.poll,_that.survey);case _EditMessage() when editMessage != null:
return editMessage(_that.messageId,_that.text);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.messages);case _MarkChatAsRead() when markChatAsRead != null:
return markChatAsRead(_that.chat);case _GetPolls() when getPolls != null:
return getPolls(_that.page);case _SubscribePoll() when subscribePoll != null:
return subscribePoll(_that.poll);case _Vote() when vote != null:
return vote(_that.option);case _SubmitReason() when submitReason != null:
return submitReason(_that.poll,_that.text);case _GetSurveys() when getSurveys != null:
return getSurveys(_that.page);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that.survey,_that.startTime,_that.endTime,_that.textAnswers,_that.choiceAnswers);case _GetUsers() when getUsers != null:
return getUsers(_that.searchTerm,_that.page);case _GetUser() when getUser != null:
return getUser(_that.user);case _UpdateUser() when updateUser != null:
return updateUser(_that.user,_that.name,_that.status,_that.imagePath,_that.coverPhotoPath);case _MuteUser() when muteUser != null:
return muteUser(_that.user);case _BlockUser() when blockUser != null:
return blockUser(_that.user);case _FollowUser() when followUser != null:
return followUser(_that.user);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that.users,_that.text,_that.post,_that.poll,_that.survey);case _GetNotifications() when getNotifications != null:
return getNotifications();case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that.notification);case _Disconnect() when disconnect != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connect,required TResult Function( WebsocketState state)  changeState,required TResult Function()  getPosts,required TResult Function( String body,  PostStatus status,  Post? repostOf,  Post? replyTo,  Poll? poll,  Survey? survey,  List<int> taggedUserIds)  createPost,required TResult Function( int id,  String body)  updatePost,required TResult Function( Post post)  likePost,required TResult Function( Post post)  bookmarkPost,required TResult Function( Post post)  deletePost,required TResult Function( String issue,  Post post)  reportPost,required TResult Function()  getFollowingPosts,required TResult Function( Post post)  getReplies,required TResult Function( Post post)  unsubscribeReplies,required TResult Function( User user)  loadUserPosts,required TResult Function( User user)  loadBookmarks,required TResult Function( User user)  loadLikedPosts,required TResult Function( User user)  loadUserReplies,required TResult Function( User user)  unsubscribeUser,required TResult Function( User user)  unsubscribeUserProfilePosts,required TResult Function( int page)  getChats,required TResult Function( User user)  createChat,required TResult Function( Chat chat)  subscribeChat,required TResult Function( Chat chat)  getMessages,required TResult Function( Chat chat,  String text,  Post? post,  Poll? poll,  Survey? survey)  createMessage,required TResult Function( int messageId,  String text)  editMessage,required TResult Function( List<Message> messages)  deleteMessage,required TResult Function( Chat chat)  markChatAsRead,required TResult Function( int page)  getPolls,required TResult Function( Poll poll)  subscribePoll,required TResult Function( Option option)  vote,required TResult Function( Poll poll,  String text)  submitReason,required TResult Function( int page)  getSurveys,required TResult Function( Survey survey,  DateTime startTime,  DateTime endTime,  List<TextAnswer> textAnswers,  List<ChoiceAnswer> choiceAnswers)  submitResponse,required TResult Function( String searchTerm,  int page)  getUsers,required TResult Function( User user)  getUser,required TResult Function( User user,  String name,  String status,  String? imagePath,  String? coverPhotoPath)  updateUser,required TResult Function( User user)  muteUser,required TResult Function( User user)  blockUser,required TResult Function( User user)  followUser,required TResult Function( List<User> users,  String text,  Post? post,  Poll? poll,  Survey? survey)  sendDirectMessage,required TResult Function()  getNotifications,required TResult Function( Notification notification)  markNotificationAsRead,required TResult Function()  disconnect,}) {final _that = this;
switch (_that) {
case _Connect():
return connect();case _ChangeState():
return changeState(_that.state);case _GetPosts():
return getPosts();case _CreatePost():
return createPost(_that.body,_that.status,_that.repostOf,_that.replyTo,_that.poll,_that.survey,_that.taggedUserIds);case _UpdatePost():
return updatePost(_that.id,_that.body);case _LikePost():
return likePost(_that.post);case _BookmarkPost():
return bookmarkPost(_that.post);case _DeletePost():
return deletePost(_that.post);case _ReportPost():
return reportPost(_that.issue,_that.post);case _GetFollowingPosts():
return getFollowingPosts();case _GetReplies():
return getReplies(_that.post);case _UnsubscribeReplies():
return unsubscribeReplies(_that.post);case _LoadUserPosts():
return loadUserPosts(_that.user);case _LoadBookmarks():
return loadBookmarks(_that.user);case _LoadLikedPosts():
return loadLikedPosts(_that.user);case _LoadUserReplies():
return loadUserReplies(_that.user);case _UnsubscribeUser():
return unsubscribeUser(_that.user);case _UnsubscribeUserProfilePosts():
return unsubscribeUserProfilePosts(_that.user);case _GetChats():
return getChats(_that.page);case _CreateChat():
return createChat(_that.user);case _SubscribeChat():
return subscribeChat(_that.chat);case _GetMessages():
return getMessages(_that.chat);case _CreateMessage():
return createMessage(_that.chat,_that.text,_that.post,_that.poll,_that.survey);case _EditMessage():
return editMessage(_that.messageId,_that.text);case _DeleteMessage():
return deleteMessage(_that.messages);case _MarkChatAsRead():
return markChatAsRead(_that.chat);case _GetPolls():
return getPolls(_that.page);case _SubscribePoll():
return subscribePoll(_that.poll);case _Vote():
return vote(_that.option);case _SubmitReason():
return submitReason(_that.poll,_that.text);case _GetSurveys():
return getSurveys(_that.page);case _SubmitResponse():
return submitResponse(_that.survey,_that.startTime,_that.endTime,_that.textAnswers,_that.choiceAnswers);case _GetUsers():
return getUsers(_that.searchTerm,_that.page);case _GetUser():
return getUser(_that.user);case _UpdateUser():
return updateUser(_that.user,_that.name,_that.status,_that.imagePath,_that.coverPhotoPath);case _MuteUser():
return muteUser(_that.user);case _BlockUser():
return blockUser(_that.user);case _FollowUser():
return followUser(_that.user);case _SendDirectMessage():
return sendDirectMessage(_that.users,_that.text,_that.post,_that.poll,_that.survey);case _GetNotifications():
return getNotifications();case _MarkNotificationAsRead():
return markNotificationAsRead(_that.notification);case _Disconnect():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connect,TResult? Function( WebsocketState state)?  changeState,TResult? Function()?  getPosts,TResult? Function( String body,  PostStatus status,  Post? repostOf,  Post? replyTo,  Poll? poll,  Survey? survey,  List<int> taggedUserIds)?  createPost,TResult? Function( int id,  String body)?  updatePost,TResult? Function( Post post)?  likePost,TResult? Function( Post post)?  bookmarkPost,TResult? Function( Post post)?  deletePost,TResult? Function( String issue,  Post post)?  reportPost,TResult? Function()?  getFollowingPosts,TResult? Function( Post post)?  getReplies,TResult? Function( Post post)?  unsubscribeReplies,TResult? Function( User user)?  loadUserPosts,TResult? Function( User user)?  loadBookmarks,TResult? Function( User user)?  loadLikedPosts,TResult? Function( User user)?  loadUserReplies,TResult? Function( User user)?  unsubscribeUser,TResult? Function( User user)?  unsubscribeUserProfilePosts,TResult? Function( int page)?  getChats,TResult? Function( User user)?  createChat,TResult? Function( Chat chat)?  subscribeChat,TResult? Function( Chat chat)?  getMessages,TResult? Function( Chat chat,  String text,  Post? post,  Poll? poll,  Survey? survey)?  createMessage,TResult? Function( int messageId,  String text)?  editMessage,TResult? Function( List<Message> messages)?  deleteMessage,TResult? Function( Chat chat)?  markChatAsRead,TResult? Function( int page)?  getPolls,TResult? Function( Poll poll)?  subscribePoll,TResult? Function( Option option)?  vote,TResult? Function( Poll poll,  String text)?  submitReason,TResult? Function( int page)?  getSurveys,TResult? Function( Survey survey,  DateTime startTime,  DateTime endTime,  List<TextAnswer> textAnswers,  List<ChoiceAnswer> choiceAnswers)?  submitResponse,TResult? Function( String searchTerm,  int page)?  getUsers,TResult? Function( User user)?  getUser,TResult? Function( User user,  String name,  String status,  String? imagePath,  String? coverPhotoPath)?  updateUser,TResult? Function( User user)?  muteUser,TResult? Function( User user)?  blockUser,TResult? Function( User user)?  followUser,TResult? Function( List<User> users,  String text,  Post? post,  Poll? poll,  Survey? survey)?  sendDirectMessage,TResult? Function()?  getNotifications,TResult? Function( Notification notification)?  markNotificationAsRead,TResult? Function()?  disconnect,}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _GetPosts() when getPosts != null:
return getPosts();case _CreatePost() when createPost != null:
return createPost(_that.body,_that.status,_that.repostOf,_that.replyTo,_that.poll,_that.survey,_that.taggedUserIds);case _UpdatePost() when updatePost != null:
return updatePost(_that.id,_that.body);case _LikePost() when likePost != null:
return likePost(_that.post);case _BookmarkPost() when bookmarkPost != null:
return bookmarkPost(_that.post);case _DeletePost() when deletePost != null:
return deletePost(_that.post);case _ReportPost() when reportPost != null:
return reportPost(_that.issue,_that.post);case _GetFollowingPosts() when getFollowingPosts != null:
return getFollowingPosts();case _GetReplies() when getReplies != null:
return getReplies(_that.post);case _UnsubscribeReplies() when unsubscribeReplies != null:
return unsubscribeReplies(_that.post);case _LoadUserPosts() when loadUserPosts != null:
return loadUserPosts(_that.user);case _LoadBookmarks() when loadBookmarks != null:
return loadBookmarks(_that.user);case _LoadLikedPosts() when loadLikedPosts != null:
return loadLikedPosts(_that.user);case _LoadUserReplies() when loadUserReplies != null:
return loadUserReplies(_that.user);case _UnsubscribeUser() when unsubscribeUser != null:
return unsubscribeUser(_that.user);case _UnsubscribeUserProfilePosts() when unsubscribeUserProfilePosts != null:
return unsubscribeUserProfilePosts(_that.user);case _GetChats() when getChats != null:
return getChats(_that.page);case _CreateChat() when createChat != null:
return createChat(_that.user);case _SubscribeChat() when subscribeChat != null:
return subscribeChat(_that.chat);case _GetMessages() when getMessages != null:
return getMessages(_that.chat);case _CreateMessage() when createMessage != null:
return createMessage(_that.chat,_that.text,_that.post,_that.poll,_that.survey);case _EditMessage() when editMessage != null:
return editMessage(_that.messageId,_that.text);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.messages);case _MarkChatAsRead() when markChatAsRead != null:
return markChatAsRead(_that.chat);case _GetPolls() when getPolls != null:
return getPolls(_that.page);case _SubscribePoll() when subscribePoll != null:
return subscribePoll(_that.poll);case _Vote() when vote != null:
return vote(_that.option);case _SubmitReason() when submitReason != null:
return submitReason(_that.poll,_that.text);case _GetSurveys() when getSurveys != null:
return getSurveys(_that.page);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that.survey,_that.startTime,_that.endTime,_that.textAnswers,_that.choiceAnswers);case _GetUsers() when getUsers != null:
return getUsers(_that.searchTerm,_that.page);case _GetUser() when getUser != null:
return getUser(_that.user);case _UpdateUser() when updateUser != null:
return updateUser(_that.user,_that.name,_that.status,_that.imagePath,_that.coverPhotoPath);case _MuteUser() when muteUser != null:
return muteUser(_that.user);case _BlockUser() when blockUser != null:
return blockUser(_that.user);case _FollowUser() when followUser != null:
return followUser(_that.user);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that.users,_that.text,_that.post,_that.poll,_that.survey);case _GetNotifications() when getNotifications != null:
return getNotifications();case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that.notification);case _Disconnect() when disconnect != null:
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


$WebsocketStateCopyWith<$Res> get state;

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

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WebsocketStateCopyWith<$Res> get state {
  
  return $WebsocketStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

/// @nodoc


class _GetPosts with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetPosts();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getPosts'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPosts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getPosts()';
}


}




/// @nodoc


class _CreatePost with DiagnosticableTreeMixin implements WebsocketEvent {
  const _CreatePost({required this.body, required this.status, required this.repostOf, required this.replyTo, required this.poll, required this.survey, required final  List<int> taggedUserIds}): _taggedUserIds = taggedUserIds;
  

 final  String body;
 final  PostStatus status;
 final  Post? repostOf;
 final  Post? replyTo;
 final  Poll? poll;
 final  Survey? survey;
 final  List<int> _taggedUserIds;
 List<int> get taggedUserIds {
  if (_taggedUserIds is EqualUnmodifiableListView) return _taggedUserIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_taggedUserIds);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePostCopyWith<_CreatePost> get copyWith => __$CreatePostCopyWithImpl<_CreatePost>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.createPost'))
    ..add(DiagnosticsProperty('body', body))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('repostOf', repostOf))..add(DiagnosticsProperty('replyTo', replyTo))..add(DiagnosticsProperty('poll', poll))..add(DiagnosticsProperty('survey', survey))..add(DiagnosticsProperty('taggedUserIds', taggedUserIds));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePost&&(identical(other.body, body) || other.body == body)&&(identical(other.status, status) || other.status == status)&&(identical(other.repostOf, repostOf) || other.repostOf == repostOf)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.survey, survey) || other.survey == survey)&&const DeepCollectionEquality().equals(other._taggedUserIds, _taggedUserIds));
}


@override
int get hashCode => Object.hash(runtimeType,body,status,repostOf,replyTo,poll,survey,const DeepCollectionEquality().hash(_taggedUserIds));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.createPost(body: $body, status: $status, repostOf: $repostOf, replyTo: $replyTo, poll: $poll, survey: $survey, taggedUserIds: $taggedUserIds)';
}


}

/// @nodoc
abstract mixin class _$CreatePostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$CreatePostCopyWith(_CreatePost value, $Res Function(_CreatePost) _then) = __$CreatePostCopyWithImpl;
@useResult
$Res call({
 String body, PostStatus status, Post? repostOf, Post? replyTo, Poll? poll, Survey? survey, List<int> taggedUserIds
});


$PostCopyWith<$Res>? get repostOf;$PostCopyWith<$Res>? get replyTo;$PollCopyWith<$Res>? get poll;$SurveyCopyWith<$Res>? get survey;

}
/// @nodoc
class __$CreatePostCopyWithImpl<$Res>
    implements _$CreatePostCopyWith<$Res> {
  __$CreatePostCopyWithImpl(this._self, this._then);

  final _CreatePost _self;
  final $Res Function(_CreatePost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,Object? status = null,Object? repostOf = freezed,Object? replyTo = freezed,Object? poll = freezed,Object? survey = freezed,Object? taggedUserIds = null,}) {
  return _then(_CreatePost(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostStatus,repostOf: freezed == repostOf ? _self.repostOf : repostOf // ignore: cast_nullable_to_non_nullable
as Post?,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Post?,poll: freezed == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,taggedUserIds: null == taggedUserIds ? _self._taggedUserIds : taggedUserIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get repostOf {
    if (_self.repostOf == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.repostOf!, (value) {
    return _then(_self.copyWith(repostOf: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get replyTo {
    if (_self.replyTo == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.replyTo!, (value) {
    return _then(_self.copyWith(replyTo: value));
  });
}/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res>? get poll {
    if (_self.poll == null) {
    return null;
  }

  return $PollCopyWith<$Res>(_self.poll!, (value) {
    return _then(_self.copyWith(poll: value));
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
}
}

/// @nodoc


class _UpdatePost with DiagnosticableTreeMixin implements WebsocketEvent {
  const _UpdatePost({required this.id, required this.body});
  

 final  int id;
 final  String body;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePostCopyWith<_UpdatePost> get copyWith => __$UpdatePostCopyWithImpl<_UpdatePost>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.updatePost'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('body', body));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePost&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,id,body);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.updatePost(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class _$UpdatePostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UpdatePostCopyWith(_UpdatePost value, $Res Function(_UpdatePost) _then) = __$UpdatePostCopyWithImpl;
@useResult
$Res call({
 int id, String body
});




}
/// @nodoc
class __$UpdatePostCopyWithImpl<$Res>
    implements _$UpdatePostCopyWith<$Res> {
  __$UpdatePostCopyWithImpl(this._self, this._then);

  final _UpdatePost _self;
  final $Res Function(_UpdatePost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,}) {
  return _then(_UpdatePost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LikePost with DiagnosticableTreeMixin implements WebsocketEvent {
  const _LikePost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikePostCopyWith<_LikePost> get copyWith => __$LikePostCopyWithImpl<_LikePost>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.likePost'))
    ..add(DiagnosticsProperty('post', post));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikePost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.likePost(post: $post)';
}


}

/// @nodoc
abstract mixin class _$LikePostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$LikePostCopyWith(_LikePost value, $Res Function(_LikePost) _then) = __$LikePostCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$LikePostCopyWithImpl<$Res>
    implements _$LikePostCopyWith<$Res> {
  __$LikePostCopyWithImpl(this._self, this._then);

  final _LikePost _self;
  final $Res Function(_LikePost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_LikePost(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _BookmarkPost with DiagnosticableTreeMixin implements WebsocketEvent {
  const _BookmarkPost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkPostCopyWith<_BookmarkPost> get copyWith => __$BookmarkPostCopyWithImpl<_BookmarkPost>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.bookmarkPost'))
    ..add(DiagnosticsProperty('post', post));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkPost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.bookmarkPost(post: $post)';
}


}

/// @nodoc
abstract mixin class _$BookmarkPostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$BookmarkPostCopyWith(_BookmarkPost value, $Res Function(_BookmarkPost) _then) = __$BookmarkPostCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$BookmarkPostCopyWithImpl<$Res>
    implements _$BookmarkPostCopyWith<$Res> {
  __$BookmarkPostCopyWithImpl(this._self, this._then);

  final _BookmarkPost _self;
  final $Res Function(_BookmarkPost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_BookmarkPost(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _DeletePost with DiagnosticableTreeMixin implements WebsocketEvent {
  const _DeletePost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePostCopyWith<_DeletePost> get copyWith => __$DeletePostCopyWithImpl<_DeletePost>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.deletePost'))
    ..add(DiagnosticsProperty('post', post));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.deletePost(post: $post)';
}


}

/// @nodoc
abstract mixin class _$DeletePostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$DeletePostCopyWith(_DeletePost value, $Res Function(_DeletePost) _then) = __$DeletePostCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$DeletePostCopyWithImpl<$Res>
    implements _$DeletePostCopyWith<$Res> {
  __$DeletePostCopyWithImpl(this._self, this._then);

  final _DeletePost _self;
  final $Res Function(_DeletePost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_DeletePost(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _ReportPost with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ReportPost({required this.issue, required this.post});
  

 final  String issue;
 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportPostCopyWith<_ReportPost> get copyWith => __$ReportPostCopyWithImpl<_ReportPost>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.reportPost'))
    ..add(DiagnosticsProperty('issue', issue))..add(DiagnosticsProperty('post', post));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportPost&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,issue,post);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.reportPost(issue: $issue, post: $post)';
}


}

/// @nodoc
abstract mixin class _$ReportPostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ReportPostCopyWith(_ReportPost value, $Res Function(_ReportPost) _then) = __$ReportPostCopyWithImpl;
@useResult
$Res call({
 String issue, Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$ReportPostCopyWithImpl<$Res>
    implements _$ReportPostCopyWith<$Res> {
  __$ReportPostCopyWithImpl(this._self, this._then);

  final _ReportPost _self;
  final $Res Function(_ReportPost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? issue = null,Object? post = null,}) {
  return _then(_ReportPost(
issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _GetFollowingPosts with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetFollowingPosts();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getFollowingPosts'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetFollowingPosts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getFollowingPosts()';
}


}




/// @nodoc


class _GetReplies with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetReplies({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRepliesCopyWith<_GetReplies> get copyWith => __$GetRepliesCopyWithImpl<_GetReplies>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getReplies'))
    ..add(DiagnosticsProperty('post', post));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetReplies&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getReplies(post: $post)';
}


}

/// @nodoc
abstract mixin class _$GetRepliesCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetRepliesCopyWith(_GetReplies value, $Res Function(_GetReplies) _then) = __$GetRepliesCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$GetRepliesCopyWithImpl<$Res>
    implements _$GetRepliesCopyWith<$Res> {
  __$GetRepliesCopyWithImpl(this._self, this._then);

  final _GetReplies _self;
  final $Res Function(_GetReplies) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_GetReplies(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _UnsubscribeReplies with DiagnosticableTreeMixin implements WebsocketEvent {
  const _UnsubscribeReplies({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeRepliesCopyWith<_UnsubscribeReplies> get copyWith => __$UnsubscribeRepliesCopyWithImpl<_UnsubscribeReplies>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.unsubscribeReplies'))
    ..add(DiagnosticsProperty('post', post));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnsubscribeReplies&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.unsubscribeReplies(post: $post)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeRepliesCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UnsubscribeRepliesCopyWith(_UnsubscribeReplies value, $Res Function(_UnsubscribeReplies) _then) = __$UnsubscribeRepliesCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$UnsubscribeRepliesCopyWithImpl<$Res>
    implements _$UnsubscribeRepliesCopyWith<$Res> {
  __$UnsubscribeRepliesCopyWithImpl(this._self, this._then);

  final _UnsubscribeReplies _self;
  final $Res Function(_UnsubscribeReplies) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_UnsubscribeReplies(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _LoadUserPosts with DiagnosticableTreeMixin implements WebsocketEvent {
  const _LoadUserPosts({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadUserPostsCopyWith<_LoadUserPosts> get copyWith => __$LoadUserPostsCopyWithImpl<_LoadUserPosts>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.loadUserPosts'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadUserPosts&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.loadUserPosts(user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoadUserPostsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$LoadUserPostsCopyWith(_LoadUserPosts value, $Res Function(_LoadUserPosts) _then) = __$LoadUserPostsCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$LoadUserPostsCopyWithImpl<$Res>
    implements _$LoadUserPostsCopyWith<$Res> {
  __$LoadUserPostsCopyWithImpl(this._self, this._then);

  final _LoadUserPosts _self;
  final $Res Function(_LoadUserPosts) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_LoadUserPosts(
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


class _LoadBookmarks with DiagnosticableTreeMixin implements WebsocketEvent {
  const _LoadBookmarks({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadBookmarksCopyWith<_LoadBookmarks> get copyWith => __$LoadBookmarksCopyWithImpl<_LoadBookmarks>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.loadBookmarks'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadBookmarks&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.loadBookmarks(user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoadBookmarksCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$LoadBookmarksCopyWith(_LoadBookmarks value, $Res Function(_LoadBookmarks) _then) = __$LoadBookmarksCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$LoadBookmarksCopyWithImpl<$Res>
    implements _$LoadBookmarksCopyWith<$Res> {
  __$LoadBookmarksCopyWithImpl(this._self, this._then);

  final _LoadBookmarks _self;
  final $Res Function(_LoadBookmarks) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_LoadBookmarks(
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


class _LoadLikedPosts with DiagnosticableTreeMixin implements WebsocketEvent {
  const _LoadLikedPosts({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadLikedPostsCopyWith<_LoadLikedPosts> get copyWith => __$LoadLikedPostsCopyWithImpl<_LoadLikedPosts>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.loadLikedPosts'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadLikedPosts&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.loadLikedPosts(user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoadLikedPostsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$LoadLikedPostsCopyWith(_LoadLikedPosts value, $Res Function(_LoadLikedPosts) _then) = __$LoadLikedPostsCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$LoadLikedPostsCopyWithImpl<$Res>
    implements _$LoadLikedPostsCopyWith<$Res> {
  __$LoadLikedPostsCopyWithImpl(this._self, this._then);

  final _LoadLikedPosts _self;
  final $Res Function(_LoadLikedPosts) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_LoadLikedPosts(
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


class _LoadUserReplies with DiagnosticableTreeMixin implements WebsocketEvent {
  const _LoadUserReplies({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadUserRepliesCopyWith<_LoadUserReplies> get copyWith => __$LoadUserRepliesCopyWithImpl<_LoadUserReplies>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.loadUserReplies'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadUserReplies&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.loadUserReplies(user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoadUserRepliesCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$LoadUserRepliesCopyWith(_LoadUserReplies value, $Res Function(_LoadUserReplies) _then) = __$LoadUserRepliesCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$LoadUserRepliesCopyWithImpl<$Res>
    implements _$LoadUserRepliesCopyWith<$Res> {
  __$LoadUserRepliesCopyWithImpl(this._self, this._then);

  final _LoadUserReplies _self;
  final $Res Function(_LoadUserReplies) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_LoadUserReplies(
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


class _UnsubscribeUser with DiagnosticableTreeMixin implements WebsocketEvent {
  const _UnsubscribeUser({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeUserCopyWith<_UnsubscribeUser> get copyWith => __$UnsubscribeUserCopyWithImpl<_UnsubscribeUser>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.unsubscribeUser'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnsubscribeUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.unsubscribeUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeUserCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UnsubscribeUserCopyWith(_UnsubscribeUser value, $Res Function(_UnsubscribeUser) _then) = __$UnsubscribeUserCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UnsubscribeUserCopyWithImpl<$Res>
    implements _$UnsubscribeUserCopyWith<$Res> {
  __$UnsubscribeUserCopyWithImpl(this._self, this._then);

  final _UnsubscribeUser _self;
  final $Res Function(_UnsubscribeUser) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UnsubscribeUser(
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


class _UnsubscribeUserProfilePosts with DiagnosticableTreeMixin implements WebsocketEvent {
  const _UnsubscribeUserProfilePosts({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeUserProfilePostsCopyWith<_UnsubscribeUserProfilePosts> get copyWith => __$UnsubscribeUserProfilePostsCopyWithImpl<_UnsubscribeUserProfilePosts>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.unsubscribeUserProfilePosts'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnsubscribeUserProfilePosts&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.unsubscribeUserProfilePosts(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeUserProfilePostsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UnsubscribeUserProfilePostsCopyWith(_UnsubscribeUserProfilePosts value, $Res Function(_UnsubscribeUserProfilePosts) _then) = __$UnsubscribeUserProfilePostsCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UnsubscribeUserProfilePostsCopyWithImpl<$Res>
    implements _$UnsubscribeUserProfilePostsCopyWith<$Res> {
  __$UnsubscribeUserProfilePostsCopyWithImpl(this._self, this._then);

  final _UnsubscribeUserProfilePosts _self;
  final $Res Function(_UnsubscribeUserProfilePosts) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UnsubscribeUserProfilePosts(
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


class _GetChats with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetChats({required this.page});
  

 final  int page;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetChatsCopyWith<_GetChats> get copyWith => __$GetChatsCopyWithImpl<_GetChats>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getChats'))
    ..add(DiagnosticsProperty('page', page));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetChats&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getChats(page: $page)';
}


}

/// @nodoc
abstract mixin class _$GetChatsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetChatsCopyWith(_GetChats value, $Res Function(_GetChats) _then) = __$GetChatsCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class __$GetChatsCopyWithImpl<$Res>
    implements _$GetChatsCopyWith<$Res> {
  __$GetChatsCopyWithImpl(this._self, this._then);

  final _GetChats _self;
  final $Res Function(_GetChats) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(_GetChats(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
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
  const _GetMessages({required this.chat});
  

 final  Chat chat;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMessagesCopyWith<_GetMessages> get copyWith => __$GetMessagesCopyWithImpl<_GetMessages>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getMessages'))
    ..add(DiagnosticsProperty('chat', chat));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMessages&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getMessages(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$GetMessagesCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetMessagesCopyWith(_GetMessages value, $Res Function(_GetMessages) _then) = __$GetMessagesCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$GetMessagesCopyWithImpl<$Res>
    implements _$GetMessagesCopyWith<$Res> {
  __$GetMessagesCopyWithImpl(this._self, this._then);

  final _GetMessages _self;
  final $Res Function(_GetMessages) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_GetMessages(
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


class _CreateMessage with DiagnosticableTreeMixin implements WebsocketEvent {
  const _CreateMessage({required this.chat, required this.text, this.post, this.poll, this.survey});
  

 final  Chat chat;
 final  String text;
 final  Post? post;
 final  Poll? poll;
 final  Survey? survey;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMessageCopyWith<_CreateMessage> get copyWith => __$CreateMessageCopyWithImpl<_CreateMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.createMessage'))
    ..add(DiagnosticsProperty('chat', chat))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('post', post))..add(DiagnosticsProperty('poll', poll))..add(DiagnosticsProperty('survey', survey));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMessage&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.text, text) || other.text == text)&&(identical(other.post, post) || other.post == post)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.survey, survey) || other.survey == survey));
}


@override
int get hashCode => Object.hash(runtimeType,chat,text,post,poll,survey);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.createMessage(chat: $chat, text: $text, post: $post, poll: $poll, survey: $survey)';
}


}

/// @nodoc
abstract mixin class _$CreateMessageCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$CreateMessageCopyWith(_CreateMessage value, $Res Function(_CreateMessage) _then) = __$CreateMessageCopyWithImpl;
@useResult
$Res call({
 Chat chat, String text, Post? post, Poll? poll, Survey? survey
});


$ChatCopyWith<$Res> get chat;$PostCopyWith<$Res>? get post;$PollCopyWith<$Res>? get poll;$SurveyCopyWith<$Res>? get survey;

}
/// @nodoc
class __$CreateMessageCopyWithImpl<$Res>
    implements _$CreateMessageCopyWith<$Res> {
  __$CreateMessageCopyWithImpl(this._self, this._then);

  final _CreateMessage _self;
  final $Res Function(_CreateMessage) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,Object? text = null,Object? post = freezed,Object? poll = freezed,Object? survey = freezed,}) {
  return _then(_CreateMessage(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post?,poll: freezed == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,
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
$PollCopyWith<$Res>? get poll {
    if (_self.poll == null) {
    return null;
  }

  return $PollCopyWith<$Res>(_self.poll!, (value) {
    return _then(_self.copyWith(poll: value));
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


class _GetPolls with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetPolls({required this.page});
  

 final  int page;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPollsCopyWith<_GetPolls> get copyWith => __$GetPollsCopyWithImpl<_GetPolls>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getPolls'))
    ..add(DiagnosticsProperty('page', page));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPolls&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getPolls(page: $page)';
}


}

/// @nodoc
abstract mixin class _$GetPollsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetPollsCopyWith(_GetPolls value, $Res Function(_GetPolls) _then) = __$GetPollsCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class __$GetPollsCopyWithImpl<$Res>
    implements _$GetPollsCopyWith<$Res> {
  __$GetPollsCopyWithImpl(this._self, this._then);

  final _GetPolls _self;
  final $Res Function(_GetPolls) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(_GetPolls(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SubscribePoll with DiagnosticableTreeMixin implements WebsocketEvent {
  const _SubscribePoll({required this.poll});
  

 final  Poll poll;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribePollCopyWith<_SubscribePoll> get copyWith => __$SubscribePollCopyWithImpl<_SubscribePoll>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.subscribePoll'))
    ..add(DiagnosticsProperty('poll', poll));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscribePoll&&(identical(other.poll, poll) || other.poll == poll));
}


@override
int get hashCode => Object.hash(runtimeType,poll);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.subscribePoll(poll: $poll)';
}


}

/// @nodoc
abstract mixin class _$SubscribePollCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SubscribePollCopyWith(_SubscribePoll value, $Res Function(_SubscribePoll) _then) = __$SubscribePollCopyWithImpl;
@useResult
$Res call({
 Poll poll
});


$PollCopyWith<$Res> get poll;

}
/// @nodoc
class __$SubscribePollCopyWithImpl<$Res>
    implements _$SubscribePollCopyWith<$Res> {
  __$SubscribePollCopyWithImpl(this._self, this._then);

  final _SubscribePoll _self;
  final $Res Function(_SubscribePoll) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? poll = null,}) {
  return _then(_SubscribePoll(
poll: null == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res> get poll {
  
  return $PollCopyWith<$Res>(_self.poll, (value) {
    return _then(_self.copyWith(poll: value));
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
  const _SubmitReason({required this.poll, required this.text});
  

 final  Poll poll;
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
    ..add(DiagnosticsProperty('poll', poll))..add(DiagnosticsProperty('text', text));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitReason&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,poll,text);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.submitReason(poll: $poll, text: $text)';
}


}

/// @nodoc
abstract mixin class _$SubmitReasonCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SubmitReasonCopyWith(_SubmitReason value, $Res Function(_SubmitReason) _then) = __$SubmitReasonCopyWithImpl;
@useResult
$Res call({
 Poll poll, String text
});


$PollCopyWith<$Res> get poll;

}
/// @nodoc
class __$SubmitReasonCopyWithImpl<$Res>
    implements _$SubmitReasonCopyWith<$Res> {
  __$SubmitReasonCopyWithImpl(this._self, this._then);

  final _SubmitReason _self;
  final $Res Function(_SubmitReason) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? poll = null,Object? text = null,}) {
  return _then(_SubmitReason(
poll: null == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res> get poll {
  
  return $PollCopyWith<$Res>(_self.poll, (value) {
    return _then(_self.copyWith(poll: value));
  });
}
}

/// @nodoc


class _GetSurveys with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetSurveys({required this.page});
  

 final  int page;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSurveysCopyWith<_GetSurveys> get copyWith => __$GetSurveysCopyWithImpl<_GetSurveys>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getSurveys'))
    ..add(DiagnosticsProperty('page', page));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSurveys&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getSurveys(page: $page)';
}


}

/// @nodoc
abstract mixin class _$GetSurveysCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetSurveysCopyWith(_GetSurveys value, $Res Function(_GetSurveys) _then) = __$GetSurveysCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class __$GetSurveysCopyWithImpl<$Res>
    implements _$GetSurveysCopyWith<$Res> {
  __$GetSurveysCopyWithImpl(this._self, this._then);

  final _GetSurveys _self;
  final $Res Function(_GetSurveys) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(_GetSurveys(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
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
  const _GetUsers({required this.searchTerm, required this.page});
  

 final  String searchTerm;
 final  int page;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetUsersCopyWith<_GetUsers> get copyWith => __$GetUsersCopyWithImpl<_GetUsers>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getUsers'))
    ..add(DiagnosticsProperty('searchTerm', searchTerm))..add(DiagnosticsProperty('page', page));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUsers&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,page);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getUsers(searchTerm: $searchTerm, page: $page)';
}


}

/// @nodoc
abstract mixin class _$GetUsersCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetUsersCopyWith(_GetUsers value, $Res Function(_GetUsers) _then) = __$GetUsersCopyWithImpl;
@useResult
$Res call({
 String searchTerm, int page
});




}
/// @nodoc
class __$GetUsersCopyWithImpl<$Res>
    implements _$GetUsersCopyWith<$Res> {
  __$GetUsersCopyWithImpl(this._self, this._then);

  final _GetUsers _self;
  final $Res Function(_GetUsers) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = null,Object? page = null,}) {
  return _then(_GetUsers(
searchTerm: null == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
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
  const _MuteUser({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuteUserCopyWith<_MuteUser> get copyWith => __$MuteUserCopyWithImpl<_MuteUser>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.muteUser'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuteUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.muteUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$MuteUserCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$MuteUserCopyWith(_MuteUser value, $Res Function(_MuteUser) _then) = __$MuteUserCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$MuteUserCopyWithImpl<$Res>
    implements _$MuteUserCopyWith<$Res> {
  __$MuteUserCopyWithImpl(this._self, this._then);

  final _MuteUser _self;
  final $Res Function(_MuteUser) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_MuteUser(
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


class _BlockUser with DiagnosticableTreeMixin implements WebsocketEvent {
  const _BlockUser({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockUserCopyWith<_BlockUser> get copyWith => __$BlockUserCopyWithImpl<_BlockUser>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.blockUser'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.blockUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$BlockUserCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$BlockUserCopyWith(_BlockUser value, $Res Function(_BlockUser) _then) = __$BlockUserCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$BlockUserCopyWithImpl<$Res>
    implements _$BlockUserCopyWith<$Res> {
  __$BlockUserCopyWithImpl(this._self, this._then);

  final _BlockUser _self;
  final $Res Function(_BlockUser) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_BlockUser(
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


class _SendDirectMessage with DiagnosticableTreeMixin implements WebsocketEvent {
  const _SendDirectMessage({required final  List<User> users, required this.text, this.post, this.poll, this.survey}): _users = users;
  

 final  List<User> _users;
 List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

 final  String text;
 final  Post? post;
 final  Poll? poll;
 final  Survey? survey;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendDirectMessageCopyWith<_SendDirectMessage> get copyWith => __$SendDirectMessageCopyWithImpl<_SendDirectMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.sendDirectMessage'))
    ..add(DiagnosticsProperty('users', users))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('post', post))..add(DiagnosticsProperty('poll', poll))..add(DiagnosticsProperty('survey', survey));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendDirectMessage&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.text, text) || other.text == text)&&(identical(other.post, post) || other.post == post)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.survey, survey) || other.survey == survey));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),text,post,poll,survey);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.sendDirectMessage(users: $users, text: $text, post: $post, poll: $poll, survey: $survey)';
}


}

/// @nodoc
abstract mixin class _$SendDirectMessageCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SendDirectMessageCopyWith(_SendDirectMessage value, $Res Function(_SendDirectMessage) _then) = __$SendDirectMessageCopyWithImpl;
@useResult
$Res call({
 List<User> users, String text, Post? post, Poll? poll, Survey? survey
});


$PostCopyWith<$Res>? get post;$PollCopyWith<$Res>? get poll;$SurveyCopyWith<$Res>? get survey;

}
/// @nodoc
class __$SendDirectMessageCopyWithImpl<$Res>
    implements _$SendDirectMessageCopyWith<$Res> {
  __$SendDirectMessageCopyWithImpl(this._self, this._then);

  final _SendDirectMessage _self;
  final $Res Function(_SendDirectMessage) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,Object? text = null,Object? post = freezed,Object? poll = freezed,Object? survey = freezed,}) {
  return _then(_SendDirectMessage(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post?,poll: freezed == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,
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
$PollCopyWith<$Res>? get poll {
    if (_self.poll == null) {
    return null;
  }

  return $PollCopyWith<$Res>(_self.poll!, (value) {
    return _then(_self.copyWith(poll: value));
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




/// @nodoc
mixin _$WebsocketState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketState()';
}


}

/// @nodoc
class $WebsocketStateCopyWith<$Res>  {
$WebsocketStateCopyWith(WebsocketState _, $Res Function(WebsocketState) __);
}


/// Adds pattern-matching-related methods to [WebsocketState].
extension WebsocketStatePatterns on WebsocketState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WebsocketInitial value)?  initial,TResult Function( WebsocketLoading value)?  loading,TResult Function( WebsocketConnected value)?  connected,TResult Function( WebsocketSuccess value)?  success,TResult Function( WebsocketFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WebsocketInitial() when initial != null:
return initial(_that);case WebsocketLoading() when loading != null:
return loading(_that);case WebsocketConnected() when connected != null:
return connected(_that);case WebsocketSuccess() when success != null:
return success(_that);case WebsocketFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WebsocketInitial value)  initial,required TResult Function( WebsocketLoading value)  loading,required TResult Function( WebsocketConnected value)  connected,required TResult Function( WebsocketSuccess value)  success,required TResult Function( WebsocketFailure value)  failure,}){
final _that = this;
switch (_that) {
case WebsocketInitial():
return initial(_that);case WebsocketLoading():
return loading(_that);case WebsocketConnected():
return connected(_that);case WebsocketSuccess():
return success(_that);case WebsocketFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WebsocketInitial value)?  initial,TResult? Function( WebsocketLoading value)?  loading,TResult? Function( WebsocketConnected value)?  connected,TResult? Function( WebsocketSuccess value)?  success,TResult? Function( WebsocketFailure value)?  failure,}){
final _that = this;
switch (_that) {
case WebsocketInitial() when initial != null:
return initial(_that);case WebsocketLoading() when loading != null:
return loading(_that);case WebsocketConnected() when connected != null:
return connected(_that);case WebsocketSuccess() when success != null:
return success(_that);case WebsocketFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  connected,TResult Function( Map<String, dynamic> message)?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WebsocketInitial() when initial != null:
return initial();case WebsocketLoading() when loading != null:
return loading();case WebsocketConnected() when connected != null:
return connected();case WebsocketSuccess() when success != null:
return success(_that.message);case WebsocketFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  connected,required TResult Function( Map<String, dynamic> message)  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case WebsocketInitial():
return initial();case WebsocketLoading():
return loading();case WebsocketConnected():
return connected();case WebsocketSuccess():
return success(_that.message);case WebsocketFailure():
return failure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  connected,TResult? Function( Map<String, dynamic> message)?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case WebsocketInitial() when initial != null:
return initial();case WebsocketLoading() when loading != null:
return loading();case WebsocketConnected() when connected != null:
return connected();case WebsocketSuccess() when success != null:
return success(_that.message);case WebsocketFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class WebsocketInitial with DiagnosticableTreeMixin implements WebsocketState {
  const WebsocketInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketState.initial()';
}


}




/// @nodoc


class WebsocketLoading with DiagnosticableTreeMixin implements WebsocketState {
  const WebsocketLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketState.loading()';
}


}




/// @nodoc


class WebsocketConnected with DiagnosticableTreeMixin implements WebsocketState {
  const WebsocketConnected();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketState.connected'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketState.connected()';
}


}




/// @nodoc


class WebsocketSuccess with DiagnosticableTreeMixin implements WebsocketState {
  const WebsocketSuccess({required final  Map<String, dynamic> message}): _message = message;
  

 final  Map<String, dynamic> _message;
 Map<String, dynamic> get message {
  if (_message is EqualUnmodifiableMapView) return _message;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_message);
}


/// Create a copy of WebsocketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebsocketSuccessCopyWith<WebsocketSuccess> get copyWith => _$WebsocketSuccessCopyWithImpl<WebsocketSuccess>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketState.success'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketSuccess&&const DeepCollectionEquality().equals(other._message, _message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_message));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $WebsocketSuccessCopyWith<$Res> implements $WebsocketStateCopyWith<$Res> {
  factory $WebsocketSuccessCopyWith(WebsocketSuccess value, $Res Function(WebsocketSuccess) _then) = _$WebsocketSuccessCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> message
});




}
/// @nodoc
class _$WebsocketSuccessCopyWithImpl<$Res>
    implements $WebsocketSuccessCopyWith<$Res> {
  _$WebsocketSuccessCopyWithImpl(this._self, this._then);

  final WebsocketSuccess _self;
  final $Res Function(WebsocketSuccess) _then;

/// Create a copy of WebsocketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WebsocketSuccess(
message: null == message ? _self._message : message // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class WebsocketFailure with DiagnosticableTreeMixin implements WebsocketState {
  const WebsocketFailure({required this.error});
  

 final  String error;

/// Create a copy of WebsocketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebsocketFailureCopyWith<WebsocketFailure> get copyWith => _$WebsocketFailureCopyWithImpl<WebsocketFailure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketState.failure'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $WebsocketFailureCopyWith<$Res> implements $WebsocketStateCopyWith<$Res> {
  factory $WebsocketFailureCopyWith(WebsocketFailure value, $Res Function(WebsocketFailure) _then) = _$WebsocketFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$WebsocketFailureCopyWithImpl<$Res>
    implements $WebsocketFailureCopyWith<$Res> {
  _$WebsocketFailureCopyWithImpl(this._self, this._then);

  final WebsocketFailure _self;
  final $Res Function(WebsocketFailure) _then;

/// Create a copy of WebsocketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(WebsocketFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
