// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SectionDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionDetailState()';
}


}

/// @nodoc
class $SectionDetailStateCopyWith<$Res>  {
$SectionDetailStateCopyWith(SectionDetailState _, $Res Function(SectionDetailState) __);
}


/// Adds pattern-matching-related methods to [SectionDetailState].
extension SectionDetailStatePatterns on SectionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( SectionLoaded value)?  loaded,TResult Function( SectionUpdated value)?  updated,TResult Function( SectionDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case SectionLoaded() when loaded != null:
return loaded(_that);case SectionUpdated() when updated != null:
return updated(_that);case SectionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( SectionLoaded value)  loaded,required TResult Function( SectionUpdated value)  updated,required TResult Function( SectionDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case SectionLoaded():
return loaded(_that);case SectionUpdated():
return updated(_that);case SectionDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( SectionLoaded value)?  loaded,TResult? Function( SectionUpdated value)?  updated,TResult? Function( SectionDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case SectionLoaded() when loaded != null:
return loaded(_that);case SectionUpdated() when updated != null:
return updated(_that);case SectionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Section section)?  loaded,TResult Function( Section section)?  updated,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case SectionLoaded() when loaded != null:
return loaded(_that.section);case SectionUpdated() when updated != null:
return updated(_that.section);case SectionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Section section)  loaded,required TResult Function( Section section)  updated,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case SectionLoaded():
return loaded(_that.section);case SectionUpdated():
return updated(_that.section);case SectionDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Section section)?  loaded,TResult? Function( Section section)?  updated,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case SectionLoaded() when loaded != null:
return loaded(_that.section);case SectionUpdated() when updated != null:
return updated(_that.section);case SectionDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SectionDetailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionDetailState.initial()';
}


}




/// @nodoc


class _Loading implements SectionDetailState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionDetailState.loading()';
}


}




/// @nodoc


class SectionLoaded implements SectionDetailState {
  const SectionLoaded({required this.section});
  

 final  Section section;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionLoadedCopyWith<SectionLoaded> get copyWith => _$SectionLoadedCopyWithImpl<SectionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionLoaded&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString() {
  return 'SectionDetailState.loaded(section: $section)';
}


}

/// @nodoc
abstract mixin class $SectionLoadedCopyWith<$Res> implements $SectionDetailStateCopyWith<$Res> {
  factory $SectionLoadedCopyWith(SectionLoaded value, $Res Function(SectionLoaded) _then) = _$SectionLoadedCopyWithImpl;
@useResult
$Res call({
 Section section
});


$SectionCopyWith<$Res> get section;

}
/// @nodoc
class _$SectionLoadedCopyWithImpl<$Res>
    implements $SectionLoadedCopyWith<$Res> {
  _$SectionLoadedCopyWithImpl(this._self, this._then);

  final SectionLoaded _self;
  final $Res Function(SectionLoaded) _then;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(SectionLoaded(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,
  ));
}

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res> get section {
  
  return $SectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc


class SectionUpdated implements SectionDetailState {
  const SectionUpdated({required this.section});
  

 final  Section section;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionUpdatedCopyWith<SectionUpdated> get copyWith => _$SectionUpdatedCopyWithImpl<SectionUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionUpdated&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString() {
  return 'SectionDetailState.updated(section: $section)';
}


}

/// @nodoc
abstract mixin class $SectionUpdatedCopyWith<$Res> implements $SectionDetailStateCopyWith<$Res> {
  factory $SectionUpdatedCopyWith(SectionUpdated value, $Res Function(SectionUpdated) _then) = _$SectionUpdatedCopyWithImpl;
@useResult
$Res call({
 Section section
});


$SectionCopyWith<$Res> get section;

}
/// @nodoc
class _$SectionUpdatedCopyWithImpl<$Res>
    implements $SectionUpdatedCopyWith<$Res> {
  _$SectionUpdatedCopyWithImpl(this._self, this._then);

  final SectionUpdated _self;
  final $Res Function(SectionUpdated) _then;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(SectionUpdated(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,
  ));
}

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res> get section {
  
  return $SectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc


class SectionDetailFailure implements SectionDetailState {
  const SectionDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionDetailFailureCopyWith<SectionDetailFailure> get copyWith => _$SectionDetailFailureCopyWithImpl<SectionDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SectionDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $SectionDetailFailureCopyWith<$Res> implements $SectionDetailStateCopyWith<$Res> {
  factory $SectionDetailFailureCopyWith(SectionDetailFailure value, $Res Function(SectionDetailFailure) _then) = _$SectionDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$SectionDetailFailureCopyWithImpl<$Res>
    implements $SectionDetailFailureCopyWith<$Res> {
  _$SectionDetailFailureCopyWithImpl(this._self, this._then);

  final SectionDetailFailure _self;
  final $Res Function(SectionDetailFailure) _then;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SectionDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
