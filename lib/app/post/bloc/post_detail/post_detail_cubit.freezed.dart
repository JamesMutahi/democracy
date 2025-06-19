// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState()';
}


}

/// @nodoc
class $PostDetailStateCopyWith<$Res>  {
$PostDetailStateCopyWith(PostDetailState _, $Res Function(PostDetailState) __);
}


/// @nodoc


class _Initial implements PostDetailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState.initial()';
}


}




/// @nodoc


class PostDetailLoading implements PostDetailState {
  const PostDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState.loading()';
}


}




/// @nodoc


class PostCreated implements PostDetailState {
  const PostCreated({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCreatedCopyWith<PostCreated> get copyWith => _$PostCreatedCopyWithImpl<PostCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostCreated&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailState.created(post: $post)';
}


}

/// @nodoc
abstract mixin class $PostCreatedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostCreatedCopyWith(PostCreated value, $Res Function(PostCreated) _then) = _$PostCreatedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostCreatedCopyWithImpl<$Res>
    implements $PostCreatedCopyWith<$Res> {
  _$PostCreatedCopyWithImpl(this._self, this._then);

  final PostCreated _self;
  final $Res Function(PostCreated) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(PostCreated(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class PostUpdated implements PostDetailState {
  const PostUpdated({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostUpdatedCopyWith<PostUpdated> get copyWith => _$PostUpdatedCopyWithImpl<PostUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostUpdated&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailState.updated(post: $post)';
}


}

/// @nodoc
abstract mixin class $PostUpdatedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostUpdatedCopyWith(PostUpdated value, $Res Function(PostUpdated) _then) = _$PostUpdatedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostUpdatedCopyWithImpl<$Res>
    implements $PostUpdatedCopyWith<$Res> {
  _$PostUpdatedCopyWithImpl(this._self, this._then);

  final PostUpdated _self;
  final $Res Function(PostUpdated) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(PostUpdated(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class PostLiked implements PostDetailState {
  const PostLiked({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostLikedCopyWith<PostLiked> get copyWith => _$PostLikedCopyWithImpl<PostLiked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostLiked&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailState.liked(post: $post)';
}


}

/// @nodoc
abstract mixin class $PostLikedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostLikedCopyWith(PostLiked value, $Res Function(PostLiked) _then) = _$PostLikedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostLikedCopyWithImpl<$Res>
    implements $PostLikedCopyWith<$Res> {
  _$PostLikedCopyWithImpl(this._self, this._then);

  final PostLiked _self;
  final $Res Function(PostLiked) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(PostLiked(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class PostBookmarked implements PostDetailState {
  const PostBookmarked({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostBookmarkedCopyWith<PostBookmarked> get copyWith => _$PostBookmarkedCopyWithImpl<PostBookmarked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostBookmarked&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailState.bookmarked(post: $post)';
}


}

/// @nodoc
abstract mixin class $PostBookmarkedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostBookmarkedCopyWith(PostBookmarked value, $Res Function(PostBookmarked) _then) = _$PostBookmarkedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostBookmarkedCopyWithImpl<$Res>
    implements $PostBookmarkedCopyWith<$Res> {
  _$PostBookmarkedCopyWithImpl(this._self, this._then);

  final PostBookmarked _self;
  final $Res Function(PostBookmarked) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(PostBookmarked(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class PostDeleted implements PostDetailState {
  const PostDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState.deleted()';
}


}




/// @nodoc


class PostReported implements PostDetailState {
  const PostReported();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostReported);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState.reported()';
}


}




/// @nodoc


class PostDetailFailure implements PostDetailState {
  const PostDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDetailFailureCopyWith<PostDetailFailure> get copyWith => _$PostDetailFailureCopyWithImpl<PostDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PostDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PostDetailFailureCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostDetailFailureCopyWith(PostDetailFailure value, $Res Function(PostDetailFailure) _then) = _$PostDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PostDetailFailureCopyWithImpl<$Res>
    implements $PostDetailFailureCopyWith<$Res> {
  _$PostDetailFailureCopyWithImpl(this._self, this._then);

  final PostDetailFailure _self;
  final $Res Function(PostDetailFailure) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PostDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
