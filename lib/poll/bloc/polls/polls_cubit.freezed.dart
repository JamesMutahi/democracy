// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [PollsState].
extension PollsStatePatterns on PollsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PollsInitial value)?  initial,TResult Function( PollsLoading value)?  loading,TResult Function( PollsLoaded value)?  loaded,TResult Function( PollsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PollsInitial() when initial != null:
return initial(_that);case PollsLoading() when loading != null:
return loading(_that);case PollsLoaded() when loaded != null:
return loaded(_that);case PollsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PollsInitial value)  initial,required TResult Function( PollsLoading value)  loading,required TResult Function( PollsLoaded value)  loaded,required TResult Function( PollsFailure value)  failure,}){
final _that = this;
switch (_that) {
case PollsInitial():
return initial(_that);case PollsLoading():
return loading(_that);case PollsLoaded():
return loaded(_that);case PollsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PollsInitial value)?  initial,TResult? Function( PollsLoading value)?  loading,TResult? Function( PollsLoaded value)?  loaded,TResult? Function( PollsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case PollsInitial() when initial != null:
return initial(_that);case PollsLoading() when loading != null:
return loading(_that);case PollsLoaded() when loaded != null:
return loaded(_that);case PollsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Poll> polls)?  loaded,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PollsInitial() when initial != null:
return initial();case PollsLoading() when loading != null:
return loading();case PollsLoaded() when loaded != null:
return loaded(_that.polls);case PollsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Poll> polls)  loaded,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case PollsInitial():
return initial();case PollsLoading():
return loading();case PollsLoaded():
return loaded(_that.polls);case PollsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Poll> polls)?  loaded,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case PollsInitial() when initial != null:
return initial();case PollsLoading() when loading != null:
return loading();case PollsLoaded() when loaded != null:
return loaded(_that.polls);case PollsFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

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
