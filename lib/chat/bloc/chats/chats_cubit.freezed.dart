// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsState()';
}


}

/// @nodoc
class $ChatsStateCopyWith<$Res>  {
$ChatsStateCopyWith(ChatsState _, $Res Function(ChatsState) __);
}


/// @nodoc


class ChatsInitial implements ChatsState {
  const ChatsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsState.initial()';
}


}




/// @nodoc


class ChatsLoading implements ChatsState {
  const ChatsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsState.loading()';
}


}




/// @nodoc


class ChatsLoaded implements ChatsState {
  const ChatsLoaded({required final  List<Chat> chats}): _chats = chats;
  

 final  List<Chat> _chats;
 List<Chat> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}


/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatsLoadedCopyWith<ChatsLoaded> get copyWith => _$ChatsLoadedCopyWithImpl<ChatsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsLoaded&&const DeepCollectionEquality().equals(other._chats, _chats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats));

@override
String toString() {
  return 'ChatsState.loaded(chats: $chats)';
}


}

/// @nodoc
abstract mixin class $ChatsLoadedCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory $ChatsLoadedCopyWith(ChatsLoaded value, $Res Function(ChatsLoaded) _then) = _$ChatsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Chat> chats
});




}
/// @nodoc
class _$ChatsLoadedCopyWithImpl<$Res>
    implements $ChatsLoadedCopyWith<$Res> {
  _$ChatsLoadedCopyWithImpl(this._self, this._then);

  final ChatsLoaded _self;
  final $Res Function(ChatsLoaded) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chats = null,}) {
  return _then(ChatsLoaded(
chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<Chat>,
  ));
}


}

/// @nodoc


class ChatsFailure implements ChatsState {
  const ChatsFailure({required this.error});
  

 final  String error;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatsFailureCopyWith<ChatsFailure> get copyWith => _$ChatsFailureCopyWithImpl<ChatsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ChatsState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ChatsFailureCopyWith<$Res> implements $ChatsStateCopyWith<$Res> {
  factory $ChatsFailureCopyWith(ChatsFailure value, $Res Function(ChatsFailure) _then) = _$ChatsFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ChatsFailureCopyWithImpl<$Res>
    implements $ChatsFailureCopyWith<$Res> {
  _$ChatsFailureCopyWithImpl(this._self, this._then);

  final ChatsFailure _self;
  final $Res Function(ChatsFailure) _then;

/// Create a copy of ChatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ChatsFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
