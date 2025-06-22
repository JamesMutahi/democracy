// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
