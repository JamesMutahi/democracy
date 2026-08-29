// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentDetailEvent()';
}


}

/// @nodoc
class $CommentDetailEventCopyWith<$Res>  {
$CommentDetailEventCopyWith(CommentDetailEvent _, $Res Function(CommentDetailEvent) __);
}


/// Adds pattern-matching-related methods to [CommentDetailEvent].
extension CommentDetailEventPatterns on CommentDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Created value)?  created,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,TResult Function( _Create value)?  create,TResult Function( _Delete value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Create() when create != null:
return create(_that);case _Delete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Created value)  created,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,required TResult Function( _Create value)  create,required TResult Function( _Delete value)  delete,}){
final _that = this;
switch (_that) {
case _Created():
return created(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);case _Create():
return create(_that);case _Delete():
return delete(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Created value)?  created,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Create value)?  create,TResult? Function( _Delete value)?  delete,}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Create() when create != null:
return create(_that);case _Delete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  deleted,TResult Function( int broadcastId,  String text)?  create,TResult Function( Comment comment)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.broadcastId,_that.text);case _Delete() when delete != null:
return delete(_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  deleted,required TResult Function( int broadcastId,  String text)  create,required TResult Function( Comment comment)  delete,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Updated():
return updated(_that.payload);case _Deleted():
return deleted(_that.payload);case _Create():
return create(_that.broadcastId,_that.text);case _Delete():
return delete(_that.comment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  deleted,TResult? Function( int broadcastId,  String text)?  create,TResult? Function( Comment comment)?  delete,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.broadcastId,_that.text);case _Delete() when delete != null:
return delete(_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements CommentDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'CommentDetailEvent.created(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $CommentDetailEventCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Created(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements CommentDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'CommentDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $CommentDetailEventCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Deleted implements CommentDetailEvent {
  const _Deleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'CommentDetailEvent.deleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $CommentDetailEventCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Create implements CommentDetailEvent {
  const _Create({required this.broadcastId, required this.text});
  

 final  int broadcastId;
 final  String text;

/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.broadcastId, broadcastId) || other.broadcastId == broadcastId)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,broadcastId,text);

@override
String toString() {
  return 'CommentDetailEvent.create(broadcastId: $broadcastId, text: $text)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $CommentDetailEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 int broadcastId, String text
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcastId = null,Object? text = null,}) {
  return _then(_Create(
broadcastId: null == broadcastId ? _self.broadcastId : broadcastId // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Delete implements CommentDetailEvent {
  const _Delete({required this.comment});
  

 final  Comment comment;

/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'CommentDetailEvent.delete(comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $CommentDetailEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 Comment comment
});


$CommentCopyWith<$Res> get comment;

}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of CommentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(_Delete(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as Comment,
  ));
}

/// Create a copy of CommentDetailEvent
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
mixin _$CommentDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentDetailState()';
}


}

/// @nodoc
class $CommentDetailStateCopyWith<$Res>  {
$CommentDetailStateCopyWith(CommentDetailState _, $Res Function(CommentDetailState) __);
}


/// Adds pattern-matching-related methods to [CommentDetailState].
extension CommentDetailStatePatterns on CommentDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CommentDetailInitial value)?  initial,TResult Function( CommentDetailLoading value)?  loading,TResult Function( CommentCreated value)?  created,TResult Function( CommentUpdated value)?  updated,TResult Function( CommentDeleted value)?  deleted,TResult Function( CommentDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CommentDetailInitial() when initial != null:
return initial(_that);case CommentDetailLoading() when loading != null:
return loading(_that);case CommentCreated() when created != null:
return created(_that);case CommentUpdated() when updated != null:
return updated(_that);case CommentDeleted() when deleted != null:
return deleted(_that);case CommentDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CommentDetailInitial value)  initial,required TResult Function( CommentDetailLoading value)  loading,required TResult Function( CommentCreated value)  created,required TResult Function( CommentUpdated value)  updated,required TResult Function( CommentDeleted value)  deleted,required TResult Function( CommentDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case CommentDetailInitial():
return initial(_that);case CommentDetailLoading():
return loading(_that);case CommentCreated():
return created(_that);case CommentUpdated():
return updated(_that);case CommentDeleted():
return deleted(_that);case CommentDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CommentDetailInitial value)?  initial,TResult? Function( CommentDetailLoading value)?  loading,TResult? Function( CommentCreated value)?  created,TResult? Function( CommentUpdated value)?  updated,TResult? Function( CommentDeleted value)?  deleted,TResult? Function( CommentDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CommentDetailInitial() when initial != null:
return initial(_that);case CommentDetailLoading() when loading != null:
return loading(_that);case CommentCreated() when created != null:
return created(_that);case CommentUpdated() when updated != null:
return updated(_that);case CommentDeleted() when deleted != null:
return deleted(_that);case CommentDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Comment comment)?  created,TResult Function( Comment comment)?  updated,TResult Function( int commentId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CommentDetailInitial() when initial != null:
return initial();case CommentDetailLoading() when loading != null:
return loading();case CommentCreated() when created != null:
return created(_that.comment);case CommentUpdated() when updated != null:
return updated(_that.comment);case CommentDeleted() when deleted != null:
return deleted(_that.commentId);case CommentDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Comment comment)  created,required TResult Function( Comment comment)  updated,required TResult Function( int commentId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case CommentDetailInitial():
return initial();case CommentDetailLoading():
return loading();case CommentCreated():
return created(_that.comment);case CommentUpdated():
return updated(_that.comment);case CommentDeleted():
return deleted(_that.commentId);case CommentDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Comment comment)?  created,TResult? Function( Comment comment)?  updated,TResult? Function( int commentId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case CommentDetailInitial() when initial != null:
return initial();case CommentDetailLoading() when loading != null:
return loading();case CommentCreated() when created != null:
return created(_that.comment);case CommentUpdated() when updated != null:
return updated(_that.comment);case CommentDeleted() when deleted != null:
return deleted(_that.commentId);case CommentDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class CommentDetailInitial implements CommentDetailState {
  const CommentDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentDetailState.initial()';
}


}




