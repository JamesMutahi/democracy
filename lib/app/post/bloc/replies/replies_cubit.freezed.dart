// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RepliesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepliesState()';
}


}

/// @nodoc
class $RepliesStateCopyWith<$Res>  {
$RepliesStateCopyWith(RepliesState _, $Res Function(RepliesState) __);
}


/// @nodoc


class RepliesInitial implements RepliesState {
  const RepliesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepliesState.initial()';
}


}




/// @nodoc


class RepliesLoading implements RepliesState {
  const RepliesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepliesState.loading()';
}


}




/// @nodoc


class RepliesLoaded implements RepliesState {
  const RepliesLoaded({required final  List<Post> posts}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of RepliesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepliesLoadedCopyWith<RepliesLoaded> get copyWith => _$RepliesLoadedCopyWithImpl<RepliesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesLoaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'RepliesState.loaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $RepliesLoadedCopyWith<$Res> implements $RepliesStateCopyWith<$Res> {
  factory $RepliesLoadedCopyWith(RepliesLoaded value, $Res Function(RepliesLoaded) _then) = _$RepliesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$RepliesLoadedCopyWithImpl<$Res>
    implements $RepliesLoadedCopyWith<$Res> {
  _$RepliesLoadedCopyWithImpl(this._self, this._then);

  final RepliesLoaded _self;
  final $Res Function(RepliesLoaded) _then;

/// Create a copy of RepliesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(RepliesLoaded(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class RepliesFailure implements RepliesState {
  const RepliesFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepliesState.failure()';
}


}




// dart format on
