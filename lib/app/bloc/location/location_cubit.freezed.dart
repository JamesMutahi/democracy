// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState()';
}


}

/// @nodoc
class $LocationStateCopyWith<$Res>  {
$LocationStateCopyWith(LocationState _, $Res Function(LocationState) __);
}


/// Adds pattern-matching-related methods to [LocationState].
extension LocationStatePatterns on LocationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LocationInitial value)?  initial,TResult Function( LocationLoading value)?  loading,TResult Function( LocationSuccess value)?  success,TResult Function( LocationFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial(_that);case LocationLoading() when loading != null:
return loading(_that);case LocationSuccess() when success != null:
return success(_that);case LocationFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LocationInitial value)  initial,required TResult Function( LocationLoading value)  loading,required TResult Function( LocationSuccess value)  success,required TResult Function( LocationFailure value)  failure,}){
final _that = this;
switch (_that) {
case LocationInitial():
return initial(_that);case LocationLoading():
return loading(_that);case LocationSuccess():
return success(_that);case LocationFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LocationInitial value)?  initial,TResult? Function( LocationLoading value)?  loading,TResult? Function( LocationSuccess value)?  success,TResult? Function( LocationFailure value)?  failure,}){
final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial(_that);case LocationLoading() when loading != null:
return loading(_that);case LocationSuccess() when success != null:
return success(_that);case LocationFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( LatLng point)?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial();case LocationLoading() when loading != null:
return loading();case LocationSuccess() when success != null:
return success(_that.point);case LocationFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( LatLng point)  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case LocationInitial():
return initial();case LocationLoading():
return loading();case LocationSuccess():
return success(_that.point);case LocationFailure():
return failure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( LatLng point)?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial();case LocationLoading() when loading != null:
return loading();case LocationSuccess() when success != null:
return success(_that.point);case LocationFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class LocationInitial implements LocationState {
  const LocationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState.initial()';
}


}




/// @nodoc


class LocationLoading implements LocationState {
  const LocationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState.loading()';
}


}




/// @nodoc


class LocationSuccess implements LocationState {
  const LocationSuccess({required this.point});
  

 final  LatLng point;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationSuccessCopyWith<LocationSuccess> get copyWith => _$LocationSuccessCopyWithImpl<LocationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSuccess&&(identical(other.point, point) || other.point == point));
}


@override
int get hashCode => Object.hash(runtimeType,point);

@override
String toString() {
  return 'LocationState.success(point: $point)';
}


}

/// @nodoc
abstract mixin class $LocationSuccessCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationSuccessCopyWith(LocationSuccess value, $Res Function(LocationSuccess) _then) = _$LocationSuccessCopyWithImpl;
@useResult
$Res call({
 LatLng point
});




}
/// @nodoc
class _$LocationSuccessCopyWithImpl<$Res>
    implements $LocationSuccessCopyWith<$Res> {
  _$LocationSuccessCopyWithImpl(this._self, this._then);

  final LocationSuccess _self;
  final $Res Function(LocationSuccess) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? point = null,}) {
  return _then(LocationSuccess(
point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

/// @nodoc


class LocationFailure implements LocationState {
  const LocationFailure({required this.error});
  

 final  String error;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationFailureCopyWith<LocationFailure> get copyWith => _$LocationFailureCopyWithImpl<LocationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'LocationState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $LocationFailureCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationFailureCopyWith(LocationFailure value, $Res Function(LocationFailure) _then) = _$LocationFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$LocationFailureCopyWithImpl<$Res>
    implements $LocationFailureCopyWith<$Res> {
  _$LocationFailureCopyWithImpl(this._self, this._then);

  final LocationFailure _self;
  final $Res Function(LocationFailure) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(LocationFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