/// @nodoc


class CommentDetailLoading implements CommentDetailState {
  const CommentDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentDetailState.loading()';
}


}




/// @nodoc


class CommentCreated implements CommentDetailState {
  const CommentCreated({required this.comment});
  

 final  Comment comment;

/// Create a copy of CommentDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentCreatedCopyWith<CommentCreated> get copyWith => _$CommentCreatedCopyWithImpl<CommentCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentCreated&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'CommentDetailState.created(comment: $comment)';
}


}

/// @nodoc
abstract mixin class $CommentCreatedCopyWith<$Res> implements $CommentDetailStateCopyWith<$Res> {
  factory $CommentCreatedCopyWith(CommentCreated value, $Res Function(CommentCreated) _then) = _$CommentCreatedCopyWithImpl;
@useResult
$Res call({
 Comment comment
});


$CommentCopyWith<$Res> get comment;

}
/// @nodoc
class _$CommentCreatedCopyWithImpl<$Res>
    implements $CommentCreatedCopyWith<$Res> {
  _$CommentCreatedCopyWithImpl(this._self, this._then);

  final CommentCreated _self;
  final $Res Function(CommentCreated) _then;

/// Create a copy of CommentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(CommentCreated(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as Comment,
  ));
}

/// Create a copy of CommentDetailState
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


class CommentUpdated implements CommentDetailState {
  const CommentUpdated({required this.comment});
  

 final  Comment comment;

/// Create a copy of CommentDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentUpdatedCopyWith<CommentUpdated> get copyWith => _$CommentUpdatedCopyWithImpl<CommentUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentUpdated&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'CommentDetailState.updated(comment: $comment)';
}


}

/// @nodoc
abstract mixin class $CommentUpdatedCopyWith<$Res> implements $CommentDetailStateCopyWith<$Res> {
  factory $CommentUpdatedCopyWith(CommentUpdated value, $Res Function(CommentUpdated) _then) = _$CommentUpdatedCopyWithImpl;
@useResult
$Res call({
 Comment comment
});


$CommentCopyWith<$Res> get comment;

}
/// @nodoc
class _$CommentUpdatedCopyWithImpl<$Res>
    implements $CommentUpdatedCopyWith<$Res> {
  _$CommentUpdatedCopyWithImpl(this._self, this._then);

  final CommentUpdated _self;
  final $Res Function(CommentUpdated) _then;

/// Create a copy of CommentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(CommentUpdated(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as Comment,
  ));
}

/// Create a copy of CommentDetailState
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


class CommentDeleted implements CommentDetailState {
  const CommentDeleted({required this.commentId});
  

 final  int commentId;

/// Create a copy of CommentDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentDeletedCopyWith<CommentDeleted> get copyWith => _$CommentDeletedCopyWithImpl<CommentDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDeleted&&(identical(other.commentId, commentId) || other.commentId == commentId));
}


@override
int get hashCode => Object.hash(runtimeType,commentId);

@override
String toString() {
  return 'CommentDetailState.deleted(commentId: $commentId)';
}


}

/// @nodoc
abstract mixin class $CommentDeletedCopyWith<$Res> implements $CommentDetailStateCopyWith<$Res> {
  factory $CommentDeletedCopyWith(CommentDeleted value, $Res Function(CommentDeleted) _then) = _$CommentDeletedCopyWithImpl;
@useResult
$Res call({
 int commentId
});




}
/// @nodoc
class _$CommentDeletedCopyWithImpl<$Res>
    implements $CommentDeletedCopyWith<$Res> {
  _$CommentDeletedCopyWithImpl(this._self, this._then);

  final CommentDeleted _self;
  final $Res Function(CommentDeleted) _then;

/// Create a copy of CommentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commentId = null,}) {
  return _then(CommentDeleted(
commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CommentDetailFailure implements CommentDetailState {
  const CommentDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of CommentDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentDetailFailureCopyWith<CommentDetailFailure> get copyWith => _$CommentDetailFailureCopyWithImpl<CommentDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CommentDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $CommentDetailFailureCopyWith<$Res> implements $CommentDetailStateCopyWith<$Res> {
  factory $CommentDetailFailureCopyWith(CommentDetailFailure value, $Res Function(CommentDetailFailure) _then) = _$CommentDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$CommentDetailFailureCopyWithImpl<$Res>
    implements $CommentDetailFailureCopyWith<$Res> {
  _$CommentDetailFailureCopyWithImpl(this._self, this._then);

  final CommentDetailFailure _self;
  final $Res Function(CommentDetailFailure) _then;

/// Create a copy of CommentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CommentDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
