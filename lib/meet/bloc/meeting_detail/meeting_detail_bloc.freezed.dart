// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeetingDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingDetailEvent()';
}


}

/// @nodoc
class $MeetingDetailEventCopyWith<$Res>  {
$MeetingDetailEventCopyWith(MeetingDetailEvent _, $Res Function(MeetingDetailEvent) __);
}


/// Adds pattern-matching-related methods to [MeetingDetailEvent].
extension MeetingDetailEventPatterns on MeetingDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Created value)?  created,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,TResult Function( _Join value)?  join,TResult Function( _Joined value)?  joined,TResult Function( _Leave value)?  leave,TResult Function( _Left value)?  left,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Join() when join != null:
return join(_that);case _Joined() when joined != null:
return joined(_that);case _Leave() when leave != null:
return leave(_that);case _Left() when left != null:
return left(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Created value)  created,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,required TResult Function( _Join value)  join,required TResult Function( _Joined value)  joined,required TResult Function( _Leave value)  leave,required TResult Function( _Left value)  left,}){
final _that = this;
switch (_that) {
case _Created():
return created(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);case _Join():
return join(_that);case _Joined():
return joined(_that);case _Leave():
return leave(_that);case _Left():
return left(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Created value)?  created,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Join value)?  join,TResult? Function( _Joined value)?  joined,TResult? Function( _Leave value)?  leave,TResult? Function( _Left value)?  left,}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Join() when join != null:
return join(_that);case _Joined() when joined != null:
return joined(_that);case _Leave() when leave != null:
return leave(_that);case _Left() when left != null:
return left(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  deleted,TResult Function( Meeting meeting)?  join,TResult Function( Map<String, dynamic> payload)?  joined,TResult Function( Meeting meeting)?  leave,TResult Function( Map<String, dynamic> payload)?  left,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Join() when join != null:
return join(_that.meeting);case _Joined() when joined != null:
return joined(_that.payload);case _Leave() when leave != null:
return leave(_that.meeting);case _Left() when left != null:
return left(_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  deleted,required TResult Function( Meeting meeting)  join,required TResult Function( Map<String, dynamic> payload)  joined,required TResult Function( Meeting meeting)  leave,required TResult Function( Map<String, dynamic> payload)  left,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Updated():
return updated(_that.payload);case _Deleted():
return deleted(_that.payload);case _Join():
return join(_that.meeting);case _Joined():
return joined(_that.payload);case _Leave():
return leave(_that.meeting);case _Left():
return left(_that.payload);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  deleted,TResult? Function( Meeting meeting)?  join,TResult? Function( Map<String, dynamic> payload)?  joined,TResult? Function( Meeting meeting)?  leave,TResult? Function( Map<String, dynamic> payload)?  left,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Join() when join != null:
return join(_that.meeting);case _Joined() when joined != null:
return joined(_that.payload);case _Leave() when leave != null:
return leave(_that.meeting);case _Left() when left != null:
return left(_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements MeetingDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
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
  return 'MeetingDetailEvent.created(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
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

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Created(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements MeetingDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
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
  return 'MeetingDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
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

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Deleted implements MeetingDetailEvent {
  const _Deleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
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
  return 'MeetingDetailEvent.deleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
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

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Join implements MeetingDetailEvent {
  const _Join({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinCopyWith<_Join> get copyWith => __$JoinCopyWithImpl<_Join>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Join&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailEvent.join(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class _$JoinCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
  factory _$JoinCopyWith(_Join value, $Res Function(_Join) _then) = __$JoinCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class __$JoinCopyWithImpl<$Res>
    implements _$JoinCopyWith<$Res> {
  __$JoinCopyWithImpl(this._self, this._then);

  final _Join _self;
  final $Res Function(_Join) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(_Join(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res> get meeting {
  
  return $MeetingCopyWith<$Res>(_self.meeting, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}
}

/// @nodoc


class _Joined implements MeetingDetailEvent {
  const _Joined({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinedCopyWith<_Joined> get copyWith => __$JoinedCopyWithImpl<_Joined>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Joined&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'MeetingDetailEvent.joined(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$JoinedCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
  factory _$JoinedCopyWith(_Joined value, $Res Function(_Joined) _then) = __$JoinedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$JoinedCopyWithImpl<$Res>
    implements _$JoinedCopyWith<$Res> {
  __$JoinedCopyWithImpl(this._self, this._then);

  final _Joined _self;
  final $Res Function(_Joined) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Joined(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Leave implements MeetingDetailEvent {
  const _Leave({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveCopyWith<_Leave> get copyWith => __$LeaveCopyWithImpl<_Leave>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Leave&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailEvent.leave(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class _$LeaveCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
  factory _$LeaveCopyWith(_Leave value, $Res Function(_Leave) _then) = __$LeaveCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class __$LeaveCopyWithImpl<$Res>
    implements _$LeaveCopyWith<$Res> {
  __$LeaveCopyWithImpl(this._self, this._then);

  final _Leave _self;
  final $Res Function(_Leave) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(_Leave(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res> get meeting {
  
  return $MeetingCopyWith<$Res>(_self.meeting, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}
}

/// @nodoc


class _Left implements MeetingDetailEvent {
  const _Left({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeftCopyWith<_Left> get copyWith => __$LeftCopyWithImpl<_Left>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Left&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'MeetingDetailEvent.left(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LeftCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
  factory _$LeftCopyWith(_Left value, $Res Function(_Left) _then) = __$LeftCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$LeftCopyWithImpl<$Res>
    implements _$LeftCopyWith<$Res> {
  __$LeftCopyWithImpl(this._self, this._then);

  final _Left _self;
  final $Res Function(_Left) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Left(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$MeetingDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingDetailState()';
}


}

/// @nodoc
class $MeetingDetailStateCopyWith<$Res>  {
$MeetingDetailStateCopyWith(MeetingDetailState _, $Res Function(MeetingDetailState) __);
}


/// Adds pattern-matching-related methods to [MeetingDetailState].
extension MeetingDetailStatePatterns on MeetingDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MeetingDetailInitial value)?  initial,TResult Function( MeetingDetailLoading value)?  loading,TResult Function( MeetingCreated value)?  created,TResult Function( MeetingUpdated value)?  updated,TResult Function( MeetingDeleted value)?  deleted,TResult Function( MeetingJoined value)?  joined,TResult Function( MeetingLeft value)?  left,TResult Function( MeetingDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial(_that);case MeetingDetailLoading() when loading != null:
return loading(_that);case MeetingCreated() when created != null:
return created(_that);case MeetingUpdated() when updated != null:
return updated(_that);case MeetingDeleted() when deleted != null:
return deleted(_that);case MeetingJoined() when joined != null:
return joined(_that);case MeetingLeft() when left != null:
return left(_that);case MeetingDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MeetingDetailInitial value)  initial,required TResult Function( MeetingDetailLoading value)  loading,required TResult Function( MeetingCreated value)  created,required TResult Function( MeetingUpdated value)  updated,required TResult Function( MeetingDeleted value)  deleted,required TResult Function( MeetingJoined value)  joined,required TResult Function( MeetingLeft value)  left,required TResult Function( MeetingDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case MeetingDetailInitial():
return initial(_that);case MeetingDetailLoading():
return loading(_that);case MeetingCreated():
return created(_that);case MeetingUpdated():
return updated(_that);case MeetingDeleted():
return deleted(_that);case MeetingJoined():
return joined(_that);case MeetingLeft():
return left(_that);case MeetingDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MeetingDetailInitial value)?  initial,TResult? Function( MeetingDetailLoading value)?  loading,TResult? Function( MeetingCreated value)?  created,TResult? Function( MeetingUpdated value)?  updated,TResult? Function( MeetingDeleted value)?  deleted,TResult? Function( MeetingJoined value)?  joined,TResult? Function( MeetingLeft value)?  left,TResult? Function( MeetingDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial(_that);case MeetingDetailLoading() when loading != null:
return loading(_that);case MeetingCreated() when created != null:
return created(_that);case MeetingUpdated() when updated != null:
return updated(_that);case MeetingDeleted() when deleted != null:
return deleted(_that);case MeetingJoined() when joined != null:
return joined(_that);case MeetingLeft() when left != null:
return left(_that);case MeetingDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Meeting meeting)?  created,TResult Function( Meeting meeting)?  updated,TResult Function( int meetingId)?  deleted,TResult Function( int meetingId)?  joined,TResult Function( int meetingId)?  left,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial();case MeetingDetailLoading() when loading != null:
return loading();case MeetingCreated() when created != null:
return created(_that.meeting);case MeetingUpdated() when updated != null:
return updated(_that.meeting);case MeetingDeleted() when deleted != null:
return deleted(_that.meetingId);case MeetingJoined() when joined != null:
return joined(_that.meetingId);case MeetingLeft() when left != null:
return left(_that.meetingId);case MeetingDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Meeting meeting)  created,required TResult Function( Meeting meeting)  updated,required TResult Function( int meetingId)  deleted,required TResult Function( int meetingId)  joined,required TResult Function( int meetingId)  left,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case MeetingDetailInitial():
return initial();case MeetingDetailLoading():
return loading();case MeetingCreated():
return created(_that.meeting);case MeetingUpdated():
return updated(_that.meeting);case MeetingDeleted():
return deleted(_that.meetingId);case MeetingJoined():
return joined(_that.meetingId);case MeetingLeft():
return left(_that.meetingId);case MeetingDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Meeting meeting)?  created,TResult? Function( Meeting meeting)?  updated,TResult? Function( int meetingId)?  deleted,TResult? Function( int meetingId)?  joined,TResult? Function( int meetingId)?  left,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial();case MeetingDetailLoading() when loading != null:
return loading();case MeetingCreated() when created != null:
return created(_that.meeting);case MeetingUpdated() when updated != null:
return updated(_that.meeting);case MeetingDeleted() when deleted != null:
return deleted(_that.meetingId);case MeetingJoined() when joined != null:
return joined(_that.meetingId);case MeetingLeft() when left != null:
return left(_that.meetingId);case MeetingDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class MeetingDetailInitial implements MeetingDetailState {
  const MeetingDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingDetailState.initial()';
}


}




/// @nodoc


class MeetingDetailLoading implements MeetingDetailState {
  const MeetingDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingDetailState.loading()';
}


}




/// @nodoc


class MeetingCreated implements MeetingDetailState {
  const MeetingCreated({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingCreatedCopyWith<MeetingCreated> get copyWith => _$MeetingCreatedCopyWithImpl<MeetingCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingCreated&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailState.created(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class $MeetingCreatedCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingCreatedCopyWith(MeetingCreated value, $Res Function(MeetingCreated) _then) = _$MeetingCreatedCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class _$MeetingCreatedCopyWithImpl<$Res>
    implements $MeetingCreatedCopyWith<$Res> {
  _$MeetingCreatedCopyWithImpl(this._self, this._then);

  final MeetingCreated _self;
  final $Res Function(MeetingCreated) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(MeetingCreated(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res> get meeting {
  
  return $MeetingCopyWith<$Res>(_self.meeting, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}
}

/// @nodoc


class MeetingUpdated implements MeetingDetailState {
  const MeetingUpdated({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingUpdatedCopyWith<MeetingUpdated> get copyWith => _$MeetingUpdatedCopyWithImpl<MeetingUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingUpdated&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailState.updated(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class $MeetingUpdatedCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingUpdatedCopyWith(MeetingUpdated value, $Res Function(MeetingUpdated) _then) = _$MeetingUpdatedCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class _$MeetingUpdatedCopyWithImpl<$Res>
    implements $MeetingUpdatedCopyWith<$Res> {
  _$MeetingUpdatedCopyWithImpl(this._self, this._then);

  final MeetingUpdated _self;
  final $Res Function(MeetingUpdated) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(MeetingUpdated(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res> get meeting {
  
  return $MeetingCopyWith<$Res>(_self.meeting, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}
}

/// @nodoc


class MeetingDeleted implements MeetingDetailState {
  const MeetingDeleted({required this.meetingId});
  

 final  int meetingId;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingDeletedCopyWith<MeetingDeleted> get copyWith => _$MeetingDeletedCopyWithImpl<MeetingDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDeleted&&(identical(other.meetingId, meetingId) || other.meetingId == meetingId));
}


@override
int get hashCode => Object.hash(runtimeType,meetingId);

@override
String toString() {
  return 'MeetingDetailState.deleted(meetingId: $meetingId)';
}


}

/// @nodoc
abstract mixin class $MeetingDeletedCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingDeletedCopyWith(MeetingDeleted value, $Res Function(MeetingDeleted) _then) = _$MeetingDeletedCopyWithImpl;
@useResult
$Res call({
 int meetingId
});




}
/// @nodoc
class _$MeetingDeletedCopyWithImpl<$Res>
    implements $MeetingDeletedCopyWith<$Res> {
  _$MeetingDeletedCopyWithImpl(this._self, this._then);

  final MeetingDeleted _self;
  final $Res Function(MeetingDeleted) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meetingId = null,}) {
  return _then(MeetingDeleted(
meetingId: null == meetingId ? _self.meetingId : meetingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MeetingJoined implements MeetingDetailState {
  const MeetingJoined({required this.meetingId});
  

 final  int meetingId;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingJoinedCopyWith<MeetingJoined> get copyWith => _$MeetingJoinedCopyWithImpl<MeetingJoined>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingJoined&&(identical(other.meetingId, meetingId) || other.meetingId == meetingId));
}


@override
int get hashCode => Object.hash(runtimeType,meetingId);

@override
String toString() {
  return 'MeetingDetailState.joined(meetingId: $meetingId)';
}


}

/// @nodoc
abstract mixin class $MeetingJoinedCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingJoinedCopyWith(MeetingJoined value, $Res Function(MeetingJoined) _then) = _$MeetingJoinedCopyWithImpl;
@useResult
$Res call({
 int meetingId
});




}
/// @nodoc
class _$MeetingJoinedCopyWithImpl<$Res>
    implements $MeetingJoinedCopyWith<$Res> {
  _$MeetingJoinedCopyWithImpl(this._self, this._then);

  final MeetingJoined _self;
  final $Res Function(MeetingJoined) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meetingId = null,}) {
  return _then(MeetingJoined(
meetingId: null == meetingId ? _self.meetingId : meetingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MeetingLeft implements MeetingDetailState {
  const MeetingLeft({required this.meetingId});
  

 final  int meetingId;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingLeftCopyWith<MeetingLeft> get copyWith => _$MeetingLeftCopyWithImpl<MeetingLeft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingLeft&&(identical(other.meetingId, meetingId) || other.meetingId == meetingId));
}


@override
int get hashCode => Object.hash(runtimeType,meetingId);

@override
String toString() {
  return 'MeetingDetailState.left(meetingId: $meetingId)';
}


}

/// @nodoc
abstract mixin class $MeetingLeftCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingLeftCopyWith(MeetingLeft value, $Res Function(MeetingLeft) _then) = _$MeetingLeftCopyWithImpl;
@useResult
$Res call({
 int meetingId
});




}
/// @nodoc
class _$MeetingLeftCopyWithImpl<$Res>
    implements $MeetingLeftCopyWith<$Res> {
  _$MeetingLeftCopyWithImpl(this._self, this._then);

  final MeetingLeft _self;
  final $Res Function(MeetingLeft) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meetingId = null,}) {
  return _then(MeetingLeft(
meetingId: null == meetingId ? _self.meetingId : meetingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MeetingDetailFailure implements MeetingDetailState {
  const MeetingDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingDetailFailureCopyWith<MeetingDetailFailure> get copyWith => _$MeetingDetailFailureCopyWithImpl<MeetingDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MeetingDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $MeetingDetailFailureCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingDetailFailureCopyWith(MeetingDetailFailure value, $Res Function(MeetingDetailFailure) _then) = _$MeetingDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$MeetingDetailFailureCopyWithImpl<$Res>
    implements $MeetingDetailFailureCopyWith<$Res> {
  _$MeetingDetailFailureCopyWithImpl(this._self, this._then);

  final MeetingDetailFailure _self;
  final $Res Function(MeetingDetailFailure) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(MeetingDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
