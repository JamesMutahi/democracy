// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [PostListState].
extension PostListStatePatterns on PostListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PostListInitial value)?  initial,TResult Function( PostListLoading value)?  loading,TResult Function( PostListLoaded value)?  loaded,TResult Function( PostListFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PostListInitial() when initial != null:
return initial(_that);case PostListLoading() when loading != null:
return loading(_that);case PostListLoaded() when loaded != null:
return loaded(_that);case PostListFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PostListInitial value)  initial,required TResult Function( PostListLoading value)  loading,required TResult Function( PostListLoaded value)  loaded,required TResult Function( PostListFailure value)  failure,}){
final _that = this;
switch (_that) {
case PostListInitial():
return initial(_that);case PostListLoading():
return loading(_that);case PostListLoaded():
return loaded(_that);case PostListFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PostListInitial value)?  initial,TResult? Function( PostListLoading value)?  loading,TResult? Function( PostListLoaded value)?  loaded,TResult? Function( PostListFailure value)?  failure,}){
final _that = this;
switch (_that) {
case PostListInitial() when initial != null:
return initial(_that);case PostListLoading() when loading != null:
return loading(_that);case PostListLoaded() when loaded != null:
return loaded(_that);case PostListFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Post> posts)?  loaded,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PostListInitial() when initial != null:
return initial();case PostListLoading() when loading != null:
return loading();case PostListLoaded() when loaded != null:
return loaded(_that.posts);case PostListFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Post> posts)  loaded,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case PostListInitial():
return initial();case PostListLoading():
return loading();case PostListLoaded():
return loaded(_that.posts);case PostListFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Post> posts)?  loaded,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case PostListInitial() when initial != null:
return initial();case PostListLoading() when loading != null:
return loading();case PostListLoaded() when loaded != null:
return loaded(_that.posts);case PostListFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

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
