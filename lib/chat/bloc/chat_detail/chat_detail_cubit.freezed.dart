// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_detail_cubit.dart';

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatDetailInitial value)?  initial,TResult Function( ChatDetailLoading value)?  loading,TResult Function( ChatCreated value)?  created,TResult Function( ChatUpdated value)?  updated,TResult Function( ChatDeleted value)?  deleted,TResult Function( DirectMessageSent value)?  directMessageSent,TResult Function( ChatDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial(_that);case ChatDetailLoading() when loading != null:
return loading(_that);case ChatCreated() when created != null:
return created(_that);case ChatUpdated() when updated != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatDetailInitial value)  initial,required TResult Function( ChatDetailLoading value)  loading,required TResult Function( ChatCreated value)  created,required TResult Function( ChatUpdated value)  updated,required TResult Function( ChatDeleted value)  deleted,required TResult Function( DirectMessageSent value)  directMessageSent,required TResult Function( ChatDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case ChatDetailInitial():
return initial(_that);case ChatDetailLoading():
return loading(_that);case ChatCreated():
return created(_that);case ChatUpdated():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatDetailInitial value)?  initial,TResult? Function( ChatDetailLoading value)?  loading,TResult? Function( ChatCreated value)?  created,TResult? Function( ChatUpdated value)?  updated,TResult? Function( ChatDeleted value)?  deleted,TResult? Function( DirectMessageSent value)?  directMessageSent,TResult? Function( ChatDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial(_that);case ChatDetailLoading() when loading != null:
return loading(_that);case ChatCreated() when created != null:
return created(_that);case ChatUpdated() when updated != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Chat chat,  int userId)?  created,TResult Function( Chat chat)?  updated,TResult Function( int chatId)?  deleted,TResult Function()?  directMessageSent,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial();case ChatDetailLoading() when loading != null:
return loading();case ChatCreated() when created != null:
return created(_that.chat,_that.userId);case ChatUpdated() when updated != null:
return updated(_that.chat);case ChatDeleted() when deleted != null:
return deleted(_that.chatId);case DirectMessageSent() when directMessageSent != null:
return directMessageSent();case ChatDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Chat chat,  int userId)  created,required TResult Function( Chat chat)  updated,required TResult Function( int chatId)  deleted,required TResult Function()  directMessageSent,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case ChatDetailInitial():
return initial();case ChatDetailLoading():
return loading();case ChatCreated():
return created(_that.chat,_that.userId);case ChatUpdated():
return updated(_that.chat);case ChatDeleted():
return deleted(_that.chatId);case DirectMessageSent():
return directMessageSent();case ChatDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Chat chat,  int userId)?  created,TResult? Function( Chat chat)?  updated,TResult? Function( int chatId)?  deleted,TResult? Function()?  directMessageSent,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial();case ChatDetailLoading() when loading != null:
return loading();case ChatCreated() when created != null:
return created(_that.chat,_that.userId);case ChatUpdated() when updated != null:
return updated(_that.chat);case ChatDeleted() when deleted != null:
return deleted(_that.chatId);case DirectMessageSent() when directMessageSent != null:
return directMessageSent();case ChatDetailFailure() when failure != null:
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
  const DirectMessageSent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DirectMessageSent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatDetailState.directMessageSent()';
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

// dart format on
