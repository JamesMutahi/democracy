// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmarks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookmarksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookmarksState()';
}


}

/// @nodoc
class $BookmarksStateCopyWith<$Res>  {
$BookmarksStateCopyWith(BookmarksState _, $Res Function(BookmarksState) __);
}


/// Adds pattern-matching-related methods to [BookmarksState].
extension BookmarksStatePatterns on BookmarksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookmarksInitial value)?  initial,TResult Function( BookmarksLoading value)?  loading,TResult Function( BookmarksLoaded value)?  loaded,TResult Function( BookmarksFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookmarksInitial() when initial != null:
return initial(_that);case BookmarksLoading() when loading != null:
return loading(_that);case BookmarksLoaded() when loaded != null:
return loaded(_that);case BookmarksFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookmarksInitial value)  initial,required TResult Function( BookmarksLoading value)  loading,required TResult Function( BookmarksLoaded value)  loaded,required TResult Function( BookmarksFailure value)  failure,}){
final _that = this;
switch (_that) {
case BookmarksInitial():
return initial(_that);case BookmarksLoading():
return loading(_that);case BookmarksLoaded():
return loaded(_that);case BookmarksFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookmarksInitial value)?  initial,TResult? Function( BookmarksLoading value)?  loading,TResult? Function( BookmarksLoaded value)?  loaded,TResult? Function( BookmarksFailure value)?  failure,}){
final _that = this;
switch (_that) {
case BookmarksInitial() when initial != null:
return initial(_that);case BookmarksLoading() when loading != null:
return loading(_that);case BookmarksLoaded() when loaded != null:
return loaded(_that);case BookmarksFailure() when failure != null:
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
case BookmarksInitial() when initial != null:
return initial();case BookmarksLoading() when loading != null:
return loading();case BookmarksLoaded() when loaded != null:
return loaded(_that.posts);case BookmarksFailure() when failure != null:
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
case BookmarksInitial():
return initial();case BookmarksLoading():
return loading();case BookmarksLoaded():
return loaded(_that.posts);case BookmarksFailure():
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
case BookmarksInitial() when initial != null:
return initial();case BookmarksLoading() when loading != null:
return loading();case BookmarksLoaded() when loaded != null:
return loaded(_that.posts);case BookmarksFailure() when failure != null:
return failure();case _:
  return null;

}
}

}

/// @nodoc


class BookmarksInitial implements BookmarksState {
  const BookmarksInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarksInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookmarksState.initial()';
}


}




/// @nodoc


class BookmarksLoading implements BookmarksState {
  const BookmarksLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarksLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookmarksState.loading()';
}


}




/// @nodoc


class BookmarksLoaded implements BookmarksState {
  const BookmarksLoaded({required final  List<Post> posts}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of BookmarksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarksLoadedCopyWith<BookmarksLoaded> get copyWith => _$BookmarksLoadedCopyWithImpl<BookmarksLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarksLoaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'BookmarksState.loaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $BookmarksLoadedCopyWith<$Res> implements $BookmarksStateCopyWith<$Res> {
  factory $BookmarksLoadedCopyWith(BookmarksLoaded value, $Res Function(BookmarksLoaded) _then) = _$BookmarksLoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$BookmarksLoadedCopyWithImpl<$Res>
    implements $BookmarksLoadedCopyWith<$Res> {
  _$BookmarksLoadedCopyWithImpl(this._self, this._then);

  final BookmarksLoaded _self;
  final $Res Function(BookmarksLoaded) _then;

/// Create a copy of BookmarksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(BookmarksLoaded(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class BookmarksFailure implements BookmarksState {
  const BookmarksFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarksFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookmarksState.failure()';
}


}




// dart format on
