// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [PostDetailState].
extension PostDetailStatePatterns on PostDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PostDetailLoading value)?  loading,TResult Function( PostCreated value)?  created,TResult Function( PostUpdated value)?  updated,TResult Function( PostDeleted value)?  deleted,TResult Function( PostReported value)?  reported,TResult Function( PostDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PostDetailLoading() when loading != null:
return loading(_that);case PostCreated() when created != null:
return created(_that);case PostUpdated() when updated != null:
return updated(_that);case PostDeleted() when deleted != null:
return deleted(_that);case PostReported() when reported != null:
return reported(_that);case PostDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PostDetailLoading value)  loading,required TResult Function( PostCreated value)  created,required TResult Function( PostUpdated value)  updated,required TResult Function( PostDeleted value)  deleted,required TResult Function( PostReported value)  reported,required TResult Function( PostDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PostDetailLoading():
return loading(_that);case PostCreated():
return created(_that);case PostUpdated():
return updated(_that);case PostDeleted():
return deleted(_that);case PostReported():
return reported(_that);case PostDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PostDetailLoading value)?  loading,TResult? Function( PostCreated value)?  created,TResult? Function( PostUpdated value)?  updated,TResult? Function( PostDeleted value)?  deleted,TResult? Function( PostReported value)?  reported,TResult? Function( PostDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PostDetailLoading() when loading != null:
return loading(_that);case PostCreated() when created != null:
return created(_that);case PostUpdated() when updated != null:
return updated(_that);case PostDeleted() when deleted != null:
return deleted(_that);case PostReported() when reported != null:
return reported(_that);case PostDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Post post)?  created,TResult Function( Post post)?  updated,TResult Function( Post post)?  deleted,TResult Function()?  reported,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PostDetailLoading() when loading != null:
return loading();case PostCreated() when created != null:
return created(_that.post);case PostUpdated() when updated != null:
return updated(_that.post);case PostDeleted() when deleted != null:
return deleted(_that.post);case PostReported() when reported != null:
return reported();case PostDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Post post)  created,required TResult Function( Post post)  updated,required TResult Function( Post post)  deleted,required TResult Function()  reported,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case PostDetailLoading():
return loading();case PostCreated():
return created(_that.post);case PostUpdated():
return updated(_that.post);case PostDeleted():
return deleted(_that.post);case PostReported():
return reported();case PostDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Post post)?  created,TResult? Function( Post post)?  updated,TResult? Function( Post post)?  deleted,TResult? Function()?  reported,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PostDetailLoading() when loading != null:
return loading();case PostCreated() when created != null:
return created(_that.post);case PostUpdated() when updated != null:
return updated(_that.post);case PostDeleted() when deleted != null:
return deleted(_that.post);case PostReported() when reported != null:
return reported();case PostDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

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


class PostDeleted implements PostDetailState {
  const PostDeleted({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDeletedCopyWith<PostDeleted> get copyWith => _$PostDeletedCopyWithImpl<PostDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDeleted&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailState.deleted(post: $post)';
}


}

/// @nodoc
abstract mixin class $PostDeletedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostDeletedCopyWith(PostDeleted value, $Res Function(PostDeleted) _then) = _$PostDeletedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostDeletedCopyWithImpl<$Res>
    implements $PostDeletedCopyWith<$Res> {
  _$PostDeletedCopyWithImpl(this._self, this._then);

  final PostDeleted _self;
  final $Res Function(PostDeleted) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(PostDeleted(
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
