// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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


class _SendMessage implements WebsocketEvent {
  const _SendMessage({required final  Map<String, dynamic> message}): _message = message;
  

 final  Map<String, dynamic> _message;
 Map<String, dynamic> get message {
  if (_message is EqualUnmodifiableMapView) return _message;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_message);
}


/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageCopyWith<_SendMessage> get copyWith => __$SendMessageCopyWithImpl<_SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessage&&const DeepCollectionEquality().equals(other._message, _message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_message));

@override
String toString() {
  return 'WebsocketEvent.sendMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SendMessageCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$SendMessageCopyWith(_SendMessage value, $Res Function(_SendMessage) _then) = __$SendMessageCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> message
});




}
/// @nodoc
class __$SendMessageCopyWithImpl<$Res>
    implements _$SendMessageCopyWith<$Res> {
  __$SendMessageCopyWithImpl(this._self, this._then);

  final _SendMessage _self;
  final $Res Function(_SendMessage) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SendMessage(
message: null == message ? _self._message : message // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
