// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatDetailState()';
}


}

/// @nodoc
class $ChatDetailStateCopyWith<$Res>  {
$ChatDetailStateCopyWith(ChatDetailState _, $Res Function(ChatDetailState) __);
}


/// Adds pattern-matching-related methods to [ChatDetailState].
extension ChatDetailStatePatterns on ChatDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatDetailInitial value)?  initial,TResult Function( ChatDetailLoading value)?  loading,TResult Function( ChatCreated value)?  created,TResult Function( ChatLoaded value)?  loaded,TResult Function( ChatUpdated value)?  updated,TResult Function( ChatDeleted value)?  deleted,TResult Function( DirectMessageSent value)?  directMessageSent,TResult Function( ChatDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial(_that);case ChatDetailLoading() when loading != null:
return loading(_that);case ChatCreated() when created != null:
return created(_that);case ChatLoaded() when loaded != null:
return loaded(_that);case ChatUpdated() when updated != null:
return updated(_that);case ChatDeleted() when deleted != null:
return deleted(_that);case DirectMessageSent() when directMessageSent != null:
return directMessageSent(_that);case ChatDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatDetailInitial value)  initial,required TResult Function( ChatDetailLoading value)  loading,required TResult Function( ChatCreated value)  created,required TResult Function( ChatLoaded value)  loaded,required TResult Function( ChatUpdated value)  updated,required TResult Function( ChatDeleted value)  deleted,required TResult Function( DirectMessageSent value)  directMessageSent,required TResult Function( ChatDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case ChatDetailInitial():
return initial(_that);case ChatDetailLoading():
return loading(_that);case ChatCreated():
return created(_that);case ChatLoaded():
return loaded(_that);case ChatUpdated():
return updated(_that);case ChatDeleted():
return deleted(_that);case DirectMessageSent():
return directMessageSent(_that);case ChatDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatDetailInitial value)?  initial,TResult? Function( ChatDetailLoading value)?  loading,TResult? Function( ChatCreated value)?  created,TResult? Function( ChatLoaded value)?  loaded,TResult? Function( ChatUpdated value)?  updated,TResult? Function( ChatDeleted value)?  deleted,TResult? Function( DirectMessageSent value)?  directMessageSent,TResult? Function( ChatDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial(_that);case ChatDetailLoading() when loading != null:
return loading(_that);case ChatCreated() when created != null:
return created(_that);case ChatLoaded() when loaded != null:
return loaded(_that);case ChatUpdated() when updated != null:
return updated(_that);case ChatDeleted() when deleted != null:
return deleted(_that);case DirectMessageSent() when directMessageSent != null:
return directMessageSent(_that);case ChatDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Chat chat,  int userId)?  created,TResult Function( Chat chat)?  loaded,TResult Function( Chat chat)?  updated,TResult Function( int chatId)?  deleted,TResult Function( List<Chat> chats)?  directMessageSent,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial();case ChatDetailLoading() when loading != null:
return loading();case ChatCreated() when created != null:
return created(_that.chat,_that.userId);case ChatLoaded() when loaded != null:
return loaded(_that.chat);case ChatUpdated() when updated != null:
return updated(_that.chat);case ChatDeleted() when deleted != null:
return deleted(_that.chatId);case DirectMessageSent() when directMessageSent != null:
return directMessageSent(_that.chats);case ChatDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Chat chat,  int userId)  created,required TResult Function( Chat chat)  loaded,required TResult Function( Chat chat)  updated,required TResult Function( int chatId)  deleted,required TResult Function( List<Chat> chats)  directMessageSent,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case ChatDetailInitial():
return initial();case ChatDetailLoading():
return loading();case ChatCreated():
return created(_that.chat,_that.userId);case ChatLoaded():
return loaded(_that.chat);case ChatUpdated():
return updated(_that.chat);case ChatDeleted():
return deleted(_that.chatId);case DirectMessageSent():
return directMessageSent(_that.chats);case ChatDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Chat chat,  int userId)?  created,TResult? Function( Chat chat)?  loaded,TResult? Function( Chat chat)?  updated,TResult? Function( int chatId)?  deleted,TResult? Function( List<Chat> chats)?  directMessageSent,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial();case ChatDetailLoading() when loading != null:
return loading();case ChatCreated() when created != null:
return created(_that.chat,_that.userId);case ChatLoaded() when loaded != null:
return loaded(_that.chat);case ChatUpdated() when updated != null:
return updated(_that.chat);case ChatDeleted() when deleted != null:
return deleted(_that.chatId);case DirectMessageSent() when directMessageSent != null:
return directMessageSent(_that.chats);case ChatDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ChatDetailInitial implements ChatDetailState {
  const ChatDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatDetailState.initial()';
}


}




