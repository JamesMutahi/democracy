// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'polls_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PollsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollsState()';
}


}

/// @nodoc
class $PollsStateCopyWith<$Res>  {
$PollsStateCopyWith(PollsState _, $Res Function(PollsState) __);
}


/// @nodoc


class PollsInitial implements PollsState {
  const PollsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollsState.initial()';
}


}




/// @nodoc


class PollsLoading implements PollsState {
  const PollsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollsState.loading()';
}


}




/// @nodoc


class PollsLoaded implements PollsState {
  const PollsLoaded({required final  List<Poll> polls}): _polls = polls;
  

 final  List<Poll> _polls;
 List<Poll> get polls {
  if (_polls is EqualUnmodifiableListView) return _polls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_polls);
}


/// Create a copy of PollsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollsLoadedCopyWith<PollsLoaded> get copyWith => _$PollsLoadedCopyWithImpl<PollsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollsLoaded&&const DeepCollectionEquality().equals(other._polls, _polls));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_polls));

@override
String toString() {
  return 'PollsState.loaded(polls: $polls)';
}


}

/// @nodoc
abstract mixin class $PollsLoadedCopyWith<$Res> implements $PollsStateCopyWith<$Res> {
  factory $PollsLoadedCopyWith(PollsLoaded value, $Res Function(PollsLoaded) _then) = _$PollsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Poll> polls
});




}
/// @nodoc
class _$PollsLoadedCopyWithImpl<$Res>
    implements $PollsLoadedCopyWith<$Res> {
  _$PollsLoadedCopyWithImpl(this._self, this._then);

  final PollsLoaded _self;
  final $Res Function(PollsLoaded) _then;

/// Create a copy of PollsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? polls = null,}) {
  return _then(PollsLoaded(
polls: null == polls ? _self._polls : polls // ignore: cast_nullable_to_non_nullable
as List<Poll>,
  ));
}


}

/// @nodoc


class PollsFailure implements PollsState {
  const PollsFailure({required this.error});
  

 final  String error;

/// Create a copy of PollsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollsFailureCopyWith<PollsFailure> get copyWith => _$PollsFailureCopyWithImpl<PollsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollsFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PollsState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PollsFailureCopyWith<$Res> implements $PollsStateCopyWith<$Res> {
  factory $PollsFailureCopyWith(PollsFailure value, $Res Function(PollsFailure) _then) = _$PollsFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PollsFailureCopyWithImpl<$Res>
    implements $PollsFailureCopyWith<$Res> {
  _$PollsFailureCopyWithImpl(this._self, this._then);

  final PollsFailure _self;
  final $Res Function(PollsFailure) _then;

/// Create a copy of PollsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PollsFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
