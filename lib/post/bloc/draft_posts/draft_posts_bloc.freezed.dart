// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_posts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DraftPostsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftPostsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DraftPostsEvent()';
}


}

/// @nodoc
class $DraftPostsEventCopyWith<$Res>  {
$DraftPostsEventCopyWith(DraftPostsEvent _, $Res Function(DraftPostsEvent) __);
}


/// Adds pattern-matching-related methods to [DraftPostsEvent].
extension DraftPostsEventPatterns on DraftPostsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Add value)?  add,TResult Function( _Update value)?  update,TResult Function( _Remove value)?  remove,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Add() when add != null:
return add(_that);case _Update() when update != null:
return update(_that);case _Remove() when remove != null:
return remove(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Add value)  add,required TResult Function( _Update value)  update,required TResult Function( _Remove value)  remove,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Add():
return add(_that);case _Update():
return update(_that);case _Remove():
return remove(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Add value)?  add,TResult? Function( _Update value)?  update,TResult? Function( _Remove value)?  remove,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Add() when add != null:
return add(_that);case _Update() when update != null:
return update(_that);case _Remove() when remove != null:
return remove(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  get,TResult Function( DraftPost draft)?  add,TResult Function( DraftPost draft)?  update,TResult Function( int id)?  remove,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get();case _Add() when add != null:
return add(_that.draft);case _Update() when update != null:
return update(_that.draft);case _Remove() when remove != null:
return remove(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  get,required TResult Function( DraftPost draft)  add,required TResult Function( DraftPost draft)  update,required TResult Function( int id)  remove,}) {final _that = this;
switch (_that) {
case _Get():
return get();case _Add():
return add(_that.draft);case _Update():
return update(_that.draft);case _Remove():
return remove(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  get,TResult? Function( DraftPost draft)?  add,TResult? Function( DraftPost draft)?  update,TResult? Function( int id)?  remove,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get();case _Add() when add != null:
return add(_that.draft);case _Update() when update != null:
return update(_that.draft);case _Remove() when remove != null:
return remove(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements DraftPostsEvent {
  const _Get();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DraftPostsEvent.get()';
}


}




/// @nodoc


class _Add implements DraftPostsEvent {
  const _Add({required this.draft});
  

 final  DraftPost draft;

/// Create a copy of DraftPostsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCopyWith<_Add> get copyWith => __$AddCopyWithImpl<_Add>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Add&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'DraftPostsEvent.add(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res> implements $DraftPostsEventCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) = __$AddCopyWithImpl;
@useResult
$Res call({
 DraftPost draft
});




}
/// @nodoc
class __$AddCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

/// Create a copy of DraftPostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Add(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftPost,
  ));
}


}

/// @nodoc


class _Update implements DraftPostsEvent {
  const _Update({required this.draft});
  

 final  DraftPost draft;

/// Create a copy of DraftPostsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'DraftPostsEvent.update(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $DraftPostsEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 DraftPost draft
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of DraftPostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Update(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftPost,
  ));
}


}

/// @nodoc


class _Remove implements DraftPostsEvent {
  const _Remove({required this.id});
  

 final  int id;

/// Create a copy of DraftPostsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCopyWith<_Remove> get copyWith => __$RemoveCopyWithImpl<_Remove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Remove&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DraftPostsEvent.remove(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RemoveCopyWith<$Res> implements $DraftPostsEventCopyWith<$Res> {
  factory _$RemoveCopyWith(_Remove value, $Res Function(_Remove) _then) = __$RemoveCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$RemoveCopyWithImpl<$Res>
    implements _$RemoveCopyWith<$Res> {
  __$RemoveCopyWithImpl(this._self, this._then);

  final _Remove _self;
  final $Res Function(_Remove) _then;

/// Create a copy of DraftPostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Remove(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
