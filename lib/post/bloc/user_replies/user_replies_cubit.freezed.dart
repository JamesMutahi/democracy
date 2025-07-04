// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_replies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserRepliesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRepliesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserRepliesState()';
}


}

/// @nodoc
class $UserRepliesStateCopyWith<$Res>  {
$UserRepliesStateCopyWith(UserRepliesState _, $Res Function(UserRepliesState) __);
}


/// Adds pattern-matching-related methods to [UserRepliesState].
extension UserRepliesStatePatterns on UserRepliesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserRepliesInitial value)?  initial,TResult Function( UserRepliesLoading value)?  loading,TResult Function( UserRepliesLoaded value)?  loaded,TResult Function( UserRepliesFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserRepliesInitial() when initial != null:
return initial(_that);case UserRepliesLoading() when loading != null:
return loading(_that);case UserRepliesLoaded() when loaded != null:
return loaded(_that);case UserRepliesFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserRepliesInitial value)  initial,required TResult Function( UserRepliesLoading value)  loading,required TResult Function( UserRepliesLoaded value)  loaded,required TResult Function( UserRepliesFailure value)  failure,}){
final _that = this;
switch (_that) {
case UserRepliesInitial():
return initial(_that);case UserRepliesLoading():
return loading(_that);case UserRepliesLoaded():
return loaded(_that);case UserRepliesFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserRepliesInitial value)?  initial,TResult? Function( UserRepliesLoading value)?  loading,TResult? Function( UserRepliesLoaded value)?  loaded,TResult? Function( UserRepliesFailure value)?  failure,}){
final _that = this;
switch (_that) {
case UserRepliesInitial() when initial != null:
return initial(_that);case UserRepliesLoading() when loading != null:
return loading(_that);case UserRepliesLoaded() when loaded != null:
return loaded(_that);case UserRepliesFailure() when failure != null:
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
case UserRepliesInitial() when initial != null:
return initial();case UserRepliesLoading() when loading != null:
return loading();case UserRepliesLoaded() when loaded != null:
return loaded(_that.posts);case UserRepliesFailure() when failure != null:
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
case UserRepliesInitial():
return initial();case UserRepliesLoading():
return loading();case UserRepliesLoaded():
return loaded(_that.posts);case UserRepliesFailure():
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
case UserRepliesInitial() when initial != null:
return initial();case UserRepliesLoading() when loading != null:
return loading();case UserRepliesLoaded() when loaded != null:
return loaded(_that.posts);case UserRepliesFailure() when failure != null:
return failure();case _:
  return null;

}
}

}

/// @nodoc


class UserRepliesInitial implements UserRepliesState {
  const UserRepliesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRepliesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserRepliesState.initial()';
}


}




/// @nodoc


class UserRepliesLoading implements UserRepliesState {
  const UserRepliesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRepliesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserRepliesState.loading()';
}


}




/// @nodoc


class UserRepliesLoaded implements UserRepliesState {
  const UserRepliesLoaded({required final  List<Post> posts}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of UserRepliesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRepliesLoadedCopyWith<UserRepliesLoaded> get copyWith => _$UserRepliesLoadedCopyWithImpl<UserRepliesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRepliesLoaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'UserRepliesState.loaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $UserRepliesLoadedCopyWith<$Res> implements $UserRepliesStateCopyWith<$Res> {
  factory $UserRepliesLoadedCopyWith(UserRepliesLoaded value, $Res Function(UserRepliesLoaded) _then) = _$UserRepliesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$UserRepliesLoadedCopyWithImpl<$Res>
    implements $UserRepliesLoadedCopyWith<$Res> {
  _$UserRepliesLoadedCopyWithImpl(this._self, this._then);

  final UserRepliesLoaded _self;
  final $Res Function(UserRepliesLoaded) _then;

/// Create a copy of UserRepliesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(UserRepliesLoaded(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class UserRepliesFailure implements UserRepliesState {
  const UserRepliesFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRepliesFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserRepliesState.failure()';
}


}




// dart format on
