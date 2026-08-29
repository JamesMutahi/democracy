// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentsEvent()';
}


}

/// @nodoc
class $CommentsEventCopyWith<$Res>  {
$CommentsEventCopyWith(CommentsEvent _, $Res Function(CommentsEvent) __);
}


/// Adds pattern-matching-related methods to [CommentsEvent].
extension CommentsEventPatterns on CommentsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,TResult Function( _Add value)?  add,TResult Function( _Update value)?  update,TResult Function( _Remove value)?  remove,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Add() when add != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,required TResult Function( _Add value)  add,required TResult Function( _Update value)  update,required TResult Function( _Remove value)  remove,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);case _Add():
return add(_that);case _Update():
return update(_that);case _Remove():
return remove(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,TResult? Function( _Add value)?  add,TResult? Function( _Update value)?  update,TResult? Function( _Remove value)?  remove,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Add() when add != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int broadcastId,  Comment? oldestComment,  Comment? newestComment)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( Comment comment)?  add,TResult Function( Comment comment)?  update,TResult Function( int commentId)?  remove,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.broadcastId,_that.oldestComment,_that.newestComment);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.comment);case _Update() when update != null:
return update(_that.comment);case _Remove() when remove != null:
return remove(_that.commentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int broadcastId,  Comment? oldestComment,  Comment? newestComment)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( Comment comment)  add,required TResult Function( Comment comment)  update,required TResult Function( int commentId)  remove,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.broadcastId,_that.oldestComment,_that.newestComment);case _Received():
return received(_that.payload);case _Add():
return add(_that.comment);case _Update():
return update(_that.comment);case _Remove():
return remove(_that.commentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int broadcastId,  Comment? oldestComment,  Comment? newestComment)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( Comment comment)?  add,TResult? Function( Comment comment)?  update,TResult? Function( int commentId)?  remove,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.broadcastId,_that.oldestComment,_that.newestComment);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.comment);case _Update() when update != null:
return update(_that.comment);case _Remove() when remove != null:
return remove(_that.commentId);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements CommentsEvent {
  const _Get({required this.broadcastId, this.oldestComment, this.newestComment});
  

 final  int broadcastId;
 final  Comment? oldestComment;
 final  Comment? newestComment;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.broadcastId, broadcastId) || other.broadcastId == broadcastId)&&(identical(other.oldestComment, oldestComment) || other.oldestComment == oldestComment)&&(identical(other.newestComment, newestComment) || other.newestComment == newestComment));
}


@override
int get hashCode => Object.hash(runtimeType,broadcastId,oldestComment,newestComment);

@override
String toString() {
  return 'CommentsEvent.get(broadcastId: $broadcastId, oldestComment: $oldestComment, newestComment: $newestComment)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $CommentsEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 int broadcastId, Comment? oldestComment, Comment? newestComment
});


$CommentCopyWith<$Res>? get oldestComment;$CommentCopyWith<$Res>? get newestComment;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcastId = null,Object? oldestComment = freezed,Object? newestComment = freezed,}) {
  return _then(_Get(
broadcastId: null == broadcastId ? _self.broadcastId : broadcastId // ignore: cast_nullable_to_non_nullable
as int,oldestComment: freezed == oldestComment ? _self.oldestComment : oldestComment // ignore: cast_nullable_to_non_nullable
as Comment?,newestComment: freezed == newestComment ? _self.newestComment : newestComment // ignore: cast_nullable_to_non_nullable
as Comment?,
  ));
}

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentCopyWith<$Res>? get oldestComment {
    if (_self.oldestComment == null) {
    return null;
  }

  return $CommentCopyWith<$Res>(_self.oldestComment!, (value) {
    return _then(_self.copyWith(oldestComment: value));
  });
}/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentCopyWith<$Res>? get newestComment {
    if (_self.newestComment == null) {
    return null;
  }

  return $CommentCopyWith<$Res>(_self.newestComment!, (value) {
    return _then(_self.copyWith(newestComment: value));
  });
}
}

/// @nodoc


class _Received implements CommentsEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceivedCopyWith<_Received> get copyWith => __$ReceivedCopyWithImpl<_Received>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Received&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'CommentsEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $CommentsEventCopyWith<$Res> {
  factory _$ReceivedCopyWith(_Received value, $Res Function(_Received) _then) = __$ReceivedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$ReceivedCopyWithImpl<$Res>
    implements _$ReceivedCopyWith<$Res> {
  __$ReceivedCopyWithImpl(this._self, this._then);

  final _Received _self;
  final $Res Function(_Received) _then;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Add implements CommentsEvent {
  const _Add({required this.comment});
  

 final  Comment comment;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCopyWith<_Add> get copyWith => __$AddCopyWithImpl<_Add>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Add&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'CommentsEvent.add(comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res> implements $CommentsEventCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) = __$AddCopyWithImpl;
@useResult
$Res call({
 Comment comment
});


$CommentCopyWith<$Res> get comment;

}
/// @nodoc
class __$AddCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(_Add(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as Comment,
  ));
}

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentCopyWith<$Res> get comment {
  
  return $CommentCopyWith<$Res>(_self.comment, (value) {
    return _then(_self.copyWith(comment: value));
  });
}
}

/// @nodoc


class _Update implements CommentsEvent {
  const _Update({required this.comment});
  

 final  Comment comment;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'CommentsEvent.update(comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $CommentsEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 Comment comment
});


$CommentCopyWith<$Res> get comment;

}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(_Update(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as Comment,
  ));
}

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentCopyWith<$Res> get comment {
  
  return $CommentCopyWith<$Res>(_self.comment, (value) {
    return _then(_self.copyWith(comment: value));
  });
}
}

/// @nodoc


class _Remove implements CommentsEvent {
  const _Remove({required this.commentId});
  

 final  int commentId;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCopyWith<_Remove> get copyWith => __$RemoveCopyWithImpl<_Remove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Remove&&(identical(other.commentId, commentId) || other.commentId == commentId));
}


@override
int get hashCode => Object.hash(runtimeType,commentId);

@override
String toString() {
  return 'CommentsEvent.remove(commentId: $commentId)';
}


}

/// @nodoc
abstract mixin class _$RemoveCopyWith<$Res> implements $CommentsEventCopyWith<$Res> {
  factory _$RemoveCopyWith(_Remove value, $Res Function(_Remove) _then) = __$RemoveCopyWithImpl;
@useResult
$Res call({
 int commentId
});




}
/// @nodoc
class __$RemoveCopyWithImpl<$Res>
    implements _$RemoveCopyWith<$Res> {
  __$RemoveCopyWithImpl(this._self, this._then);

  final _Remove _self;
  final $Res Function(_Remove) _then;

/// Create a copy of CommentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commentId = null,}) {
  return _then(_Remove(
commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
