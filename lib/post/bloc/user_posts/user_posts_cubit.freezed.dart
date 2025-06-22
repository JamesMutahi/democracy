// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  const UserPostsLoaded({required final  List<Post> posts}): _posts = posts;
  

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPostsLoaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'UserPostsState.loaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $UserPostsLoadedCopyWith<$Res> implements $UserPostsStateCopyWith<$Res> {
  factory $UserPostsLoadedCopyWith(UserPostsLoaded value, $Res Function(UserPostsLoaded) _then) = _$UserPostsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
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
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(UserPostsLoaded(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class UserPostsFailure implements UserPostsState {
  const UserPostsFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPostsFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPostsState.failure()';
}


}




// dart format on
