// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoomDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoomDetailState()';
}


}

/// @nodoc
class $RoomDetailStateCopyWith<$Res>  {
$RoomDetailStateCopyWith(RoomDetailState _, $Res Function(RoomDetailState) __);
}


/// @nodoc


class RoomDetailInitial implements RoomDetailState {
  const RoomDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoomDetailState.initial()';
}


}




/// @nodoc


class RoomDetailLoading implements RoomDetailState {
  const RoomDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoomDetailState.loading()';
}


}




/// @nodoc


class RoomCreated implements RoomDetailState {
  const RoomCreated({required this.room});
  

 final  Room room;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomCreatedCopyWith<RoomCreated> get copyWith => _$RoomCreatedCopyWithImpl<RoomCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomCreated&&(identical(other.room, room) || other.room == room));
}


@override
int get hashCode => Object.hash(runtimeType,room);

@override
String toString() {
  return 'RoomDetailState.roomCreated(room: $room)';
}


}

/// @nodoc
abstract mixin class $RoomCreatedCopyWith<$Res> implements $RoomDetailStateCopyWith<$Res> {
  factory $RoomCreatedCopyWith(RoomCreated value, $Res Function(RoomCreated) _then) = _$RoomCreatedCopyWithImpl;
@useResult
$Res call({
 Room room
});


$RoomCopyWith<$Res> get room;

}
/// @nodoc
class _$RoomCreatedCopyWithImpl<$Res>
    implements $RoomCreatedCopyWith<$Res> {
  _$RoomCreatedCopyWithImpl(this._self, this._then);

  final RoomCreated _self;
  final $Res Function(RoomCreated) _then;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? room = null,}) {
  return _then(RoomCreated(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,
  ));
}

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

/// @nodoc


class MessageCreated implements RoomDetailState {
  const MessageCreated({required this.room});
  

 final  Room room;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCreatedCopyWith<MessageCreated> get copyWith => _$MessageCreatedCopyWithImpl<MessageCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageCreated&&(identical(other.room, room) || other.room == room));
}


@override
int get hashCode => Object.hash(runtimeType,room);

@override
String toString() {
  return 'RoomDetailState.messageCreated(room: $room)';
}


}

/// @nodoc
abstract mixin class $MessageCreatedCopyWith<$Res> implements $RoomDetailStateCopyWith<$Res> {
  factory $MessageCreatedCopyWith(MessageCreated value, $Res Function(MessageCreated) _then) = _$MessageCreatedCopyWithImpl;
@useResult
$Res call({
 Room room
});


$RoomCopyWith<$Res> get room;

}
/// @nodoc
class _$MessageCreatedCopyWithImpl<$Res>
    implements $MessageCreatedCopyWith<$Res> {
  _$MessageCreatedCopyWithImpl(this._self, this._then);

  final MessageCreated _self;
  final $Res Function(MessageCreated) _then;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? room = null,}) {
  return _then(MessageCreated(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,
  ));
}

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

/// @nodoc


class MessageEdited implements RoomDetailState {
  const MessageEdited({required this.room, required this.message});
  

 final  Room room;
 final  Message message;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageEditedCopyWith<MessageEdited> get copyWith => _$MessageEditedCopyWithImpl<MessageEdited>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageEdited&&(identical(other.room, room) || other.room == room)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,room,message);

@override
String toString() {
  return 'RoomDetailState.messageEdited(room: $room, message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageEditedCopyWith<$Res> implements $RoomDetailStateCopyWith<$Res> {
  factory $MessageEditedCopyWith(MessageEdited value, $Res Function(MessageEdited) _then) = _$MessageEditedCopyWithImpl;
@useResult
$Res call({
 Room room, Message message
});


$RoomCopyWith<$Res> get room;$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$MessageEditedCopyWithImpl<$Res>
    implements $MessageEditedCopyWith<$Res> {
  _$MessageEditedCopyWithImpl(this._self, this._then);

  final MessageEdited _self;
  final $Res Function(MessageEdited) _then;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? room = null,Object? message = null,}) {
  return _then(MessageEdited(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}/// Create a copy of RoomDetailState
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


class MessageDeleted implements RoomDetailState {
  const MessageDeleted({required this.room, required this.message});
  

 final  Room room;
 final  Message message;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDeletedCopyWith<MessageDeleted> get copyWith => _$MessageDeletedCopyWithImpl<MessageDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDeleted&&(identical(other.room, room) || other.room == room)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,room,message);

@override
String toString() {
  return 'RoomDetailState.messageDeleted(room: $room, message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageDeletedCopyWith<$Res> implements $RoomDetailStateCopyWith<$Res> {
  factory $MessageDeletedCopyWith(MessageDeleted value, $Res Function(MessageDeleted) _then) = _$MessageDeletedCopyWithImpl;
@useResult
$Res call({
 Room room, Message message
});


$RoomCopyWith<$Res> get room;$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$MessageDeletedCopyWithImpl<$Res>
    implements $MessageDeletedCopyWith<$Res> {
  _$MessageDeletedCopyWithImpl(this._self, this._then);

  final MessageDeleted _self;
  final $Res Function(MessageDeleted) _then;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? room = null,Object? message = null,}) {
  return _then(MessageDeleted(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}/// Create a copy of RoomDetailState
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


class MarkedAsRead implements RoomDetailState {
  const MarkedAsRead({required this.room});
  

 final  Room room;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkedAsReadCopyWith<MarkedAsRead> get copyWith => _$MarkedAsReadCopyWithImpl<MarkedAsRead>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkedAsRead&&(identical(other.room, room) || other.room == room));
}


@override
int get hashCode => Object.hash(runtimeType,room);

@override
String toString() {
  return 'RoomDetailState.markedAsRead(room: $room)';
}


}

/// @nodoc
abstract mixin class $MarkedAsReadCopyWith<$Res> implements $RoomDetailStateCopyWith<$Res> {
  factory $MarkedAsReadCopyWith(MarkedAsRead value, $Res Function(MarkedAsRead) _then) = _$MarkedAsReadCopyWithImpl;
@useResult
$Res call({
 Room room
});


$RoomCopyWith<$Res> get room;

}
/// @nodoc
class _$MarkedAsReadCopyWithImpl<$Res>
    implements $MarkedAsReadCopyWith<$Res> {
  _$MarkedAsReadCopyWithImpl(this._self, this._then);

  final MarkedAsRead _self;
  final $Res Function(MarkedAsRead) _then;

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? room = null,}) {
  return _then(MarkedAsRead(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,
  ));
}

/// Create a copy of RoomDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

/// @nodoc


class RoomDetailFailure implements RoomDetailState {
  const RoomDetailFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomDetailFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoomDetailState.failure()';
}


}




// dart format on
