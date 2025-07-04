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
mixin _$WebsocketEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Connect value)?  connect,TResult Function( _ChangeState value)?  changeState,TResult Function( _SubscribePosts value)?  subscribePosts,TResult Function( _CreatePost value)?  createPost,TResult Function( _UpdatePost value)?  updatePost,TResult Function( _LikePost value)?  likePost,TResult Function( _BookmarkPost value)?  bookmarkPost,TResult Function( _DeletePost value)?  deletePost,TResult Function( _ReportPost value)?  reportPost,TResult Function( _GetReplies value)?  getReplies,TResult Function( _LoadUserPosts value)?  loadUserPosts,TResult Function( _LoadBookmarks value)?  loadBookmarks,TResult Function( _LoadLikedPosts value)?  loadLikedPosts,TResult Function( _LoadUserReplies value)?  loadUserReplies,TResult Function( _LoadChats value)?  loadChats,TResult Function( _CreateChat value)?  createChat,TResult Function( _CreateMessage value)?  createMessage,TResult Function( _EditMessage value)?  editMessage,TResult Function( _DeleteMessage value)?  deleteMessage,TResult Function( _MarkAsRead value)?  markAsRead,TResult Function( _UserBlocked value)?  userBlocked,TResult Function( _GetPolls value)?  getPolls,TResult Function( _Vote value)?  vote,TResult Function( _SubmitReason value)?  submitReason,TResult Function( _GetSurveys value)?  getSurveys,TResult Function( _SubmitResponse value)?  submitResponse,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _SubscribePosts() when subscribePosts != null:
return subscribePosts(_that);case _CreatePost() when createPost != null:
return createPost(_that);case _UpdatePost() when updatePost != null:
return updatePost(_that);case _LikePost() when likePost != null:
return likePost(_that);case _BookmarkPost() when bookmarkPost != null:
return bookmarkPost(_that);case _DeletePost() when deletePost != null:
return deletePost(_that);case _ReportPost() when reportPost != null:
return reportPost(_that);case _GetReplies() when getReplies != null:
return getReplies(_that);case _LoadUserPosts() when loadUserPosts != null:
return loadUserPosts(_that);case _LoadBookmarks() when loadBookmarks != null:
return loadBookmarks(_that);case _LoadLikedPosts() when loadLikedPosts != null:
return loadLikedPosts(_that);case _LoadUserReplies() when loadUserReplies != null:
return loadUserReplies(_that);case _LoadChats() when loadChats != null:
return loadChats(_that);case _CreateChat() when createChat != null:
return createChat(_that);case _CreateMessage() when createMessage != null:
return createMessage(_that);case _EditMessage() when editMessage != null:
return editMessage(_that);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that);case _UserBlocked() when userBlocked != null:
return userBlocked(_that);case _GetPolls() when getPolls != null:
return getPolls(_that);case _Vote() when vote != null:
return vote(_that);case _SubmitReason() when submitReason != null:
return submitReason(_that);case _GetSurveys() when getSurveys != null:
return getSurveys(_that);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Connect value)  connect,required TResult Function( _ChangeState value)  changeState,required TResult Function( _SubscribePosts value)  subscribePosts,required TResult Function( _CreatePost value)  createPost,required TResult Function( _UpdatePost value)  updatePost,required TResult Function( _LikePost value)  likePost,required TResult Function( _BookmarkPost value)  bookmarkPost,required TResult Function( _DeletePost value)  deletePost,required TResult Function( _ReportPost value)  reportPost,required TResult Function( _GetReplies value)  getReplies,required TResult Function( _LoadUserPosts value)  loadUserPosts,required TResult Function( _LoadBookmarks value)  loadBookmarks,required TResult Function( _LoadLikedPosts value)  loadLikedPosts,required TResult Function( _LoadUserReplies value)  loadUserReplies,required TResult Function( _LoadChats value)  loadChats,required TResult Function( _CreateChat value)  createChat,required TResult Function( _CreateMessage value)  createMessage,required TResult Function( _EditMessage value)  editMessage,required TResult Function( _DeleteMessage value)  deleteMessage,required TResult Function( _MarkAsRead value)  markAsRead,required TResult Function( _UserBlocked value)  userBlocked,required TResult Function( _GetPolls value)  getPolls,required TResult Function( _Vote value)  vote,required TResult Function( _SubmitReason value)  submitReason,required TResult Function( _GetSurveys value)  getSurveys,required TResult Function( _SubmitResponse value)  submitResponse,}){
final _that = this;
switch (_that) {
case _Connect():
return connect(_that);case _ChangeState():
return changeState(_that);case _SubscribePosts():
return subscribePosts(_that);case _CreatePost():
return createPost(_that);case _UpdatePost():
return updatePost(_that);case _LikePost():
return likePost(_that);case _BookmarkPost():
return bookmarkPost(_that);case _DeletePost():
return deletePost(_that);case _ReportPost():
return reportPost(_that);case _GetReplies():
return getReplies(_that);case _LoadUserPosts():
return loadUserPosts(_that);case _LoadBookmarks():
return loadBookmarks(_that);case _LoadLikedPosts():
return loadLikedPosts(_that);case _LoadUserReplies():
return loadUserReplies(_that);case _LoadChats():
return loadChats(_that);case _CreateChat():
return createChat(_that);case _CreateMessage():
return createMessage(_that);case _EditMessage():
return editMessage(_that);case _DeleteMessage():
return deleteMessage(_that);case _MarkAsRead():
return markAsRead(_that);case _UserBlocked():
return userBlocked(_that);case _GetPolls():
return getPolls(_that);case _Vote():
return vote(_that);case _SubmitReason():
return submitReason(_that);case _GetSurveys():
return getSurveys(_that);case _SubmitResponse():
return submitResponse(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Connect value)?  connect,TResult? Function( _ChangeState value)?  changeState,TResult? Function( _SubscribePosts value)?  subscribePosts,TResult? Function( _CreatePost value)?  createPost,TResult? Function( _UpdatePost value)?  updatePost,TResult? Function( _LikePost value)?  likePost,TResult? Function( _BookmarkPost value)?  bookmarkPost,TResult? Function( _DeletePost value)?  deletePost,TResult? Function( _ReportPost value)?  reportPost,TResult? Function( _GetReplies value)?  getReplies,TResult? Function( _LoadUserPosts value)?  loadUserPosts,TResult? Function( _LoadBookmarks value)?  loadBookmarks,TResult? Function( _LoadLikedPosts value)?  loadLikedPosts,TResult? Function( _LoadUserReplies value)?  loadUserReplies,TResult? Function( _LoadChats value)?  loadChats,TResult? Function( _CreateChat value)?  createChat,TResult? Function( _CreateMessage value)?  createMessage,TResult? Function( _EditMessage value)?  editMessage,TResult? Function( _DeleteMessage value)?  deleteMessage,TResult? Function( _MarkAsRead value)?  markAsRead,TResult? Function( _UserBlocked value)?  userBlocked,TResult? Function( _GetPolls value)?  getPolls,TResult? Function( _Vote value)?  vote,TResult? Function( _SubmitReason value)?  submitReason,TResult? Function( _GetSurveys value)?  getSurveys,TResult? Function( _SubmitResponse value)?  submitResponse,}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _SubscribePosts() when subscribePosts != null:
return subscribePosts(_that);case _CreatePost() when createPost != null:
return createPost(_that);case _UpdatePost() when updatePost != null:
return updatePost(_that);case _LikePost() when likePost != null:
return likePost(_that);case _BookmarkPost() when bookmarkPost != null:
return bookmarkPost(_that);case _DeletePost() when deletePost != null:
return deletePost(_that);case _ReportPost() when reportPost != null:
return reportPost(_that);case _GetReplies() when getReplies != null:
return getReplies(_that);case _LoadUserPosts() when loadUserPosts != null:
return loadUserPosts(_that);case _LoadBookmarks() when loadBookmarks != null:
return loadBookmarks(_that);case _LoadLikedPosts() when loadLikedPosts != null:
return loadLikedPosts(_that);case _LoadUserReplies() when loadUserReplies != null:
return loadUserReplies(_that);case _LoadChats() when loadChats != null:
return loadChats(_that);case _CreateChat() when createChat != null:
return createChat(_that);case _CreateMessage() when createMessage != null:
return createMessage(_that);case _EditMessage() when editMessage != null:
return editMessage(_that);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that);case _UserBlocked() when userBlocked != null:
return userBlocked(_that);case _GetPolls() when getPolls != null:
return getPolls(_that);case _Vote() when vote != null:
return vote(_that);case _SubmitReason() when submitReason != null:
return submitReason(_that);case _GetSurveys() when getSurveys != null:
return getSurveys(_that);case _SubmitResponse() when submitResponse != null:
return submitResponse(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connect,TResult Function( WebsocketState state)?  changeState,TResult Function( List<Post> posts)?  subscribePosts,TResult Function( String body)?  createPost,TResult Function( int id,  String body)?  updatePost,TResult Function( Post post)?  likePost,TResult Function( Post post)?  bookmarkPost,TResult Function( Post post)?  deletePost,TResult Function( Post post)?  reportPost,TResult Function( Post post)?  getReplies,TResult Function( User user)?  loadUserPosts,TResult Function( User user)?  loadBookmarks,TResult Function( User user)?  loadLikedPosts,TResult Function( User user)?  loadUserReplies,TResult Function()?  loadChats,TResult Function( User user)?  createChat,TResult Function( Chat chat,  String text)?  createMessage,TResult Function( int messageId,  String text)?  editMessage,TResult Function( List<Message> messages)?  deleteMessage,TResult Function( Chat chat)?  markAsRead,TResult Function( User user)?  userBlocked,TResult Function()?  getPolls,TResult Function( Option option)?  vote,TResult Function( Poll poll,  String text)?  submitReason,TResult Function()?  getSurveys,TResult Function( Survey survey,  DateTime startTime,  DateTime endTime,  List<TextAnswer> textAnswers,  List<ChoiceAnswer> choiceAnswers)?  submitResponse,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _SubscribePosts() when subscribePosts != null:
return subscribePosts(_that.posts);case _CreatePost() when createPost != null:
return createPost(_that.body);case _UpdatePost() when updatePost != null:
return updatePost(_that.id,_that.body);case _LikePost() when likePost != null:
return likePost(_that.post);case _BookmarkPost() when bookmarkPost != null:
return bookmarkPost(_that.post);case _DeletePost() when deletePost != null:
return deletePost(_that.post);case _ReportPost() when reportPost != null:
return reportPost(_that.post);case _GetReplies() when getReplies != null:
return getReplies(_that.post);case _LoadUserPosts() when loadUserPosts != null:
return loadUserPosts(_that.user);case _LoadBookmarks() when loadBookmarks != null:
return loadBookmarks(_that.user);case _LoadLikedPosts() when loadLikedPosts != null:
return loadLikedPosts(_that.user);case _LoadUserReplies() when loadUserReplies != null:
return loadUserReplies(_that.user);case _LoadChats() when loadChats != null:
return loadChats();case _CreateChat() when createChat != null:
return createChat(_that.user);case _CreateMessage() when createMessage != null:
return createMessage(_that.chat,_that.text);case _EditMessage() when editMessage != null:
return editMessage(_that.messageId,_that.text);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.messages);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that.chat);case _UserBlocked() when userBlocked != null:
return userBlocked(_that.user);case _GetPolls() when getPolls != null:
return getPolls();case _Vote() when vote != null:
return vote(_that.option);case _SubmitReason() when submitReason != null:
return submitReason(_that.poll,_that.text);case _GetSurveys() when getSurveys != null:
return getSurveys();case _SubmitResponse() when submitResponse != null:
return submitResponse(_that.survey,_that.startTime,_that.endTime,_that.textAnswers,_that.choiceAnswers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connect,required TResult Function( WebsocketState state)  changeState,required TResult Function( List<Post> posts)  subscribePosts,required TResult Function( String body)  createPost,required TResult Function( int id,  String body)  updatePost,required TResult Function( Post post)  likePost,required TResult Function( Post post)  bookmarkPost,required TResult Function( Post post)  deletePost,required TResult Function( Post post)  reportPost,required TResult Function( Post post)  getReplies,required TResult Function( User user)  loadUserPosts,required TResult Function( User user)  loadBookmarks,required TResult Function( User user)  loadLikedPosts,required TResult Function( User user)  loadUserReplies,required TResult Function()  loadChats,required TResult Function( User user)  createChat,required TResult Function( Chat chat,  String text)  createMessage,required TResult Function( int messageId,  String text)  editMessage,required TResult Function( List<Message> messages)  deleteMessage,required TResult Function( Chat chat)  markAsRead,required TResult Function( User user)  userBlocked,required TResult Function()  getPolls,required TResult Function( Option option)  vote,required TResult Function( Poll poll,  String text)  submitReason,required TResult Function()  getSurveys,required TResult Function( Survey survey,  DateTime startTime,  DateTime endTime,  List<TextAnswer> textAnswers,  List<ChoiceAnswer> choiceAnswers)  submitResponse,}) {final _that = this;
switch (_that) {
case _Connect():
return connect();case _ChangeState():
return changeState(_that.state);case _SubscribePosts():
return subscribePosts(_that.posts);case _CreatePost():
return createPost(_that.body);case _UpdatePost():
return updatePost(_that.id,_that.body);case _LikePost():
return likePost(_that.post);case _BookmarkPost():
return bookmarkPost(_that.post);case _DeletePost():
return deletePost(_that.post);case _ReportPost():
return reportPost(_that.post);case _GetReplies():
return getReplies(_that.post);case _LoadUserPosts():
return loadUserPosts(_that.user);case _LoadBookmarks():
return loadBookmarks(_that.user);case _LoadLikedPosts():
return loadLikedPosts(_that.user);case _LoadUserReplies():
return loadUserReplies(_that.user);case _LoadChats():
return loadChats();case _CreateChat():
return createChat(_that.user);case _CreateMessage():
return createMessage(_that.chat,_that.text);case _EditMessage():
return editMessage(_that.messageId,_that.text);case _DeleteMessage():
return deleteMessage(_that.messages);case _MarkAsRead():
return markAsRead(_that.chat);case _UserBlocked():
return userBlocked(_that.user);case _GetPolls():
return getPolls();case _Vote():
return vote(_that.option);case _SubmitReason():
return submitReason(_that.poll,_that.text);case _GetSurveys():
return getSurveys();case _SubmitResponse():
return submitResponse(_that.survey,_that.startTime,_that.endTime,_that.textAnswers,_that.choiceAnswers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connect,TResult? Function( WebsocketState state)?  changeState,TResult? Function( List<Post> posts)?  subscribePosts,TResult? Function( String body)?  createPost,TResult? Function( int id,  String body)?  updatePost,TResult? Function( Post post)?  likePost,TResult? Function( Post post)?  bookmarkPost,TResult? Function( Post post)?  deletePost,TResult? Function( Post post)?  reportPost,TResult? Function( Post post)?  getReplies,TResult? Function( User user)?  loadUserPosts,TResult? Function( User user)?  loadBookmarks,TResult? Function( User user)?  loadLikedPosts,TResult? Function( User user)?  loadUserReplies,TResult? Function()?  loadChats,TResult? Function( User user)?  createChat,TResult? Function( Chat chat,  String text)?  createMessage,TResult? Function( int messageId,  String text)?  editMessage,TResult? Function( List<Message> messages)?  deleteMessage,TResult? Function( Chat chat)?  markAsRead,TResult? Function( User user)?  userBlocked,TResult? Function()?  getPolls,TResult? Function( Option option)?  vote,TResult? Function( Poll poll,  String text)?  submitReason,TResult? Function()?  getSurveys,TResult? Function( Survey survey,  DateTime startTime,  DateTime endTime,  List<TextAnswer> textAnswers,  List<ChoiceAnswer> choiceAnswers)?  submitResponse,}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _SubscribePosts() when subscribePosts != null:
return subscribePosts(_that.posts);case _CreatePost() when createPost != null:
return createPost(_that.body);case _UpdatePost() when updatePost != null:
return updatePost(_that.id,_that.body);case _LikePost() when likePost != null:
return likePost(_that.post);case _BookmarkPost() when bookmarkPost != null:
return bookmarkPost(_that.post);case _DeletePost() when deletePost != null:
return deletePost(_that.post);case _ReportPost() when reportPost != null:
return reportPost(_that.post);case _GetReplies() when getReplies != null:
return getReplies(_that.post);case _LoadUserPosts() when loadUserPosts != null:
return loadUserPosts(_that.user);case _LoadBookmarks() when loadBookmarks != null:
return loadBookmarks(_that.user);case _LoadLikedPosts() when loadLikedPosts != null:
return loadLikedPosts(_that.user);case _LoadUserReplies() when loadUserReplies != null:
return loadUserReplies(_that.user);case _LoadChats() when loadChats != null:
return loadChats();case _CreateChat() when createChat != null:
return createChat(_that.user);case _CreateMessage() when createMessage != null:
return createMessage(_that.chat,_that.text);case _EditMessage() when editMessage != null:
return editMessage(_that.messageId,_that.text);case _DeleteMessage() when deleteMessage != null:
return deleteMessage(_that.messages);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that.chat);case _UserBlocked() when userBlocked != null:
return userBlocked(_that.user);case _GetPolls() when getPolls != null:
return getPolls();case _Vote() when vote != null:
return vote(_that.option);case _SubmitReason() when submitReason != null:
return submitReason(_that.poll,_that.text);case _GetSurveys() when getSurveys != null:
return getSurveys();case _SubmitResponse() when submitResponse != null:
return submitResponse(_that.survey,_that.startTime,_that.endTime,_that.textAnswers,_that.choiceAnswers);case _:
  return null;

}
}

}

