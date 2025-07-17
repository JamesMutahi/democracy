// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPostsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPostsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPostsState()';
}


}

/// @nodoc
class $UserPostsStateCopyWith<$Res>  {
$UserPostsStateCopyWith(UserPostsState _, $Res Function(UserPostsState) __);
}


/// Adds pattern-matching-related methods to [UserPostsState].
extension UserPostsStatePatterns on UserPostsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserPostsInitial value)?  initial,TResult Function( UserPostsLoading value)?  loading,TResult Function( UserPostsLoaded value)?  loaded,TResult Function( UserPostsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserPostsInitial() when initial != null:
return initial(_that);case UserPostsLoading() when loading != null:
return loading(_that);case UserPostsLoaded() when loaded != null:
return loaded(_that);case UserPostsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserPostsInitial value)  initial,required TResult Function( UserPostsLoading value)  loading,required TResult Function( UserPostsLoaded value)  loaded,required TResult Function( UserPostsFailure value)  failure,}){
final _that = this;
switch (_that) {
case UserPostsInitial():
return initial(_that);case UserPostsLoading():
return loading(_that);case UserPostsLoaded():
return loaded(_that);case UserPostsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserPostsInitial value)?  initial,TResult? Function( UserPostsLoading value)?  loading,TResult? Function( UserPostsLoaded value)?  loaded,TResult? Function( UserPostsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case UserPostsInitial() when initial != null:
return initial(_that);case UserPostsLoading() when loading != null:
return loading(_that);case UserPostsLoaded() when loaded != null:
return loaded(_that);case UserPostsFailure() when failure != null:
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
case UserPostsInitial() when initial != null:
return initial();case UserPostsLoading() when loading != null:
return loading();case UserPostsLoaded() when loaded != null:
return loaded(_that.userId,_that.posts);case UserPostsFailure() when failure != null:
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
case UserPostsInitial():
return initial();case UserPostsLoading():
return loading();case UserPostsLoaded():
return loaded(_that.userId,_that.posts);case UserPostsFailure():
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
case UserPostsInitial() when initial != null:
return initial();case UserPostsLoading() when loading != null:
return loading();case UserPostsLoaded() when loaded != null:
return loaded(_that.userId,_that.posts);case UserPostsFailure() when failure != null:
return failure(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class UserPostsInitial implements UserPostsState {
  const UserPostsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPostsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPostsState.initial()';
}


}




/// @nodoc


class UserPostsLoading implements UserPostsState {
  const UserPostsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPostsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPostsState.loading()';
}


}




/// @nodoc


class UserPostsLoaded implements UserPostsState {
  const UserPostsLoaded({required this.userId, required final  List<Post> posts}): _posts = posts;
  

 final  int userId;
 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of UserPostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPostsLoadedCopyWith<UserPostsLoaded> get copyWith => _$UserPostsLoadedCopyWithImpl<UserPostsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPostsLoaded&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,userId,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'UserPostsState.loaded(userId: $userId, posts: $posts)';
}


}

/// @nodoc
abstract mixin class $UserPostsLoadedCopyWith<$Res> implements $UserPostsStateCopyWith<$Res> {
  factory $UserPostsLoadedCopyWith(UserPostsLoaded value, $Res Function(UserPostsLoaded) _then) = _$UserPostsLoadedCopyWithImpl;
@useResult
$Res call({
 int userId, List<Post> posts
});




}
/// @nodoc
class _$UserPostsLoadedCopyWithImpl<$Res>
    implements $UserPostsLoadedCopyWith<$Res> {
  _$UserPostsLoadedCopyWithImpl(this._self, this._then);

  final UserPostsLoaded _self;
  final $Res Function(UserPostsLoaded) _then;

/// Create a copy of UserPostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? posts = null,}) {
  return _then(UserPostsLoaded(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class UserPostsFailure implements UserPostsState {
  const UserPostsFailure({required this.userId});
  

 final  int userId;

/// Create a copy of UserPostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPostsFailureCopyWith<UserPostsFailure> get copyWith => _$UserPostsFailureCopyWithImpl<UserPostsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPostsFailure&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'UserPostsState.failure(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserPostsFailureCopyWith<$Res> implements $UserPostsStateCopyWith<$Res> {
  factory $UserPostsFailureCopyWith(UserPostsFailure value, $Res Function(UserPostsFailure) _then) = _$UserPostsFailureCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$UserPostsFailureCopyWithImpl<$Res>
    implements $UserPostsFailureCopyWith<$Res> {
  _$UserPostsFailureCopyWithImpl(this._self, this._then);

  final UserPostsFailure _self;
  final $Res Function(UserPostsFailure) _then;

/// Create a copy of UserPostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(UserPostsFailure(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
