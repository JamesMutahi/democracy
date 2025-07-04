// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [ChatsState].
extension ChatsStatePatterns on ChatsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatsInitial value)?  initial,TResult Function( ChatsLoading value)?  loading,TResult Function( ChatsLoaded value)?  loaded,TResult Function( ChatsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatsInitial() when initial != null:
return initial(_that);case ChatsLoading() when loading != null:
return loading(_that);case ChatsLoaded() when loaded != null:
return loaded(_that);case ChatsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatsInitial value)  initial,required TResult Function( ChatsLoading value)  loading,required TResult Function( ChatsLoaded value)  loaded,required TResult Function( ChatsFailure value)  failure,}){
final _that = this;
switch (_that) {
case ChatsInitial():
return initial(_that);case ChatsLoading():
return loading(_that);case ChatsLoaded():
return loaded(_that);case ChatsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatsInitial value)?  initial,TResult? Function( ChatsLoading value)?  loading,TResult? Function( ChatsLoaded value)?  loaded,TResult? Function( ChatsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ChatsInitial() when initial != null:
return initial(_that);case ChatsLoading() when loading != null:
return loading(_that);case ChatsLoaded() when loaded != null:
return loaded(_that);case ChatsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Chat> chats)?  loaded,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatsInitial() when initial != null:
return initial();case ChatsLoading() when loading != null:
return loading();case ChatsLoaded() when loaded != null:
return loaded(_that.chats);case ChatsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Chat> chats)  loaded,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case ChatsInitial():
return initial();case ChatsLoading():
return loading();case ChatsLoaded():
return loaded(_that.chats);case ChatsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Chat> chats)?  loaded,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case ChatsInitial() when initial != null:
return initial();case ChatsLoading() when loading != null:
return loading();case ChatsLoaded() when loaded != null:
return loaded(_that.chats);case ChatsFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

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
