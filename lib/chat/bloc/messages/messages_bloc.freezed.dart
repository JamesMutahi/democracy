// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MessagesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessagesEvent()';
}


}

/// @nodoc
class $MessagesEventCopyWith<$Res>  {
$MessagesEventCopyWith(MessagesEvent _, $Res Function(MessagesEvent) __);
}


/// Adds pattern-matching-related methods to [MessagesEvent].
extension MessagesEventPatterns on MessagesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,TResult Function( _Add value)?  add,TResult Function( _Update value)?  update,TResult Function( _Remove value)?  remove,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Add() when add != null:
return add(_that);case _Update() when update != null:
return update(_that);case _Remove() when remove != null:
return remove(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,required TResult Function( _Add value)  add,required TResult Function( _Update value)  update,required TResult Function( _Remove value)  remove,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);case _Add():
return add(_that);case _Update():
return update(_that);case _Remove():
return remove(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,TResult? Function( _Add value)?  add,TResult? Function( _Update value)?  update,TResult? Function( _Remove value)?  remove,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Add() when add != null:
return add(_that);case _Update() when update != null:
return update(_that);case _Remove() when remove != null:
return remove(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Chat chat,  Message? oldestMessage,  Message? newestMessage)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( Message message)?  add,TResult Function( Message message)?  update,TResult Function( int messageId)?  remove,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.chat,_that.oldestMessage,_that.newestMessage);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.message);case _Update() when update != null:
return update(_that.message);case _Remove() when remove != null:
return remove(_that.messageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Chat chat,  Message? oldestMessage,  Message? newestMessage)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( Message message)  add,required TResult Function( Message message)  update,required TResult Function( int messageId)  remove,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.chat,_that.oldestMessage,_that.newestMessage);case _Received():
return received(_that.payload);case _Add():
return add(_that.message);case _Update():
return update(_that.message);case _Remove():
return remove(_that.messageId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Chat chat,  Message? oldestMessage,  Message? newestMessage)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( Message message)?  add,TResult? Function( Message message)?  update,TResult? Function( int messageId)?  remove,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.chat,_that.oldestMessage,_that.newestMessage);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.message);case _Update() when update != null:
return update(_that.message);case _Remove() when remove != null:
return remove(_that.messageId);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements MessagesEvent {
  const _Get({required this.chat, this.oldestMessage, this.newestMessage});
  

 final  Chat chat;
 final  Message? oldestMessage;
 final  Message? newestMessage;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.oldestMessage, oldestMessage) || other.oldestMessage == oldestMessage)&&(identical(other.newestMessage, newestMessage) || other.newestMessage == newestMessage));
}


@override
int get hashCode => Object.hash(runtimeType,chat,oldestMessage,newestMessage);

@override
String toString() {
  return 'MessagesEvent.get(chat: $chat, oldestMessage: $oldestMessage, newestMessage: $newestMessage)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $MessagesEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 Chat chat, Message? oldestMessage, Message? newestMessage
});


$ChatCopyWith<$Res> get chat;$MessageCopyWith<$Res>? get oldestMessage;$MessageCopyWith<$Res>? get newestMessage;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,Object? oldestMessage = freezed,Object? newestMessage = freezed,}) {
  return _then(_Get(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,oldestMessage: freezed == oldestMessage ? _self.oldestMessage : oldestMessage // ignore: cast_nullable_to_non_nullable
as Message?,newestMessage: freezed == newestMessage ? _self.newestMessage : newestMessage // ignore: cast_nullable_to_non_nullable
as Message?,
  ));
}

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res>? get oldestMessage {
    if (_self.oldestMessage == null) {
    return null;
  }

  return $MessageCopyWith<$Res>(_self.oldestMessage!, (value) {
    return _then(_self.copyWith(oldestMessage: value));
  });
}/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res>? get newestMessage {
    if (_self.newestMessage == null) {
    return null;
  }

  return $MessageCopyWith<$Res>(_self.newestMessage!, (value) {
    return _then(_self.copyWith(newestMessage: value));
  });
}
}

/// @nodoc


class _Received implements MessagesEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceivedCopyWith<_Received> get copyWith => __$ReceivedCopyWithImpl<_Received>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Received&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'MessagesEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $MessagesEventCopyWith<$Res> {
  factory _$ReceivedCopyWith(_Received value, $Res Function(_Received) _then) = __$ReceivedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$ReceivedCopyWithImpl<$Res>
    implements _$ReceivedCopyWith<$Res> {
  __$ReceivedCopyWithImpl(this._self, this._then);

  final _Received _self;
  final $Res Function(_Received) _then;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Add implements MessagesEvent {
  const _Add({required this.message});
  

 final  Message message;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCopyWith<_Add> get copyWith => __$AddCopyWithImpl<_Add>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Add&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessagesEvent.add(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res> implements $MessagesEventCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) = __$AddCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class __$AddCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Add(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of MessagesEvent
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


class _Update implements MessagesEvent {
  const _Update({required this.message});
  

 final  Message message;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessagesEvent.update(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $MessagesEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Update(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of MessagesEvent
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


class _Remove implements MessagesEvent {
  const _Remove({required this.messageId});
  

 final  int messageId;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCopyWith<_Remove> get copyWith => __$RemoveCopyWithImpl<_Remove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Remove&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'MessagesEvent.remove(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class _$RemoveCopyWith<$Res> implements $MessagesEventCopyWith<$Res> {
  factory _$RemoveCopyWith(_Remove value, $Res Function(_Remove) _then) = __$RemoveCopyWithImpl;
@useResult
$Res call({
 int messageId
});




}
/// @nodoc
class __$RemoveCopyWithImpl<$Res>
    implements _$RemoveCopyWith<$Res> {
  __$RemoveCopyWithImpl(this._self, this._then);

  final _Remove _self;
  final $Res Function(_Remove) _then;

/// Create a copy of MessagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(_Remove(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