/// @nodoc


class _Connect implements WebsocketEvent {
  const _Connect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WebsocketEvent.connect()';
}


}




/// @nodoc


class _ChangeState implements WebsocketEvent {
  const _ChangeState({required this.state});
  

 final  WebsocketState state;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeStateCopyWith<_ChangeState> get copyWith => __$ChangeStateCopyWithImpl<_ChangeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeState&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString() {
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


class _SubscribePosts implements WebsocketEvent {
  const _SubscribePosts({required final  List<Post> posts}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribePostsCopyWith<_SubscribePosts> get copyWith => __$SubscribePostsCopyWithImpl<_SubscribePosts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscribePosts&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'WebsocketEvent.subscribePosts(posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$SubscribePostsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SubscribePostsCopyWith(_SubscribePosts value, $Res Function(_SubscribePosts) _then) = __$SubscribePostsCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class __$SubscribePostsCopyWithImpl<$Res>
    implements _$SubscribePostsCopyWith<$Res> {
  __$SubscribePostsCopyWithImpl(this._self, this._then);

  final _SubscribePosts _self;
  final $Res Function(_SubscribePosts) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(_SubscribePosts(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class _CreatePost implements WebsocketEvent {
  const _CreatePost({required this.body});
  

 final  String body;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePostCopyWith<_CreatePost> get copyWith => __$CreatePostCopyWithImpl<_CreatePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePost&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,body);

@override
String toString() {
  return 'WebsocketEvent.createPost(body: $body)';
}


}

/// @nodoc
abstract mixin class _$CreatePostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$CreatePostCopyWith(_CreatePost value, $Res Function(_CreatePost) _then) = __$CreatePostCopyWithImpl;
@useResult
$Res call({
 String body
});




}
/// @nodoc
class __$CreatePostCopyWithImpl<$Res>
    implements _$CreatePostCopyWith<$Res> {
  __$CreatePostCopyWithImpl(this._self, this._then);

  final _CreatePost _self;
  final $Res Function(_CreatePost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,}) {
  return _then(_CreatePost(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdatePost implements WebsocketEvent {
  const _UpdatePost({required this.id, required this.body});
  

 final  int id;
 final  String body;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePostCopyWith<_UpdatePost> get copyWith => __$UpdatePostCopyWithImpl<_UpdatePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePost&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,id,body);

@override
String toString() {
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


class _LikePost implements WebsocketEvent {
  const _LikePost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikePostCopyWith<_LikePost> get copyWith => __$LikePostCopyWithImpl<_LikePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikePost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
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


class _BookmarkPost implements WebsocketEvent {
  const _BookmarkPost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkPostCopyWith<_BookmarkPost> get copyWith => __$BookmarkPostCopyWithImpl<_BookmarkPost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkPost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
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


class _DeletePost implements WebsocketEvent {
  const _DeletePost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePostCopyWith<_DeletePost> get copyWith => __$DeletePostCopyWithImpl<_DeletePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
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


class _ReportPost implements WebsocketEvent {
  const _ReportPost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportPostCopyWith<_ReportPost> get copyWith => __$ReportPostCopyWithImpl<_ReportPost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportPost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'WebsocketEvent.reportPost(post: $post)';
}


}

/// @nodoc
abstract mixin class _$ReportPostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ReportPostCopyWith(_ReportPost value, $Res Function(_ReportPost) _then) = __$ReportPostCopyWithImpl;
@useResult
$Res call({
 Post post
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
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_ReportPost(
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


class _GetReplies implements WebsocketEvent {
  const _GetReplies({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRepliesCopyWith<_GetReplies> get copyWith => __$GetRepliesCopyWithImpl<_GetReplies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetReplies&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
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


class _LoadUserPosts implements WebsocketEvent {
  const _LoadUserPosts({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadUserPostsCopyWith<_LoadUserPosts> get copyWith => __$LoadUserPostsCopyWithImpl<_LoadUserPosts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadUserPosts&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
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


class _LoadBookmarks implements WebsocketEvent {
  const _LoadBookmarks({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadBookmarksCopyWith<_LoadBookmarks> get copyWith => __$LoadBookmarksCopyWithImpl<_LoadBookmarks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadBookmarks&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
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


class _LoadLikedPosts implements WebsocketEvent {
  const _LoadLikedPosts({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadLikedPostsCopyWith<_LoadLikedPosts> get copyWith => __$LoadLikedPostsCopyWithImpl<_LoadLikedPosts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadLikedPosts&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
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


class _LoadUserReplies implements WebsocketEvent {
  const _LoadUserReplies({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadUserRepliesCopyWith<_LoadUserReplies> get copyWith => __$LoadUserRepliesCopyWithImpl<_LoadUserReplies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadUserReplies&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
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


class _LoadChats implements WebsocketEvent {
  const _LoadChats();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadChats);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WebsocketEvent.loadChats()';
}


}




/// @nodoc


class _CreateChat implements WebsocketEvent {
  const _CreateChat({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateChatCopyWith<_CreateChat> get copyWith => __$CreateChatCopyWithImpl<_CreateChat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateChat&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
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


class _CreateMessage implements WebsocketEvent {
  const _CreateMessage({required this.chat, required this.text});
  

 final  Chat chat;
 final  String text;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMessageCopyWith<_CreateMessage> get copyWith => __$CreateMessageCopyWithImpl<_CreateMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMessage&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,chat,text);

@override
String toString() {
  return 'WebsocketEvent.createMessage(chat: $chat, text: $text)';
}


}

/// @nodoc
abstract mixin class _$CreateMessageCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$CreateMessageCopyWith(_CreateMessage value, $Res Function(_CreateMessage) _then) = __$CreateMessageCopyWithImpl;
@useResult
$Res call({
 Chat chat, String text
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$CreateMessageCopyWithImpl<$Res>
    implements _$CreateMessageCopyWith<$Res> {
  __$CreateMessageCopyWithImpl(this._self, this._then);

  final _CreateMessage _self;
  final $Res Function(_CreateMessage) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,Object? text = null,}) {
  return _then(_CreateMessage(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
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


class _EditMessage implements WebsocketEvent {
  const _EditMessage({required this.messageId, required this.text});
  

 final  int messageId;
 final  String text;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditMessageCopyWith<_EditMessage> get copyWith => __$EditMessageCopyWithImpl<_EditMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditMessage&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,messageId,text);

@override
String toString() {
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


class _DeleteMessage implements WebsocketEvent {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteMessage&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
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


class _MarkAsRead implements WebsocketEvent {
  const _MarkAsRead({required this.chat});
  

 final  Chat chat;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAsReadCopyWith<_MarkAsRead> get copyWith => __$MarkAsReadCopyWithImpl<_MarkAsRead>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAsRead&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString() {
  return 'WebsocketEvent.markAsRead(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$MarkAsReadCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$MarkAsReadCopyWith(_MarkAsRead value, $Res Function(_MarkAsRead) _then) = __$MarkAsReadCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$MarkAsReadCopyWithImpl<$Res>
    implements _$MarkAsReadCopyWith<$Res> {
  __$MarkAsReadCopyWithImpl(this._self, this._then);

  final _MarkAsRead _self;
  final $Res Function(_MarkAsRead) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_MarkAsRead(
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


class _UserBlocked implements WebsocketEvent {
  const _UserBlocked({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBlockedCopyWith<_UserBlocked> get copyWith => __$UserBlockedCopyWithImpl<_UserBlocked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBlocked&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'WebsocketEvent.userBlocked(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UserBlockedCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UserBlockedCopyWith(_UserBlocked value, $Res Function(_UserBlocked) _then) = __$UserBlockedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UserBlockedCopyWithImpl<$Res>
    implements _$UserBlockedCopyWith<$Res> {
  __$UserBlockedCopyWithImpl(this._self, this._then);

  final _UserBlocked _self;
  final $Res Function(_UserBlocked) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UserBlocked(
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


class _GetPolls implements WebsocketEvent {
  const _GetPolls();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPolls);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WebsocketEvent.getPolls()';
}


}




/// @nodoc


class _Vote implements WebsocketEvent {
  const _Vote({required this.option});
  

 final  Option option;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoteCopyWith<_Vote> get copyWith => __$VoteCopyWithImpl<_Vote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vote&&(identical(other.option, option) || other.option == option));
}


@override
int get hashCode => Object.hash(runtimeType,option);

@override
String toString() {
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


class _SubmitReason implements WebsocketEvent {
  const _SubmitReason({required this.poll, required this.text});
  

 final  Poll poll;
 final  String text;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitReasonCopyWith<_SubmitReason> get copyWith => __$SubmitReasonCopyWithImpl<_SubmitReason>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitReason&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,poll,text);

@override
String toString() {
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


class _GetSurveys implements WebsocketEvent {
  const _GetSurveys();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSurveys);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WebsocketEvent.getSurveys()';
}


}




/// @nodoc


class _SubmitResponse implements WebsocketEvent {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitResponse&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other._textAnswers, _textAnswers)&&const DeepCollectionEquality().equals(other._choiceAnswers, _choiceAnswers));
}


@override
int get hashCode => Object.hash(runtimeType,survey,startTime,endTime,const DeepCollectionEquality().hash(_textAnswers),const DeepCollectionEquality().hash(_choiceAnswers));

@override
String toString() {
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
mixin _$WebsocketState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WebsocketInitial value)?  initial,TResult Function( WebsocketLoading value)?  loading,TResult Function( WebsocketSuccess value)?  success,TResult Function( WebsocketFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WebsocketInitial() when initial != null:
return initial(_that);case WebsocketLoading() when loading != null:
return loading(_that);case WebsocketSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WebsocketInitial value)  initial,required TResult Function( WebsocketLoading value)  loading,required TResult Function( WebsocketSuccess value)  success,required TResult Function( WebsocketFailure value)  failure,}){
final _that = this;
switch (_that) {
case WebsocketInitial():
return initial(_that);case WebsocketLoading():
return loading(_that);case WebsocketSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WebsocketInitial value)?  initial,TResult? Function( WebsocketLoading value)?  loading,TResult? Function( WebsocketSuccess value)?  success,TResult? Function( WebsocketFailure value)?  failure,}){
final _that = this;
switch (_that) {
case WebsocketInitial() when initial != null:
return initial(_that);case WebsocketLoading() when loading != null:
return loading(_that);case WebsocketSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Map<String, dynamic> message)?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WebsocketInitial() when initial != null:
return initial();case WebsocketLoading() when loading != null:
return loading();case WebsocketSuccess() when success != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Map<String, dynamic> message)  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case WebsocketInitial():
return initial();case WebsocketLoading():
return loading();case WebsocketSuccess():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Map<String, dynamic> message)?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case WebsocketInitial() when initial != null:
return initial();case WebsocketLoading() when loading != null:
return loading();case WebsocketSuccess() when success != null:
return success(_that.message);case WebsocketFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class WebsocketInitial implements WebsocketState {
  const WebsocketInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WebsocketState.initial()';
}


}




/// @nodoc


class WebsocketLoading implements WebsocketState {
  const WebsocketLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WebsocketState.loading()';
}


}




/// @nodoc


class WebsocketSuccess implements WebsocketState {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketSuccess&&const DeepCollectionEquality().equals(other._message, _message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_message));

@override
String toString() {
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


class WebsocketFailure implements WebsocketState {
  const WebsocketFailure({required this.error});
  

 final  String error;

/// Create a copy of WebsocketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebsocketFailureCopyWith<WebsocketFailure> get copyWith => _$WebsocketFailureCopyWithImpl<WebsocketFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
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
