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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatDetailInitial value)?  initial,TResult Function( ChatDetailLoading value)?  loading,TResult Function( ChatCreated value)?  chatCreated,TResult Function( ChatUpdated value)?  chatUpdated,TResult Function( MessageCreated value)?  messageCreated,TResult Function( MessageUpdated value)?  messageUpdated,TResult Function( MessageDeleted value)?  messageDeleted,TResult Function( ChatDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial(_that);case ChatDetailLoading() when loading != null:
return loading(_that);case ChatCreated() when chatCreated != null:
return chatCreated(_that);case ChatUpdated() when chatUpdated != null:
return chatUpdated(_that);case MessageCreated() when messageCreated != null:
return messageCreated(_that);case MessageUpdated() when messageUpdated != null:
return messageUpdated(_that);case MessageDeleted() when messageDeleted != null:
return messageDeleted(_that);case ChatDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatDetailInitial value)  initial,required TResult Function( ChatDetailLoading value)  loading,required TResult Function( ChatCreated value)  chatCreated,required TResult Function( ChatUpdated value)  chatUpdated,required TResult Function( MessageCreated value)  messageCreated,required TResult Function( MessageUpdated value)  messageUpdated,required TResult Function( MessageDeleted value)  messageDeleted,required TResult Function( ChatDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case ChatDetailInitial():
return initial(_that);case ChatDetailLoading():
return loading(_that);case ChatCreated():
return chatCreated(_that);case ChatUpdated():
return chatUpdated(_that);case MessageCreated():
return messageCreated(_that);case MessageUpdated():
return messageUpdated(_that);case MessageDeleted():
return messageDeleted(_that);case ChatDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatDetailInitial value)?  initial,TResult? Function( ChatDetailLoading value)?  loading,TResult? Function( ChatCreated value)?  chatCreated,TResult? Function( ChatUpdated value)?  chatUpdated,TResult? Function( MessageCreated value)?  messageCreated,TResult? Function( MessageUpdated value)?  messageUpdated,TResult? Function( MessageDeleted value)?  messageDeleted,TResult? Function( ChatDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial(_that);case ChatDetailLoading() when loading != null:
return loading(_that);case ChatCreated() when chatCreated != null:
return chatCreated(_that);case ChatUpdated() when chatUpdated != null:
return chatUpdated(_that);case MessageCreated() when messageCreated != null:
return messageCreated(_that);case MessageUpdated() when messageUpdated != null:
return messageUpdated(_that);case MessageDeleted() when messageDeleted != null:
return messageDeleted(_that);case ChatDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Chat chat)?  chatCreated,TResult Function( Chat chat)?  chatUpdated,TResult Function( Message message)?  messageCreated,TResult Function( Message message)?  messageUpdated,TResult Function( Message message)?  messageDeleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial();case ChatDetailLoading() when loading != null:
return loading();case ChatCreated() when chatCreated != null:
return chatCreated(_that.chat);case ChatUpdated() when chatUpdated != null:
return chatUpdated(_that.chat);case MessageCreated() when messageCreated != null:
return messageCreated(_that.message);case MessageUpdated() when messageUpdated != null:
return messageUpdated(_that.message);case MessageDeleted() when messageDeleted != null:
return messageDeleted(_that.message);case ChatDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Chat chat)  chatCreated,required TResult Function( Chat chat)  chatUpdated,required TResult Function( Message message)  messageCreated,required TResult Function( Message message)  messageUpdated,required TResult Function( Message message)  messageDeleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case ChatDetailInitial():
return initial();case ChatDetailLoading():
return loading();case ChatCreated():
return chatCreated(_that.chat);case ChatUpdated():
return chatUpdated(_that.chat);case MessageCreated():
return messageCreated(_that.message);case MessageUpdated():
return messageUpdated(_that.message);case MessageDeleted():
return messageDeleted(_that.message);case ChatDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Chat chat)?  chatCreated,TResult? Function( Chat chat)?  chatUpdated,TResult? Function( Message message)?  messageCreated,TResult? Function( Message message)?  messageUpdated,TResult? Function( Message message)?  messageDeleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case ChatDetailInitial() when initial != null:
return initial();case ChatDetailLoading() when loading != null:
return loading();case ChatCreated() when chatCreated != null:
return chatCreated(_that.chat);case ChatUpdated() when chatUpdated != null:
return chatUpdated(_that.chat);case MessageCreated() when messageCreated != null:
return messageCreated(_that.message);case MessageUpdated() when messageUpdated != null:
return messageUpdated(_that.message);case MessageDeleted() when messageDeleted != null:
return messageDeleted(_that.message);case ChatDetailFailure() when failure != null:
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
  const ChatCreated({required this.chat});
  

 final  Chat chat;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCreatedCopyWith<ChatCreated> get copyWith => _$ChatCreatedCopyWithImpl<ChatCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCreated&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString() {
  return 'ChatDetailState.chatCreated(chat: $chat)';
}


}

/// @nodoc
abstract mixin class $ChatCreatedCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $ChatCreatedCopyWith(ChatCreated value, $Res Function(ChatCreated) _then) = _$ChatCreatedCopyWithImpl;
@useResult
$Res call({
 Chat chat
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
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(ChatCreated(
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
  return 'ChatDetailState.chatUpdated(chat: $chat)';
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


class MessageCreated implements ChatDetailState {
  const MessageCreated({required this.message});
  

 final  Message message;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCreatedCopyWith<MessageCreated> get copyWith => _$MessageCreatedCopyWithImpl<MessageCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageCreated&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatDetailState.messageCreated(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageCreatedCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $MessageCreatedCopyWith(MessageCreated value, $Res Function(MessageCreated) _then) = _$MessageCreatedCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$MessageCreatedCopyWithImpl<$Res>
    implements $MessageCreatedCopyWith<$Res> {
  _$MessageCreatedCopyWithImpl(this._self, this._then);

  final MessageCreated _self;
  final $Res Function(MessageCreated) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageCreated(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc


class MessageUpdated implements ChatDetailState {
  const MessageUpdated({required this.message});
  

 final  Message message;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageUpdatedCopyWith<MessageUpdated> get copyWith => _$MessageUpdatedCopyWithImpl<MessageUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageUpdated&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatDetailState.messageUpdated(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageUpdatedCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $MessageUpdatedCopyWith(MessageUpdated value, $Res Function(MessageUpdated) _then) = _$MessageUpdatedCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$MessageUpdatedCopyWithImpl<$Res>
    implements $MessageUpdatedCopyWith<$Res> {
  _$MessageUpdatedCopyWithImpl(this._self, this._then);

  final MessageUpdated _self;
  final $Res Function(MessageUpdated) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageUpdated(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc


class MessageDeleted implements ChatDetailState {
  const MessageDeleted({required this.message});
  

 final  Message message;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDeletedCopyWith<MessageDeleted> get copyWith => _$MessageDeletedCopyWithImpl<MessageDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDeleted&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatDetailState.messageDeleted(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageDeletedCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $MessageDeletedCopyWith(MessageDeleted value, $Res Function(MessageDeleted) _then) = _$MessageDeletedCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$MessageDeletedCopyWithImpl<$Res>
    implements $MessageDeletedCopyWith<$Res> {
  _$MessageDeletedCopyWithImpl(this._self, this._then);

  final MessageDeleted _self;
  final $Res Function(MessageDeleted) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageDeleted(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
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
