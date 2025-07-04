// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connectivity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectivityEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectivityEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityEvent()';
}


}

/// @nodoc
class $ConnectivityEventCopyWith<$Res>  {
$ConnectivityEventCopyWith(ConnectivityEvent _, $Res Function(ConnectivityEvent) __);
}


/// Adds pattern-matching-related methods to [ConnectivityEvent].
extension ConnectivityEventPatterns on ConnectivityEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ListenConnection value)?  listenConnection,TResult Function( _ChangeConnection value)?  changeConnection,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenConnection() when listenConnection != null:
return listenConnection(_that);case _ChangeConnection() when changeConnection != null:
return changeConnection(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ListenConnection value)  listenConnection,required TResult Function( _ChangeConnection value)  changeConnection,}){
final _that = this;
switch (_that) {
case _ListenConnection():
return listenConnection(_that);case _ChangeConnection():
return changeConnection(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ListenConnection value)?  listenConnection,TResult? Function( _ChangeConnection value)?  changeConnection,}){
final _that = this;
switch (_that) {
case _ListenConnection() when listenConnection != null:
return listenConnection(_that);case _ChangeConnection() when changeConnection != null:
return changeConnection(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  listenConnection,TResult Function( ConnectivityState status)?  changeConnection,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenConnection() when listenConnection != null:
return listenConnection();case _ChangeConnection() when changeConnection != null:
return changeConnection(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  listenConnection,required TResult Function( ConnectivityState status)  changeConnection,}) {final _that = this;
switch (_that) {
case _ListenConnection():
return listenConnection();case _ChangeConnection():
return changeConnection(_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  listenConnection,TResult? Function( ConnectivityState status)?  changeConnection,}) {final _that = this;
switch (_that) {
case _ListenConnection() when listenConnection != null:
return listenConnection();case _ChangeConnection() when changeConnection != null:
return changeConnection(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _ListenConnection implements ConnectivityEvent {
  const _ListenConnection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenConnection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityEvent.listenConnection()';
}


}




/// @nodoc


class _ChangeConnection implements ConnectivityEvent {
  const _ChangeConnection(this.status);
  

 final  ConnectivityState status;

/// Create a copy of ConnectivityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeConnectionCopyWith<_ChangeConnection> get copyWith => __$ChangeConnectionCopyWithImpl<_ChangeConnection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeConnection&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'ConnectivityEvent.changeConnection(status: $status)';
}


}

/// @nodoc
abstract mixin class _$ChangeConnectionCopyWith<$Res> implements $ConnectivityEventCopyWith<$Res> {
  factory _$ChangeConnectionCopyWith(_ChangeConnection value, $Res Function(_ChangeConnection) _then) = __$ChangeConnectionCopyWithImpl;
@useResult
$Res call({
 ConnectivityState status
});


$ConnectivityStateCopyWith<$Res> get status;

}
/// @nodoc
class __$ChangeConnectionCopyWithImpl<$Res>
    implements _$ChangeConnectionCopyWith<$Res> {
  __$ChangeConnectionCopyWithImpl(this._self, this._then);

  final _ChangeConnection _self;
  final $Res Function(_ChangeConnection) _then;

/// Create a copy of ConnectivityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_ChangeConnection(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConnectivityState,
  ));
}

/// Create a copy of ConnectivityEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectivityStateCopyWith<$Res> get status {
  
  return $ConnectivityStateCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
mixin _$ConnectivityState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectivityState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityState()';
}


}

/// @nodoc
class $ConnectivityStateCopyWith<$Res>  {
$ConnectivityStateCopyWith(ConnectivityState _, $Res Function(ConnectivityState) __);
}


/// Adds pattern-matching-related methods to [ConnectivityState].
extension ConnectivityStatePatterns on ConnectivityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConnectivityInitial value)?  initial,TResult Function( ConnectivitySuccess value)?  success,TResult Function( ConnectivityFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConnectivityInitial() when initial != null:
return initial(_that);case ConnectivitySuccess() when success != null:
return success(_that);case ConnectivityFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConnectivityInitial value)  initial,required TResult Function( ConnectivitySuccess value)  success,required TResult Function( ConnectivityFailure value)  failure,}){
final _that = this;
switch (_that) {
case ConnectivityInitial():
return initial(_that);case ConnectivitySuccess():
return success(_that);case ConnectivityFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConnectivityInitial value)?  initial,TResult? Function( ConnectivitySuccess value)?  success,TResult? Function( ConnectivityFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ConnectivityInitial() when initial != null:
return initial(_that);case ConnectivitySuccess() when success != null:
return success(_that);case ConnectivityFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  success,TResult Function()?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConnectivityInitial() when initial != null:
return initial();case ConnectivitySuccess() when success != null:
return success();case ConnectivityFailure() when failure != null:
return failure();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  success,required TResult Function()  failure,}) {final _that = this;
switch (_that) {
case ConnectivityInitial():
return initial();case ConnectivitySuccess():
return success();case ConnectivityFailure():
return failure();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  success,TResult? Function()?  failure,}) {final _that = this;
switch (_that) {
case ConnectivityInitial() when initial != null:
return initial();case ConnectivitySuccess() when success != null:
return success();case ConnectivityFailure() when failure != null:
return failure();case _:
  return null;

}
}

}

/// @nodoc


class ConnectivityInitial implements ConnectivityState {
  const ConnectivityInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectivityInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityState.initial()';
}


}




/// @nodoc


class ConnectivitySuccess implements ConnectivityState {
  const ConnectivitySuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectivitySuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityState.success()';
}


}




/// @nodoc


class ConnectivityFailure implements ConnectivityState {
  const ConnectivityFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectivityFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectivityState.failure()';
}


}




// dart format on
