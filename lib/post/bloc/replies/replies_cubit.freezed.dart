// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RepliesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepliesState()';
}


}

/// @nodoc
class $RepliesStateCopyWith<$Res>  {
$RepliesStateCopyWith(RepliesState _, $Res Function(RepliesState) __);
}


/// Adds pattern-matching-related methods to [RepliesState].
extension RepliesStatePatterns on RepliesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RepliesInitial value)?  initial,TResult Function( RepliesLoading value)?  loading,TResult Function( RepliesLoaded value)?  loaded,TResult Function( RepliesFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RepliesInitial() when initial != null:
return initial(_that);case RepliesLoading() when loading != null:
return loading(_that);case RepliesLoaded() when loaded != null:
return loaded(_that);case RepliesFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RepliesInitial value)  initial,required TResult Function( RepliesLoading value)  loading,required TResult Function( RepliesLoaded value)  loaded,required TResult Function( RepliesFailure value)  failure,}){
final _that = this;
switch (_that) {
case RepliesInitial():
return initial(_that);case RepliesLoading():
return loading(_that);case RepliesLoaded():
return loaded(_that);case RepliesFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RepliesInitial value)?  initial,TResult? Function( RepliesLoading value)?  loading,TResult? Function( RepliesLoaded value)?  loaded,TResult? Function( RepliesFailure value)?  failure,}){
final _that = this;
switch (_that) {
case RepliesInitial() when initial != null:
return initial(_that);case RepliesLoading() when loading != null:
return loading(_that);case RepliesLoaded() when loaded != null:
return loaded(_that);case RepliesFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Post> posts)?  loaded,TResult Function()?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RepliesInitial() when initial != null:
return initial();case RepliesLoading() when loading != null:
return loading();case RepliesLoaded() when loaded != null:
return loaded(_that.posts);case RepliesFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Post> posts)  loaded,required TResult Function()  failure,}) {final _that = this;
switch (_that) {
case RepliesInitial():
return initial();case RepliesLoading():
return loading();case RepliesLoaded():
return loaded(_that.posts);case RepliesFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Post> posts)?  loaded,TResult? Function()?  failure,}) {final _that = this;
switch (_that) {
case RepliesInitial() when initial != null:
return initial();case RepliesLoading() when loading != null:
return loading();case RepliesLoaded() when loaded != null:
return loaded(_that.posts);case RepliesFailure() when failure != null:
return failure();case _:
  return null;

}
}

}

/// @nodoc


class RepliesInitial implements RepliesState {
  const RepliesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepliesState.initial()';
}


}




/// @nodoc


class RepliesLoading implements RepliesState {
  const RepliesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepliesState.loading()';
}


}




/// @nodoc


class RepliesLoaded implements RepliesState {
  const RepliesLoaded({required final  List<Post> posts}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of RepliesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepliesLoadedCopyWith<RepliesLoaded> get copyWith => _$RepliesLoadedCopyWithImpl<RepliesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesLoaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'RepliesState.loaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $RepliesLoadedCopyWith<$Res> implements $RepliesStateCopyWith<$Res> {
  factory $RepliesLoadedCopyWith(RepliesLoaded value, $Res Function(RepliesLoaded) _then) = _$RepliesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$RepliesLoadedCopyWithImpl<$Res>
    implements $RepliesLoadedCopyWith<$Res> {
  _$RepliesLoadedCopyWithImpl(this._self, this._then);

  final RepliesLoaded _self;
  final $Res Function(RepliesLoaded) _then;

/// Create a copy of RepliesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(RepliesLoaded(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class RepliesFailure implements RepliesState {
  const RepliesFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepliesState.failure()';
}


}




// dart format on
