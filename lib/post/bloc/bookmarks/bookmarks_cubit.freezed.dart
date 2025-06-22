// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
