// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surveys_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SurveysState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveysState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurveysState()';
}


}

/// @nodoc
class $SurveysStateCopyWith<$Res>  {
$SurveysStateCopyWith(SurveysState _, $Res Function(SurveysState) __);
}


/// @nodoc


class SurveysInitial implements SurveysState {
  const SurveysInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveysInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurveysState.initial()';
}


}




/// @nodoc


class SurveysLoading implements SurveysState {
  const SurveysLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveysLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurveysState.loading()';
}


}




/// @nodoc


class SurveysLoaded implements SurveysState {
  const SurveysLoaded({required final  List<Survey> surveys}): _surveys = surveys;
  

 final  List<Survey> _surveys;
 List<Survey> get surveys {
  if (_surveys is EqualUnmodifiableListView) return _surveys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_surveys);
}


/// Create a copy of SurveysState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveysLoadedCopyWith<SurveysLoaded> get copyWith => _$SurveysLoadedCopyWithImpl<SurveysLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveysLoaded&&const DeepCollectionEquality().equals(other._surveys, _surveys));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_surveys));

@override
String toString() {
  return 'SurveysState.loaded(surveys: $surveys)';
}


}

/// @nodoc
abstract mixin class $SurveysLoadedCopyWith<$Res> implements $SurveysStateCopyWith<$Res> {
  factory $SurveysLoadedCopyWith(SurveysLoaded value, $Res Function(SurveysLoaded) _then) = _$SurveysLoadedCopyWithImpl;
@useResult
$Res call({
 List<Survey> surveys
});




}
/// @nodoc
class _$SurveysLoadedCopyWithImpl<$Res>
    implements $SurveysLoadedCopyWith<$Res> {
  _$SurveysLoadedCopyWithImpl(this._self, this._then);

  final SurveysLoaded _self;
  final $Res Function(SurveysLoaded) _then;

/// Create a copy of SurveysState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? surveys = null,}) {
  return _then(SurveysLoaded(
surveys: null == surveys ? _self._surveys : surveys // ignore: cast_nullable_to_non_nullable
as List<Survey>,
  ));
}


}

/// @nodoc


class SurveysFailure implements SurveysState {
  const SurveysFailure({required this.error});
  

 final  String error;

/// Create a copy of SurveysState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveysFailureCopyWith<SurveysFailure> get copyWith => _$SurveysFailureCopyWithImpl<SurveysFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveysFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SurveysState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $SurveysFailureCopyWith<$Res> implements $SurveysStateCopyWith<$Res> {
  factory $SurveysFailureCopyWith(SurveysFailure value, $Res Function(SurveysFailure) _then) = _$SurveysFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$SurveysFailureCopyWithImpl<$Res>
    implements $SurveysFailureCopyWith<$Res> {
  _$SurveysFailureCopyWithImpl(this._self, this._then);

  final SurveysFailure _self;
  final $Res Function(SurveysFailure) _then;

/// Create a copy of SurveysState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SurveysFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
