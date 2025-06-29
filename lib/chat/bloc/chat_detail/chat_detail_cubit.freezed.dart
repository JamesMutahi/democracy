// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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


class MarkedAsRead implements ChatDetailState {
  const MarkedAsRead({required final  List<Message> messages}): _messages = messages;
  

 final  List<Message> _messages;
 List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkedAsReadCopyWith<MarkedAsRead> get copyWith => _$MarkedAsReadCopyWithImpl<MarkedAsRead>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkedAsRead&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatDetailState.markedAsRead(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $MarkedAsReadCopyWith<$Res> implements $ChatDetailStateCopyWith<$Res> {
  factory $MarkedAsReadCopyWith(MarkedAsRead value, $Res Function(MarkedAsRead) _then) = _$MarkedAsReadCopyWithImpl;
@useResult
$Res call({
 List<Message> messages
});




}
/// @nodoc
class _$MarkedAsReadCopyWithImpl<$Res>
    implements $MarkedAsReadCopyWith<$Res> {
  _$MarkedAsReadCopyWithImpl(this._self, this._then);

  final MarkedAsRead _self;
  final $Res Function(MarkedAsRead) _then;

/// Create a copy of ChatDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(MarkedAsRead(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}


}

/// @nodoc


class ChatDetailFailure implements ChatDetailState {
  const ChatDetailFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDetailFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatDetailState.failure()';
}


}




// dart format on
