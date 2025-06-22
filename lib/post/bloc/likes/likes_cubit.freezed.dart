// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'likes_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LikesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikesState()';
}


}

/// @nodoc
class $LikesStateCopyWith<$Res>  {
$LikesStateCopyWith(LikesState _, $Res Function(LikesState) __);
}


/// @nodoc


class LikesInitial implements LikesState {
  const LikesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikesState.initial()';
}


}




/// @nodoc


class LikesLoading implements LikesState {
  const LikesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikesState.loading()';
}


}




/// @nodoc


class LikesLoaded implements LikesState {
  const LikesLoaded({required final  List<Post> posts}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of LikesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikesLoadedCopyWith<LikesLoaded> get copyWith => _$LikesLoadedCopyWithImpl<LikesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesLoaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'LikesState.loaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $LikesLoadedCopyWith<$Res> implements $LikesStateCopyWith<$Res> {
  factory $LikesLoadedCopyWith(LikesLoaded value, $Res Function(LikesLoaded) _then) = _$LikesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$LikesLoadedCopyWithImpl<$Res>
    implements $LikesLoadedCopyWith<$Res> {
  _$LikesLoadedCopyWithImpl(this._self, this._then);

  final LikesLoaded _self;
  final $Res Function(LikesLoaded) _then;

/// Create a copy of LikesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(LikesLoaded(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class LikesFailure implements LikesState {
  const LikesFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikesFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikesState.failure()';
}


}




// dart format on