/// @nodoc


class ChatDetailLoading implements ChatDetailState {
  const ChatDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatDetailState.loading()';
}


}




/// @nodoc


class ChatCreated implements ChatDetailState {
  const ChatCreated({required this.chat, required this.userId});
  

 final  Chat chat;
 final  int userId;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCreatedCopyWith<ChatCreated> get copyWith => _$ChatCreatedCopyWithImpl<ChatCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCreated&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,chat,userId);

@override
String toString() {
  return 'ChatDetailState.created(chat: $chat, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ChatCreatedCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $ChatCreatedCopyWith(ChatCreated value, $Res Function(ChatCreated) _then) = _$ChatCreatedCopyWithImpl;
@useResult
$Res call({
 Chat chat, int userId
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class _$ChatCreatedCopyWithImpl<$Res>
    implements $ChatCreatedCopyWith<$Res> {
  _$ChatCreatedCopyWithImpl(this._self, this._then);

  final ChatCreated _self;
  final $Res Function(ChatCreated) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,Object? userId = null,}) {
  return _then(ChatCreated(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ChatDetailState
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


class ChatLoaded implements ChatDetailState {
  const ChatLoaded({required this.chat});
  

 final  Chat chat;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatLoadedCopyWith<ChatLoaded> get copyWith => _$ChatLoadedCopyWithImpl<ChatLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatLoaded&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString() {
  return 'ChatDetailState.loaded(chat: $chat)';
}


}

/// @nodoc
abstract mixin class $ChatLoadedCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $ChatLoadedCopyWith(ChatLoaded value, $Res Function(ChatLoaded) _then) = _$ChatLoadedCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class _$ChatLoadedCopyWithImpl<$Res>
    implements $ChatLoadedCopyWith<$Res> {
  _$ChatLoadedCopyWithImpl(this._self, this._then);

  final ChatLoaded _self;
  final $Res Function(ChatLoaded) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(ChatLoaded(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of ChatDetailState
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


class ChatUpdated implements ChatDetailState {
  const ChatUpdated({required this.chat});
  

 final  Chat chat;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatUpdatedCopyWith<ChatUpdated> get copyWith => _$ChatUpdatedCopyWithImpl<ChatUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatUpdated&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString() {
  return 'ChatDetailState.updated(chat: $chat)';
}


}

/// @nodoc
abstract mixin class $ChatUpdatedCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $ChatUpdatedCopyWith(ChatUpdated value, $Res Function(ChatUpdated) _then) = _$ChatUpdatedCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class _$ChatUpdatedCopyWithImpl<$Res>
    implements $ChatUpdatedCopyWith<$Res> {
  _$ChatUpdatedCopyWithImpl(this._self, this._then);

  final ChatUpdated _self;
  final $Res Function(ChatUpdated) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(ChatUpdated(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of ChatDetailState
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


class ChatDeleted implements ChatDetailState {
  const ChatDeleted({required this.chatId});
  

 final  int chatId;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDeletedCopyWith<ChatDeleted> get copyWith => _$ChatDeletedCopyWithImpl<ChatDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDeleted&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,chatId);

@override
String toString() {
  return 'ChatDetailState.deleted(chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class $ChatDeletedCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $ChatDeletedCopyWith(ChatDeleted value, $Res Function(ChatDeleted) _then) = _$ChatDeletedCopyWithImpl;
@useResult
$Res call({
 int chatId
});




}
/// @nodoc
class _$ChatDeletedCopyWithImpl<$Res>
    implements $ChatDeletedCopyWith<$Res> {
  _$ChatDeletedCopyWithImpl(this._self, this._then);

  final ChatDeleted _self;
  final $Res Function(ChatDeleted) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,}) {
  return _then(ChatDeleted(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DirectMessageSent implements ChatDetailState {
  const DirectMessageSent({required final  List<Chat> chats}): _chats = chats;
  

 final  List<Chat> _chats;
 List<Chat> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}


/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DirectMessageSentCopyWith<DirectMessageSent> get copyWith => _$DirectMessageSentCopyWithImpl<DirectMessageSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DirectMessageSent&&const DeepCollectionEquality().equals(other._chats, _chats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats));

@override
String toString() {
  return 'ChatDetailState.directMessageSent(chats: $chats)';
}


}

/// @nodoc
abstract mixin class $DirectMessageSentCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $DirectMessageSentCopyWith(DirectMessageSent value, $Res Function(DirectMessageSent) _then) = _$DirectMessageSentCopyWithImpl;
@useResult
$Res call({
 List<Chat> chats
});




}
/// @nodoc
class _$DirectMessageSentCopyWithImpl<$Res>
    implements $DirectMessageSentCopyWith<$Res> {
  _$DirectMessageSentCopyWithImpl(this._self, this._then);

  final DirectMessageSent _self;
  final $Res Function(DirectMessageSent) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chats = null,}) {
  return _then(DirectMessageSent(
chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<Chat>,
  ));
}


}

/// @nodoc


class ChatDetailFailure implements ChatDetailState {
  const ChatDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDetailFailureCopyWith<ChatDetailFailure> get copyWith => _$ChatDetailFailureCopyWithImpl<ChatDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ChatDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ChatDetailFailureCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $ChatDetailFailureCopyWith(ChatDetailFailure value, $Res Function(ChatDetailFailure) _then) = _$ChatDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ChatDetailFailureCopyWithImpl<$Res>
    implements $ChatDetailFailureCopyWith<$Res> {
  _$ChatDetailFailureCopyWithImpl(this._self, this._then);

  final ChatDetailFailure _self;
  final $Res Function(ChatDetailFailure) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ChatDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ChatDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatDetailEvent()';
}


}

/// @nodoc
class $ChatDetailEventCopyWith<$Res>  {
$ChatDetailEventCopyWith(ChatDetailEvent _, $Res Function(ChatDetailEvent) __);
}


/// Adds pattern-matching-related methods to [ChatDetailEvent].
extension ChatDetailEventPatterns on ChatDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Created value)?  created,TResult Function( _Loaded value)?  loaded,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,TResult Function( _DirectMessageSent value)?  directMessageSent,TResult Function( _Create value)?  create,TResult Function( _Get value)?  get,TResult Function( _Subscribe value)?  subscribe,TResult Function( _SendDirectMessage value)?  sendDirectMessage,TResult Function( _MarkAsRead value)?  markAsRead,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _DirectMessageSent() when directMessageSent != null:
return directMessageSent(_that);case _Create() when create != null:
return create(_that);case _Get() when get != null:
return get(_that);case _Subscribe() when subscribe != null:
return subscribe(_that);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Created value)  created,required TResult Function( _Loaded value)  loaded,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,required TResult Function( _DirectMessageSent value)  directMessageSent,required TResult Function( _Create value)  create,required TResult Function( _Get value)  get,required TResult Function( _Subscribe value)  subscribe,required TResult Function( _SendDirectMessage value)  sendDirectMessage,required TResult Function( _MarkAsRead value)  markAsRead,}){
final _that = this;
switch (_that) {
case _Created():
return created(_that);case _Loaded():
return loaded(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);case _DirectMessageSent():
return directMessageSent(_that);case _Create():
return create(_that);case _Get():
return get(_that);case _Subscribe():
return subscribe(_that);case _SendDirectMessage():
return sendDirectMessage(_that);case _MarkAsRead():
return markAsRead(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Created value)?  created,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,TResult? Function( _DirectMessageSent value)?  directMessageSent,TResult? Function( _Create value)?  create,TResult? Function( _Get value)?  get,TResult? Function( _Subscribe value)?  subscribe,TResult? Function( _SendDirectMessage value)?  sendDirectMessage,TResult? Function( _MarkAsRead value)?  markAsRead,}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _DirectMessageSent() when directMessageSent != null:
return directMessageSent(_that);case _Create() when create != null:
return create(_that);case _Get() when get != null:
return get(_that);case _Subscribe() when subscribe != null:
return subscribe(_that);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  loaded,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  deleted,TResult Function( Map<String, dynamic> payload)?  directMessageSent,TResult Function( User user)?  create,TResult Function( Chat chat)?  get,TResult Function( Chat chat)?  subscribe,TResult Function( List<User> users,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition)?  sendDirectMessage,TResult Function( Chat chat)?  markAsRead,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _DirectMessageSent() when directMessageSent != null:
return directMessageSent(_that.payload);case _Create() when create != null:
return create(_that.user);case _Get() when get != null:
return get(_that.chat);case _Subscribe() when subscribe != null:
return subscribe(_that.chat);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that.users,_that.text,_that.post,_that.ballot,_that.survey,_that.petition);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that.chat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  loaded,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  deleted,required TResult Function( Map<String, dynamic> payload)  directMessageSent,required TResult Function( User user)  create,required TResult Function( Chat chat)  get,required TResult Function( Chat chat)  subscribe,required TResult Function( List<User> users,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition)  sendDirectMessage,required TResult Function( Chat chat)  markAsRead,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Loaded():
return loaded(_that.payload);case _Updated():
return updated(_that.payload);case _Deleted():
return deleted(_that.payload);case _DirectMessageSent():
return directMessageSent(_that.payload);case _Create():
return create(_that.user);case _Get():
return get(_that.chat);case _Subscribe():
return subscribe(_that.chat);case _SendDirectMessage():
return sendDirectMessage(_that.users,_that.text,_that.post,_that.ballot,_that.survey,_that.petition);case _MarkAsRead():
return markAsRead(_that.chat);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  loaded,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  deleted,TResult? Function( Map<String, dynamic> payload)?  directMessageSent,TResult? Function( User user)?  create,TResult? Function( Chat chat)?  get,TResult? Function( Chat chat)?  subscribe,TResult? Function( List<User> users,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition)?  sendDirectMessage,TResult? Function( Chat chat)?  markAsRead,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _DirectMessageSent() when directMessageSent != null:
return directMessageSent(_that.payload);case _Create() when create != null:
return create(_that.user);case _Get() when get != null:
return get(_that.chat);case _Subscribe() when subscribe != null:
return subscribe(_that.chat);case _SendDirectMessage() when sendDirectMessage != null:
return sendDirectMessage(_that.users,_that.text,_that.post,_that.ballot,_that.survey,_that.petition);case _MarkAsRead() when markAsRead != null:
return markAsRead(_that.chat);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements ChatDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'ChatDetailEvent.created(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Created(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Loaded implements ChatDetailEvent {
  const _Loaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'ChatDetailEvent.loaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Loaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements ChatDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'ChatDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Deleted implements ChatDetailEvent {
  const _Deleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'ChatDetailEvent.deleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _DirectMessageSent implements ChatDetailEvent {
  const _DirectMessageSent({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DirectMessageSentCopyWith<_DirectMessageSent> get copyWith => __$DirectMessageSentCopyWithImpl<_DirectMessageSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DirectMessageSent&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'ChatDetailEvent.directMessageSent(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DirectMessageSentCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
  factory _$DirectMessageSentCopyWith(_DirectMessageSent value, $Res Function(_DirectMessageSent) _then) = __$DirectMessageSentCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$DirectMessageSentCopyWithImpl<$Res>
    implements _$DirectMessageSentCopyWith<$Res> {
  __$DirectMessageSentCopyWithImpl(this._self, this._then);

  final _DirectMessageSent _self;
  final $Res Function(_DirectMessageSent) _then;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_DirectMessageSent(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Create implements ChatDetailEvent {
  const _Create({required this.user});
  

 final  User user;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ChatDetailEvent.create(user: $user)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Create(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of ChatDetailEvent
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


class _Get implements ChatDetailEvent {
  const _Get({required this.chat});
  

 final  Chat chat;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString() {
  return 'ChatDetailEvent.get(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_Get(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of ChatDetailEvent
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


class _Subscribe implements ChatDetailEvent {
  const _Subscribe({required this.chat});
  

 final  Chat chat;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribeCopyWith<_Subscribe> get copyWith => __$SubscribeCopyWithImpl<_Subscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscribe&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString() {
  return 'ChatDetailEvent.subscribe(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$SubscribeCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
  factory _$SubscribeCopyWith(_Subscribe value, $Res Function(_Subscribe) _then) = __$SubscribeCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$SubscribeCopyWithImpl<$Res>
    implements _$SubscribeCopyWith<$Res> {
  __$SubscribeCopyWithImpl(this._self, this._then);

  final _Subscribe _self;
  final $Res Function(_Subscribe) _then;

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_Subscribe(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of ChatDetailEvent
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


class _SendDirectMessage implements ChatDetailEvent {
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

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendDirectMessageCopyWith<_SendDirectMessage> get copyWith => __$SendDirectMessageCopyWithImpl<_SendDirectMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendDirectMessage&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.text, text) || other.text == text)&&(identical(other.post, post) || other.post == post)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),text,post,ballot,survey,petition);

@override
String toString() {
  return 'ChatDetailEvent.sendDirectMessage(users: $users, text: $text, post: $post, ballot: $ballot, survey: $survey, petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$SendDirectMessageCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
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

/// Create a copy of ChatDetailEvent
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

/// Create a copy of ChatDetailEvent
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
}/// Create a copy of ChatDetailEvent
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
}/// Create a copy of ChatDetailEvent
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
}/// Create a copy of ChatDetailEvent
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


class _MarkAsRead implements ChatDetailEvent {
  const _MarkAsRead({required this.chat});
  

 final  Chat chat;

/// Create a copy of ChatDetailEvent
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
  return 'ChatDetailEvent.markAsRead(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$MarkAsReadCopyWith<$Res> implements $ChatDetailEventCopyWith<$Res> {
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

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_MarkAsRead(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of ChatDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}
}

// dart format on
