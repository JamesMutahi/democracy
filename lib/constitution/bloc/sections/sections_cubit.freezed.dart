// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sections_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SectionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionsState()';
}


}

/// @nodoc
class $SectionsStateCopyWith<$Res>  {
$SectionsStateCopyWith(SectionsState _, $Res Function(SectionsState) __);
}


/// Adds pattern-matching-related methods to [SectionsState].
extension SectionsStatePatterns on SectionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SectionsInitial value)?  initial,TResult Function( SectionsLoading value)?  loading,TResult Function( SectionsLoaded value)?  loaded,TResult Function( SectionsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SectionsInitial() when initial != null:
return initial(_that);case SectionsLoading() when loading != null:
return loading(_that);case SectionsLoaded() when loaded != null:
return loaded(_that);case SectionsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SectionsInitial value)  initial,required TResult Function( SectionsLoading value)  loading,required TResult Function( SectionsLoaded value)  loaded,required TResult Function( SectionsFailure value)  failure,}){
final _that = this;
switch (_that) {
case SectionsInitial():
return initial(_that);case SectionsLoading():
return loading(_that);case SectionsLoaded():
return loaded(_that);case SectionsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SectionsInitial value)?  initial,TResult? Function( SectionsLoading value)?  loading,TResult? Function( SectionsLoaded value)?  loaded,TResult? Function( SectionsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SectionsInitial() when initial != null:
return initial(_that);case SectionsLoading() when loading != null:
return loading(_that);case SectionsLoaded() when loaded != null:
return loaded(_that);case SectionsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Section> sections)?  loaded,TResult Function()?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SectionsInitial() when initial != null:
return initial();case SectionsLoading() when loading != null:
return loading();case SectionsLoaded() when loaded != null:
return loaded(_that.sections);case SectionsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Section> sections)  loaded,required TResult Function()  failure,}) {final _that = this;
switch (_that) {
case SectionsInitial():
return initial();case SectionsLoading():
return loading();case SectionsLoaded():
return loaded(_that.sections);case SectionsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Section> sections)?  loaded,TResult? Function()?  failure,}) {final _that = this;
switch (_that) {
case SectionsInitial() when initial != null:
return initial();case SectionsLoading() when loading != null:
return loading();case SectionsLoaded() when loaded != null:
return loaded(_that.sections);case SectionsFailure() when failure != null:
return failure();case _:
  return null;

}
}

}

/// @nodoc


class SectionsInitial implements SectionsState {
  const SectionsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionsState.initial()';
}


}




/// @nodoc


class SectionsLoading implements SectionsState {
  const SectionsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionsState.loading()';
}


}




/// @nodoc


class SectionsLoaded implements SectionsState {
  const SectionsLoaded({required final  List<Section> sections}): _sections = sections;
  

 final  List<Section> _sections;
 List<Section> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of SectionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionsLoadedCopyWith<SectionsLoaded> get copyWith => _$SectionsLoadedCopyWithImpl<SectionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionsLoaded&&const DeepCollectionEquality().equals(other._sections, _sections));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'SectionsState.loaded(sections: $sections)';
}


}

/// @nodoc
abstract mixin class $SectionsLoadedCopyWith<$Res> implements $SectionsStateCopyWith<$Res> {
  factory $SectionsLoadedCopyWith(SectionsLoaded value, $Res Function(SectionsLoaded) _then) = _$SectionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Section> sections
});




}
/// @nodoc
class _$SectionsLoadedCopyWithImpl<$Res>
    implements $SectionsLoadedCopyWith<$Res> {
  _$SectionsLoadedCopyWithImpl(this._self, this._then);

  final SectionsLoaded _self;
  final $Res Function(SectionsLoaded) _then;

/// Create a copy of SectionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sections = null,}) {
  return _then(SectionsLoaded(
sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<Section>,
  ));
}


}

/// @nodoc


class SectionsFailure implements SectionsState {
  const SectionsFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionsFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionsState.failure()';
}


}




// dart format on
