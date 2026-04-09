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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Connect value)?  connect,TResult Function( _ChangeState value)?  changeState,TResult Function( _Disconnect value)?  disconnect,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _Disconnect() when disconnect != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Connect value)  connect,required TResult Function( _ChangeState value)  changeState,required TResult Function( _Disconnect value)  disconnect,}){
final _that = this;
switch (_that) {
case _Connect():
return connect(_that);case _ChangeState():
return changeState(_that);case _Disconnect():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Connect value)?  connect,TResult? Function( _ChangeState value)?  changeState,TResult? Function( _Disconnect value)?  disconnect,}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _Disconnect() when disconnect != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connect,TResult Function( WebsocketState state)?  changeState,TResult Function()?  disconnect,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _Disconnect() when disconnect != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connect,required TResult Function( WebsocketState state)  changeState,required TResult Function()  disconnect,}) {final _that = this;
switch (_that) {
case _Connect():
return connect();case _ChangeState():
return changeState(_that.state);case _Disconnect():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connect,TResult? Function( WebsocketState state)?  changeState,TResult? Function()?  disconnect,}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _Disconnect() when disconnect != null:
return disconnect();case _:
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


class _Disconnect implements WebsocketEvent {
  const _Disconnect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disconnect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WebsocketEvent.disconnect()';
}


}




// dart format on
