// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
