// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'likes_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LikesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikesState()';
}


}

/// @nodoc
class $LikesStateCopyWith<$Res>  {
$LikesStateCopyWith(LikesState _, $Res Function(LikesState) __);
}


/// Adds pattern-matching-related methods to [LikesState].
extension LikesStatePatterns on LikesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LikesInitial value)?  initial,TResult Function( LikesLoading value)?  loading,TResult Function( LikesLoaded value)?  loaded,TResult Function( LikesFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LikesInitial() when initial != null:
return initial(_that);case LikesLoading() when loading != null:
return loading(_that);case LikesLoaded() when loaded != null:
return loaded(_that);case LikesFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LikesInitial value)  initial,required TResult Function( LikesLoading value)  loading,required TResult Function( LikesLoaded value)  loaded,required TResult Function( LikesFailure value)  failure,}){
final _that = this;
switch (_that) {
case LikesInitial():
return initial(_that);case LikesLoading():
return loading(_that);case LikesLoaded():
return loaded(_that);case LikesFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LikesInitial value)?  initial,TResult? Function( LikesLoading value)?  loading,TResult? Function( LikesLoaded value)?  loaded,TResult? Function( LikesFailure value)?  failure,}){
final _that = this;
switch (_that) {
case LikesInitial() when initial != null:
return initial(_that);case LikesLoading() when loading != null:
return loading(_that);case LikesLoaded() when loaded != null:
return loaded(_that);case LikesFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int userId,  List<Post> posts)?  loaded,TResult Function( int userId)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LikesInitial() when initial != null:
return initial();case LikesLoading() when loading != null:
return loading();case LikesLoaded() when loaded != null:
return loaded(_that.userId,_that.posts);case LikesFailure() when failure != null:
return failure(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int userId,  List<Post> posts)  loaded,required TResult Function( int userId)  failure,}) {final _that = this;
switch (_that) {
case LikesInitial():
return initial();case LikesLoading():
return loading();case LikesLoaded():
return loaded(_that.userId,_that.posts);case LikesFailure():
return failure(_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int userId,  List<Post> posts)?  loaded,TResult? Function( int userId)?  failure,}) {final _that = this;
switch (_that) {
case LikesInitial() when initial != null:
return initial();case LikesLoading() when loading != null:
return loading();case LikesLoaded() when loaded != null:
return loaded(_that.userId,_that.posts);case LikesFailure() when failure != null:
return failure(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class LikesInitial implements LikesState {
  const LikesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikesState.initial()';
}


}




/// @nodoc


class LikesLoading implements LikesState {
  const LikesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikesState.loading()';
}


}




/// @nodoc


class LikesLoaded implements LikesState {
  const LikesLoaded({required this.userId, required final  List<Post> posts}): _posts = posts;
  

 final  int userId;
 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of LikesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikesLoadedCopyWith<LikesLoaded> get copyWith => _$LikesLoadedCopyWithImpl<LikesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesLoaded&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,userId,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'LikesState.loaded(userId: $userId, posts: $posts)';
}


}

/// @nodoc
abstract mixin class $LikesLoadedCopyWith<$Res> implements $LikesStateCopyWith<$Res> {
  factory $LikesLoadedCopyWith(LikesLoaded value, $Res Function(LikesLoaded) _then) = _$LikesLoadedCopyWithImpl;
@useResult
$Res call({
 int userId, List<Post> posts
});




}
/// @nodoc
class _$LikesLoadedCopyWithImpl<$Res>
    implements $LikesLoadedCopyWith<$Res> {
  _$LikesLoadedCopyWithImpl(this._self, this._then);

  final LikesLoaded _self;
  final $Res Function(LikesLoaded) _then;

/// Create a copy of LikesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? posts = null,}) {
  return _then(LikesLoaded(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class LikesFailure implements LikesState {
  const LikesFailure({required this.userId});
  

 final  int userId;

/// Create a copy of LikesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikesFailureCopyWith<LikesFailure> get copyWith => _$LikesFailureCopyWithImpl<LikesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesFailure&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'LikesState.failure(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $LikesFailureCopyWith<$Res> implements $LikesStateCopyWith<$Res> {
  factory $LikesFailureCopyWith(LikesFailure value, $Res Function(LikesFailure) _then) = _$LikesFailureCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$LikesFailureCopyWithImpl<$Res>
    implements $LikesFailureCopyWith<$Res> {
  _$LikesFailureCopyWithImpl(this._self, this._then);

  final LikesFailure _self;
  final $Res Function(LikesFailure) _then;

/// Create a copy of LikesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(LikesFailure(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
