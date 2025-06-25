// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rooms_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoomsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoomsState()';
}


}

/// @nodoc
class $RoomsStateCopyWith<$Res>  {
$RoomsStateCopyWith(RoomsState _, $Res Function(RoomsState) __);
}


/// @nodoc


class RoomsInitial implements RoomsState {
  const RoomsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoomsState.initial()';
}


}




/// @nodoc


class RoomsLoading implements RoomsState {
  const RoomsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoomsState.loading()';
}


}




/// @nodoc


class RoomsLoaded implements RoomsState {
  const RoomsLoaded({required final  List<Room> rooms}): _rooms = rooms;
  

 final  List<Room> _rooms;
 List<Room> get rooms {
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rooms);
}


/// Create a copy of RoomsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomsLoadedCopyWith<RoomsLoaded> get copyWith => _$RoomsLoadedCopyWithImpl<RoomsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomsLoaded&&const DeepCollectionEquality().equals(other._rooms, _rooms));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rooms));

@override
String toString() {
  return 'RoomsState.loaded(rooms: $rooms)';
}


}

/// @nodoc
abstract mixin class $RoomsLoadedCopyWith<$Res> implements $RoomsStateCopyWith<$Res> {
  factory $RoomsLoadedCopyWith(RoomsLoaded value, $Res Function(RoomsLoaded) _then) = _$RoomsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Room> rooms
});




}
/// @nodoc
class _$RoomsLoadedCopyWithImpl<$Res>
    implements $RoomsLoadedCopyWith<$Res> {
  _$RoomsLoadedCopyWithImpl(this._self, this._then);

  final RoomsLoaded _self;
  final $Res Function(RoomsLoaded) _then;

/// Create a copy of RoomsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rooms = null,}) {
  return _then(RoomsLoaded(
rooms: null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>,
  ));
}


}

/// @nodoc


class RoomsFailure implements RoomsState {
  const RoomsFailure({required this.error});
  

 final  String error;

/// Create a copy of RoomsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomsFailureCopyWith<RoomsFailure> get copyWith => _$RoomsFailureCopyWithImpl<RoomsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomsFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'RoomsState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $RoomsFailureCopyWith<$Res> implements $RoomsStateCopyWith<$Res> {
  factory $RoomsFailureCopyWith(RoomsFailure value, $Res Function(RoomsFailure) _then) = _$RoomsFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$RoomsFailureCopyWithImpl<$Res>
    implements $RoomsFailureCopyWith<$Res> {
  _$RoomsFailureCopyWithImpl(this._self, this._then);

  final RoomsFailure _self;
  final $Res Function(RoomsFailure) _then;

/// Create a copy of RoomsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(RoomsFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
