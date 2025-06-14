// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostListState()';
}


}

/// @nodoc
class $PostListStateCopyWith<$Res>  {
$PostListStateCopyWith(PostListState _, $Res Function(PostListState) __);
}


/// @nodoc


class PostListInitial implements PostListState {
  const PostListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostListState.initial()';
}


}




/// @nodoc


class PostListLoading implements PostListState {
  const PostListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostListState.loading()';
}


}




/// @nodoc


class PostListLoaded implements PostListState {
  const PostListLoaded({required final  List<Post> posts}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostListLoadedCopyWith<PostListLoaded> get copyWith => _$PostListLoadedCopyWithImpl<PostListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListLoaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'PostListState.loaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $PostListLoadedCopyWith<$Res> implements $PostListStateCopyWith<$Res> {
  factory $PostListLoadedCopyWith(PostListLoaded value, $Res Function(PostListLoaded) _then) = _$PostListLoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$PostListLoadedCopyWithImpl<$Res>
    implements $PostListLoadedCopyWith<$Res> {
  _$PostListLoadedCopyWithImpl(this._self, this._then);

  final PostListLoaded _self;
  final $Res Function(PostListLoaded) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(PostListLoaded(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class PostListFailure implements PostListState {
  const PostListFailure({required this.error});
  

 final  String error;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostListFailureCopyWith<PostListFailure> get copyWith => _$PostListFailureCopyWithImpl<PostListFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PostListState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PostListFailureCopyWith<$Res> implements $PostListStateCopyWith<$Res> {
  factory $PostListFailureCopyWith(PostListFailure value, $Res Function(PostListFailure) _then) = _$PostListFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PostListFailureCopyWithImpl<$Res>
    implements $PostListFailureCopyWith<$Res> {
  _$PostListFailureCopyWithImpl(this._self, this._then);

  final PostListFailure _self;
  final $Res Function(PostListFailure) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PostListFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
