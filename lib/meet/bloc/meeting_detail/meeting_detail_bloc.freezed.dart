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

 Map<String, dynamic> get payload;
/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingDetailEventCopyWith<MeetingDetailEvent> get copyWith => _$MeetingDetailEventCopyWithImpl<MeetingDetailEvent>(this as MeetingDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailEvent&&const DeepCollectionEquality().equals(other.payload, payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'MeetingDetailEvent(payload: $payload)';
}


}

/// @nodoc
abstract mixin class $MeetingDetailEventCopyWith<$Res>  {
  factory $MeetingDetailEventCopyWith(MeetingDetailEvent value, $Res Function(MeetingDetailEvent) _then) = _$MeetingDetailEventCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class _$MeetingDetailEventCopyWithImpl<$Res>
    implements $MeetingDetailEventCopyWith<$Res> {
  _$MeetingDetailEventCopyWithImpl(this._self, this._then);

  final MeetingDetailEvent _self;
  final $Res Function(MeetingDetailEvent) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payload = null,}) {
  return _then(_self.copyWith(
payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Created value)?  created,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Created value)  created,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,}){
final _that = this;
switch (_that) {
case _Created():
return created(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Created value)?  created,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  deleted,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Updated():
return updated(_that.payload);case _Deleted():
return deleted(_that.payload);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  deleted,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements MeetingDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
@override Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
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
@override Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
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
@override Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MeetingDetailInitial value)?  initial,TResult Function( MeetingDetailLoading value)?  loading,TResult Function( MeetingCreated value)?  created,TResult Function( MeetingUpdated value)?  updated,TResult Function( MeetingDeleted value)?  deleted,TResult Function( MeetingDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial(_that);case MeetingDetailLoading() when loading != null:
return loading(_that);case MeetingCreated() when created != null:
return created(_that);case MeetingUpdated() when updated != null:
return updated(_that);case MeetingDeleted() when deleted != null:
return deleted(_that);case MeetingDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MeetingDetailInitial value)  initial,required TResult Function( MeetingDetailLoading value)  loading,required TResult Function( MeetingCreated value)  created,required TResult Function( MeetingUpdated value)  updated,required TResult Function( MeetingDeleted value)  deleted,required TResult Function( MeetingDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case MeetingDetailInitial():
return initial(_that);case MeetingDetailLoading():
return loading(_that);case MeetingCreated():
return created(_that);case MeetingUpdated():
return updated(_that);case MeetingDeleted():
return deleted(_that);case MeetingDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MeetingDetailInitial value)?  initial,TResult? Function( MeetingDetailLoading value)?  loading,TResult? Function( MeetingCreated value)?  created,TResult? Function( MeetingUpdated value)?  updated,TResult? Function( MeetingDeleted value)?  deleted,TResult? Function( MeetingDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial(_that);case MeetingDetailLoading() when loading != null:
return loading(_that);case MeetingCreated() when created != null:
return created(_that);case MeetingUpdated() when updated != null:
return updated(_that);case MeetingDeleted() when deleted != null:
return deleted(_that);case MeetingDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Meeting meeting)?  created,TResult Function( Meeting meeting)?  updated,TResult Function( int meetingId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial();case MeetingDetailLoading() when loading != null:
return loading();case MeetingCreated() when created != null:
return created(_that.meeting);case MeetingUpdated() when updated != null:
return updated(_that.meeting);case MeetingDeleted() when deleted != null:
return deleted(_that.meetingId);case MeetingDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Meeting meeting)  created,required TResult Function( Meeting meeting)  updated,required TResult Function( int meetingId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case MeetingDetailInitial():
return initial();case MeetingDetailLoading():
return loading();case MeetingCreated():
return created(_that.meeting);case MeetingUpdated():
return updated(_that.meeting);case MeetingDeleted():
return deleted(_that.meetingId);case MeetingDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Meeting meeting)?  created,TResult? Function( Meeting meeting)?  updated,TResult? Function( int meetingId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial();case MeetingDetailLoading() when loading != null:
return loading();case MeetingCreated() when created != null:
return created(_that.meeting);case MeetingUpdated() when updated != null:
return updated(_that.meeting);case MeetingDeleted() when deleted != null:
return deleted(_that.meetingId);case MeetingDetailFailure() when failure != null:
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
