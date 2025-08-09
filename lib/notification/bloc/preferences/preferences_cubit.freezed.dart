// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreferencesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesState()';
}


}

/// @nodoc
class $PreferencesStateCopyWith<$Res>  {
$PreferencesStateCopyWith(PreferencesState _, $Res Function(PreferencesState) __);
}


/// Adds pattern-matching-related methods to [PreferencesState].
extension PreferencesStatePatterns on PreferencesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PreferencesLoading value)?  loading,TResult Function( PreferencesLoaded value)?  loaded,TResult Function( PreferencesFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PreferencesLoading() when loading != null:
return loading(_that);case PreferencesLoaded() when loaded != null:
return loaded(_that);case PreferencesFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PreferencesLoading value)  loading,required TResult Function( PreferencesLoaded value)  loaded,required TResult Function( PreferencesFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PreferencesLoading():
return loading(_that);case PreferencesLoaded():
return loaded(_that);case PreferencesFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PreferencesLoading value)?  loading,TResult? Function( PreferencesLoaded value)?  loaded,TResult? Function( PreferencesFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PreferencesLoading() when loading != null:
return loading(_that);case PreferencesLoaded() when loaded != null:
return loaded(_that);case PreferencesFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Preferences preferences)?  loaded,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PreferencesLoading() when loading != null:
return loading();case PreferencesLoaded() when loaded != null:
return loaded(_that.preferences);case PreferencesFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Preferences preferences)  loaded,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case PreferencesLoading():
return loading();case PreferencesLoaded():
return loaded(_that.preferences);case PreferencesFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Preferences preferences)?  loaded,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PreferencesLoading() when loading != null:
return loading();case PreferencesLoaded() when loaded != null:
return loaded(_that.preferences);case PreferencesFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PreferencesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesState.initial()';
}


}




/// @nodoc


class PreferencesLoading implements PreferencesState {
  const PreferencesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesState.loading()';
}


}




/// @nodoc


class PreferencesLoaded implements PreferencesState {
  const PreferencesLoaded({required this.preferences});
  

 final  Preferences preferences;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesLoadedCopyWith<PreferencesLoaded> get copyWith => _$PreferencesLoadedCopyWithImpl<PreferencesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesLoaded&&(identical(other.preferences, preferences) || other.preferences == preferences));
}


@override
int get hashCode => Object.hash(runtimeType,preferences);

@override
String toString() {
  return 'PreferencesState.loaded(preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class $PreferencesLoadedCopyWith<$Res> implements $PreferencesStateCopyWith<$Res> {
  factory $PreferencesLoadedCopyWith(PreferencesLoaded value, $Res Function(PreferencesLoaded) _then) = _$PreferencesLoadedCopyWithImpl;
@useResult
$Res call({
 Preferences preferences
});


$PreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class _$PreferencesLoadedCopyWithImpl<$Res>
    implements $PreferencesLoadedCopyWith<$Res> {
  _$PreferencesLoadedCopyWithImpl(this._self, this._then);

  final PreferencesLoaded _self;
  final $Res Function(PreferencesLoaded) _then;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preferences = null,}) {
  return _then(PreferencesLoaded(
preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as Preferences,
  ));
}

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreferencesCopyWith<$Res> get preferences {
  
  return $PreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}

/// @nodoc


class PreferencesFailure implements PreferencesState {
  const PreferencesFailure({required this.error});
  

 final  String error;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesFailureCopyWith<PreferencesFailure> get copyWith => _$PreferencesFailureCopyWithImpl<PreferencesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PreferencesState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PreferencesFailureCopyWith<$Res> implements $PreferencesStateCopyWith<$Res> {
  factory $PreferencesFailureCopyWith(PreferencesFailure value, $Res Function(PreferencesFailure) _then) = _$PreferencesFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PreferencesFailureCopyWithImpl<$Res>
    implements $PreferencesFailureCopyWith<$Res> {
  _$PreferencesFailureCopyWithImpl(this._self, this._then);

  final PreferencesFailure _self;
  final $Res Function(PreferencesFailure) _then;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PreferencesFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
