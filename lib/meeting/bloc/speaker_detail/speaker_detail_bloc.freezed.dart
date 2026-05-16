// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speaker_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpeakerDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpeakerDetailEvent()';
}


}

/// @nodoc
class $SpeakerDetailEventCopyWith<$Res>  {
$SpeakerDetailEventCopyWith(SpeakerDetailEvent _, $Res Function(SpeakerDetailEvent) __);
}


/// Adds pattern-matching-related methods to [SpeakerDetailEvent].
extension SpeakerDetailEventPatterns on SpeakerDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RequestCreated value)?  requestCreated,TResult Function( _RequestLoaded value)?  requestLoaded,TResult Function( _RequestUpdated value)?  requestUpdated,TResult Function( _RequestDeleted value)?  requestDeleted,TResult Function( RequestToSpeak value)?  requestToSpeak,TResult Function( _RequestToSpeakCompleted value)?  requestToSpeakReceived,TResult Function( HandleSpeakerRequest value)?  handleSpeakerRequest,TResult Function( SpeakerRequestReceived value)?  speakerRequestReceived,TResult Function( SpeakerDecisionReceived value)?  speakerDecisionReceived,TResult Function( ChangeMuteStatus value)?  changeMuteStatus,TResult Function( _MuteStatusReceived value)?  muteStatusReceived,TResult Function( MuteSpeaker value)?  muteSpeaker,TResult Function( _MuteCommandReceived value)?  muteCommandReceived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestCreated() when requestCreated != null:
return requestCreated(_that);case _RequestLoaded() when requestLoaded != null:
return requestLoaded(_that);case _RequestUpdated() when requestUpdated != null:
return requestUpdated(_that);case _RequestDeleted() when requestDeleted != null:
return requestDeleted(_that);case RequestToSpeak() when requestToSpeak != null:
return requestToSpeak(_that);case _RequestToSpeakCompleted() when requestToSpeakReceived != null:
return requestToSpeakReceived(_that);case HandleSpeakerRequest() when handleSpeakerRequest != null:
return handleSpeakerRequest(_that);case SpeakerRequestReceived() when speakerRequestReceived != null:
return speakerRequestReceived(_that);case SpeakerDecisionReceived() when speakerDecisionReceived != null:
return speakerDecisionReceived(_that);case ChangeMuteStatus() when changeMuteStatus != null:
return changeMuteStatus(_that);case _MuteStatusReceived() when muteStatusReceived != null:
return muteStatusReceived(_that);case MuteSpeaker() when muteSpeaker != null:
return muteSpeaker(_that);case _MuteCommandReceived() when muteCommandReceived != null:
return muteCommandReceived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RequestCreated value)  requestCreated,required TResult Function( _RequestLoaded value)  requestLoaded,required TResult Function( _RequestUpdated value)  requestUpdated,required TResult Function( _RequestDeleted value)  requestDeleted,required TResult Function( RequestToSpeak value)  requestToSpeak,required TResult Function( _RequestToSpeakCompleted value)  requestToSpeakReceived,required TResult Function( HandleSpeakerRequest value)  handleSpeakerRequest,required TResult Function( SpeakerRequestReceived value)  speakerRequestReceived,required TResult Function( SpeakerDecisionReceived value)  speakerDecisionReceived,required TResult Function( ChangeMuteStatus value)  changeMuteStatus,required TResult Function( _MuteStatusReceived value)  muteStatusReceived,required TResult Function( MuteSpeaker value)  muteSpeaker,required TResult Function( _MuteCommandReceived value)  muteCommandReceived,}){
final _that = this;
switch (_that) {
case _RequestCreated():
return requestCreated(_that);case _RequestLoaded():
return requestLoaded(_that);case _RequestUpdated():
return requestUpdated(_that);case _RequestDeleted():
return requestDeleted(_that);case RequestToSpeak():
return requestToSpeak(_that);case _RequestToSpeakCompleted():
return requestToSpeakReceived(_that);case HandleSpeakerRequest():
return handleSpeakerRequest(_that);case SpeakerRequestReceived():
return speakerRequestReceived(_that);case SpeakerDecisionReceived():
return speakerDecisionReceived(_that);case ChangeMuteStatus():
return changeMuteStatus(_that);case _MuteStatusReceived():
return muteStatusReceived(_that);case MuteSpeaker():
return muteSpeaker(_that);case _MuteCommandReceived():
return muteCommandReceived(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RequestCreated value)?  requestCreated,TResult? Function( _RequestLoaded value)?  requestLoaded,TResult? Function( _RequestUpdated value)?  requestUpdated,TResult? Function( _RequestDeleted value)?  requestDeleted,TResult? Function( RequestToSpeak value)?  requestToSpeak,TResult? Function( _RequestToSpeakCompleted value)?  requestToSpeakReceived,TResult? Function( HandleSpeakerRequest value)?  handleSpeakerRequest,TResult? Function( SpeakerRequestReceived value)?  speakerRequestReceived,TResult? Function( SpeakerDecisionReceived value)?  speakerDecisionReceived,TResult? Function( ChangeMuteStatus value)?  changeMuteStatus,TResult? Function( _MuteStatusReceived value)?  muteStatusReceived,TResult? Function( MuteSpeaker value)?  muteSpeaker,TResult? Function( _MuteCommandReceived value)?  muteCommandReceived,}){
final _that = this;
switch (_that) {
case _RequestCreated() when requestCreated != null:
return requestCreated(_that);case _RequestLoaded() when requestLoaded != null:
return requestLoaded(_that);case _RequestUpdated() when requestUpdated != null:
return requestUpdated(_that);case _RequestDeleted() when requestDeleted != null:
return requestDeleted(_that);case RequestToSpeak() when requestToSpeak != null:
return requestToSpeak(_that);case _RequestToSpeakCompleted() when requestToSpeakReceived != null:
return requestToSpeakReceived(_that);case HandleSpeakerRequest() when handleSpeakerRequest != null:
return handleSpeakerRequest(_that);case SpeakerRequestReceived() when speakerRequestReceived != null:
return speakerRequestReceived(_that);case SpeakerDecisionReceived() when speakerDecisionReceived != null:
return speakerDecisionReceived(_that);case ChangeMuteStatus() when changeMuteStatus != null:
return changeMuteStatus(_that);case _MuteStatusReceived() when muteStatusReceived != null:
return muteStatusReceived(_that);case MuteSpeaker() when muteSpeaker != null:
return muteSpeaker(_that);case _MuteCommandReceived() when muteCommandReceived != null:
return muteCommandReceived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  requestCreated,TResult Function( Map<String, dynamic> payload)?  requestLoaded,TResult Function( Map<String, dynamic> payload)?  requestUpdated,TResult Function( Map<String, dynamic> payload)?  requestDeleted,TResult Function( Meeting meeting)?  requestToSpeak,TResult Function( Map<String, dynamic> payload)?  requestToSpeakReceived,TResult Function( SpeakerRequest request,  bool isApproved)?  handleSpeakerRequest,TResult Function( Map<String, dynamic> payload)?  speakerRequestReceived,TResult Function( Map<String, dynamic> payload)?  speakerDecisionReceived,TResult Function( Meeting meeting,  bool isMuted)?  changeMuteStatus,TResult Function( Map<String, dynamic> payload)?  muteStatusReceived,TResult Function( Meeting meeting,  User user,  bool isMuted)?  muteSpeaker,TResult Function( Map<String, dynamic> payload)?  muteCommandReceived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestCreated() when requestCreated != null:
return requestCreated(_that.payload);case _RequestLoaded() when requestLoaded != null:
return requestLoaded(_that.payload);case _RequestUpdated() when requestUpdated != null:
return requestUpdated(_that.payload);case _RequestDeleted() when requestDeleted != null:
return requestDeleted(_that.payload);case RequestToSpeak() when requestToSpeak != null:
return requestToSpeak(_that.meeting);case _RequestToSpeakCompleted() when requestToSpeakReceived != null:
return requestToSpeakReceived(_that.payload);case HandleSpeakerRequest() when handleSpeakerRequest != null:
return handleSpeakerRequest(_that.request,_that.isApproved);case SpeakerRequestReceived() when speakerRequestReceived != null:
return speakerRequestReceived(_that.payload);case SpeakerDecisionReceived() when speakerDecisionReceived != null:
return speakerDecisionReceived(_that.payload);case ChangeMuteStatus() when changeMuteStatus != null:
return changeMuteStatus(_that.meeting,_that.isMuted);case _MuteStatusReceived() when muteStatusReceived != null:
return muteStatusReceived(_that.payload);case MuteSpeaker() when muteSpeaker != null:
return muteSpeaker(_that.meeting,_that.user,_that.isMuted);case _MuteCommandReceived() when muteCommandReceived != null:
return muteCommandReceived(_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  requestCreated,required TResult Function( Map<String, dynamic> payload)  requestLoaded,required TResult Function( Map<String, dynamic> payload)  requestUpdated,required TResult Function( Map<String, dynamic> payload)  requestDeleted,required TResult Function( Meeting meeting)  requestToSpeak,required TResult Function( Map<String, dynamic> payload)  requestToSpeakReceived,required TResult Function( SpeakerRequest request,  bool isApproved)  handleSpeakerRequest,required TResult Function( Map<String, dynamic> payload)  speakerRequestReceived,required TResult Function( Map<String, dynamic> payload)  speakerDecisionReceived,required TResult Function( Meeting meeting,  bool isMuted)  changeMuteStatus,required TResult Function( Map<String, dynamic> payload)  muteStatusReceived,required TResult Function( Meeting meeting,  User user,  bool isMuted)  muteSpeaker,required TResult Function( Map<String, dynamic> payload)  muteCommandReceived,}) {final _that = this;
switch (_that) {
case _RequestCreated():
return requestCreated(_that.payload);case _RequestLoaded():
return requestLoaded(_that.payload);case _RequestUpdated():
return requestUpdated(_that.payload);case _RequestDeleted():
return requestDeleted(_that.payload);case RequestToSpeak():
return requestToSpeak(_that.meeting);case _RequestToSpeakCompleted():
return requestToSpeakReceived(_that.payload);case HandleSpeakerRequest():
return handleSpeakerRequest(_that.request,_that.isApproved);case SpeakerRequestReceived():
return speakerRequestReceived(_that.payload);case SpeakerDecisionReceived():
return speakerDecisionReceived(_that.payload);case ChangeMuteStatus():
return changeMuteStatus(_that.meeting,_that.isMuted);case _MuteStatusReceived():
return muteStatusReceived(_that.payload);case MuteSpeaker():
return muteSpeaker(_that.meeting,_that.user,_that.isMuted);case _MuteCommandReceived():
return muteCommandReceived(_that.payload);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  requestCreated,TResult? Function( Map<String, dynamic> payload)?  requestLoaded,TResult? Function( Map<String, dynamic> payload)?  requestUpdated,TResult? Function( Map<String, dynamic> payload)?  requestDeleted,TResult? Function( Meeting meeting)?  requestToSpeak,TResult? Function( Map<String, dynamic> payload)?  requestToSpeakReceived,TResult? Function( SpeakerRequest request,  bool isApproved)?  handleSpeakerRequest,TResult? Function( Map<String, dynamic> payload)?  speakerRequestReceived,TResult? Function( Map<String, dynamic> payload)?  speakerDecisionReceived,TResult? Function( Meeting meeting,  bool isMuted)?  changeMuteStatus,TResult? Function( Map<String, dynamic> payload)?  muteStatusReceived,TResult? Function( Meeting meeting,  User user,  bool isMuted)?  muteSpeaker,TResult? Function( Map<String, dynamic> payload)?  muteCommandReceived,}) {final _that = this;
switch (_that) {
case _RequestCreated() when requestCreated != null:
return requestCreated(_that.payload);case _RequestLoaded() when requestLoaded != null:
return requestLoaded(_that.payload);case _RequestUpdated() when requestUpdated != null:
return requestUpdated(_that.payload);case _RequestDeleted() when requestDeleted != null:
return requestDeleted(_that.payload);case RequestToSpeak() when requestToSpeak != null:
return requestToSpeak(_that.meeting);case _RequestToSpeakCompleted() when requestToSpeakReceived != null:
return requestToSpeakReceived(_that.payload);case HandleSpeakerRequest() when handleSpeakerRequest != null:
return handleSpeakerRequest(_that.request,_that.isApproved);case SpeakerRequestReceived() when speakerRequestReceived != null:
return speakerRequestReceived(_that.payload);case SpeakerDecisionReceived() when speakerDecisionReceived != null:
return speakerDecisionReceived(_that.payload);case ChangeMuteStatus() when changeMuteStatus != null:
return changeMuteStatus(_that.meeting,_that.isMuted);case _MuteStatusReceived() when muteStatusReceived != null:
return muteStatusReceived(_that.payload);case MuteSpeaker() when muteSpeaker != null:
return muteSpeaker(_that.meeting,_that.user,_that.isMuted);case _MuteCommandReceived() when muteCommandReceived != null:
return muteCommandReceived(_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _RequestCreated implements SpeakerDetailEvent {
  const _RequestCreated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestCreatedCopyWith<_RequestCreated> get copyWith => __$RequestCreatedCopyWithImpl<_RequestCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCreated&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SpeakerDetailEvent.requestCreated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$RequestCreatedCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory _$RequestCreatedCopyWith(_RequestCreated value, $Res Function(_RequestCreated) _then) = __$RequestCreatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$RequestCreatedCopyWithImpl<$Res>
    implements _$RequestCreatedCopyWith<$Res> {
  __$RequestCreatedCopyWithImpl(this._self, this._then);

  final _RequestCreated _self;
  final $Res Function(_RequestCreated) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_RequestCreated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _RequestLoaded implements SpeakerDetailEvent {
  const _RequestLoaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestLoadedCopyWith<_RequestLoaded> get copyWith => __$RequestLoadedCopyWithImpl<_RequestLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestLoaded&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SpeakerDetailEvent.requestLoaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$RequestLoadedCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory _$RequestLoadedCopyWith(_RequestLoaded value, $Res Function(_RequestLoaded) _then) = __$RequestLoadedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$RequestLoadedCopyWithImpl<$Res>
    implements _$RequestLoadedCopyWith<$Res> {
  __$RequestLoadedCopyWithImpl(this._self, this._then);

  final _RequestLoaded _self;
  final $Res Function(_RequestLoaded) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_RequestLoaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _RequestUpdated implements SpeakerDetailEvent {
  const _RequestUpdated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestUpdatedCopyWith<_RequestUpdated> get copyWith => __$RequestUpdatedCopyWithImpl<_RequestUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestUpdated&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SpeakerDetailEvent.requestUpdated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$RequestUpdatedCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory _$RequestUpdatedCopyWith(_RequestUpdated value, $Res Function(_RequestUpdated) _then) = __$RequestUpdatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$RequestUpdatedCopyWithImpl<$Res>
    implements _$RequestUpdatedCopyWith<$Res> {
  __$RequestUpdatedCopyWithImpl(this._self, this._then);

  final _RequestUpdated _self;
  final $Res Function(_RequestUpdated) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_RequestUpdated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _RequestDeleted implements SpeakerDetailEvent {
  const _RequestDeleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestDeletedCopyWith<_RequestDeleted> get copyWith => __$RequestDeletedCopyWithImpl<_RequestDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestDeleted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SpeakerDetailEvent.requestDeleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$RequestDeletedCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory _$RequestDeletedCopyWith(_RequestDeleted value, $Res Function(_RequestDeleted) _then) = __$RequestDeletedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$RequestDeletedCopyWithImpl<$Res>
    implements _$RequestDeletedCopyWith<$Res> {
  __$RequestDeletedCopyWithImpl(this._self, this._then);

  final _RequestDeleted _self;
  final $Res Function(_RequestDeleted) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_RequestDeleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class RequestToSpeak implements SpeakerDetailEvent {
  const RequestToSpeak({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestToSpeakCopyWith<RequestToSpeak> get copyWith => _$RequestToSpeakCopyWithImpl<RequestToSpeak>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestToSpeak&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'SpeakerDetailEvent.requestToSpeak(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class $RequestToSpeakCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory $RequestToSpeakCopyWith(RequestToSpeak value, $Res Function(RequestToSpeak) _then) = _$RequestToSpeakCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class _$RequestToSpeakCopyWithImpl<$Res>
    implements $RequestToSpeakCopyWith<$Res> {
  _$RequestToSpeakCopyWithImpl(this._self, this._then);

  final RequestToSpeak _self;
  final $Res Function(RequestToSpeak) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(RequestToSpeak(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of SpeakerDetailEvent
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


class _RequestToSpeakCompleted implements SpeakerDetailEvent {
  const _RequestToSpeakCompleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestToSpeakCompletedCopyWith<_RequestToSpeakCompleted> get copyWith => __$RequestToSpeakCompletedCopyWithImpl<_RequestToSpeakCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestToSpeakCompleted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SpeakerDetailEvent.requestToSpeakReceived(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$RequestToSpeakCompletedCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory _$RequestToSpeakCompletedCopyWith(_RequestToSpeakCompleted value, $Res Function(_RequestToSpeakCompleted) _then) = __$RequestToSpeakCompletedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$RequestToSpeakCompletedCopyWithImpl<$Res>
    implements _$RequestToSpeakCompletedCopyWith<$Res> {
  __$RequestToSpeakCompletedCopyWithImpl(this._self, this._then);

  final _RequestToSpeakCompleted _self;
  final $Res Function(_RequestToSpeakCompleted) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_RequestToSpeakCompleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class HandleSpeakerRequest implements SpeakerDetailEvent {
  const HandleSpeakerRequest({required this.request, required this.isApproved});
  

 final  SpeakerRequest request;
 final  bool isApproved;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HandleSpeakerRequestCopyWith<HandleSpeakerRequest> get copyWith => _$HandleSpeakerRequestCopyWithImpl<HandleSpeakerRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HandleSpeakerRequest&&(identical(other.request, request) || other.request == request)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}


@override
int get hashCode => Object.hash(runtimeType,request,isApproved);

@override
String toString() {
  return 'SpeakerDetailEvent.handleSpeakerRequest(request: $request, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class $HandleSpeakerRequestCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory $HandleSpeakerRequestCopyWith(HandleSpeakerRequest value, $Res Function(HandleSpeakerRequest) _then) = _$HandleSpeakerRequestCopyWithImpl;
@useResult
$Res call({
 SpeakerRequest request, bool isApproved
});


$SpeakerRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$HandleSpeakerRequestCopyWithImpl<$Res>
    implements $HandleSpeakerRequestCopyWith<$Res> {
  _$HandleSpeakerRequestCopyWithImpl(this._self, this._then);

  final HandleSpeakerRequest _self;
  final $Res Function(HandleSpeakerRequest) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,Object? isApproved = null,}) {
  return _then(HandleSpeakerRequest(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as SpeakerRequest,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeakerRequestCopyWith<$Res> get request {
  
  return $SpeakerRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class SpeakerRequestReceived implements SpeakerDetailEvent {
  const SpeakerRequestReceived({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerRequestReceivedCopyWith<SpeakerRequestReceived> get copyWith => _$SpeakerRequestReceivedCopyWithImpl<SpeakerRequestReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerRequestReceived&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SpeakerDetailEvent.speakerRequestReceived(payload: $payload)';
}


}

/// @nodoc
abstract mixin class $SpeakerRequestReceivedCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory $SpeakerRequestReceivedCopyWith(SpeakerRequestReceived value, $Res Function(SpeakerRequestReceived) _then) = _$SpeakerRequestReceivedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class _$SpeakerRequestReceivedCopyWithImpl<$Res>
    implements $SpeakerRequestReceivedCopyWith<$Res> {
  _$SpeakerRequestReceivedCopyWithImpl(this._self, this._then);

  final SpeakerRequestReceived _self;
  final $Res Function(SpeakerRequestReceived) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(SpeakerRequestReceived(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class SpeakerDecisionReceived implements SpeakerDetailEvent {
  const SpeakerDecisionReceived({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerDecisionReceivedCopyWith<SpeakerDecisionReceived> get copyWith => _$SpeakerDecisionReceivedCopyWithImpl<SpeakerDecisionReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerDecisionReceived&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SpeakerDetailEvent.speakerDecisionReceived(payload: $payload)';
}


}

/// @nodoc
abstract mixin class $SpeakerDecisionReceivedCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory $SpeakerDecisionReceivedCopyWith(SpeakerDecisionReceived value, $Res Function(SpeakerDecisionReceived) _then) = _$SpeakerDecisionReceivedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class _$SpeakerDecisionReceivedCopyWithImpl<$Res>
    implements $SpeakerDecisionReceivedCopyWith<$Res> {
  _$SpeakerDecisionReceivedCopyWithImpl(this._self, this._then);

  final SpeakerDecisionReceived _self;
  final $Res Function(SpeakerDecisionReceived) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(SpeakerDecisionReceived(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class ChangeMuteStatus implements SpeakerDetailEvent {
  const ChangeMuteStatus({required this.meeting, required this.isMuted});
  

 final  Meeting meeting;
 final  bool isMuted;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeMuteStatusCopyWith<ChangeMuteStatus> get copyWith => _$ChangeMuteStatusCopyWithImpl<ChangeMuteStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeMuteStatus&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted));
}


@override
int get hashCode => Object.hash(runtimeType,meeting,isMuted);

@override
String toString() {
  return 'SpeakerDetailEvent.changeMuteStatus(meeting: $meeting, isMuted: $isMuted)';
}


}

/// @nodoc
abstract mixin class $ChangeMuteStatusCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory $ChangeMuteStatusCopyWith(ChangeMuteStatus value, $Res Function(ChangeMuteStatus) _then) = _$ChangeMuteStatusCopyWithImpl;
@useResult
$Res call({
 Meeting meeting, bool isMuted
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class _$ChangeMuteStatusCopyWithImpl<$Res>
    implements $ChangeMuteStatusCopyWith<$Res> {
  _$ChangeMuteStatusCopyWithImpl(this._self, this._then);

  final ChangeMuteStatus _self;
  final $Res Function(ChangeMuteStatus) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,Object? isMuted = null,}) {
  return _then(ChangeMuteStatus(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SpeakerDetailEvent
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


class _MuteStatusReceived implements SpeakerDetailEvent {
  const _MuteStatusReceived({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuteStatusReceivedCopyWith<_MuteStatusReceived> get copyWith => __$MuteStatusReceivedCopyWithImpl<_MuteStatusReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuteStatusReceived&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SpeakerDetailEvent.muteStatusReceived(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$MuteStatusReceivedCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory _$MuteStatusReceivedCopyWith(_MuteStatusReceived value, $Res Function(_MuteStatusReceived) _then) = __$MuteStatusReceivedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$MuteStatusReceivedCopyWithImpl<$Res>
    implements _$MuteStatusReceivedCopyWith<$Res> {
  __$MuteStatusReceivedCopyWithImpl(this._self, this._then);

  final _MuteStatusReceived _self;
  final $Res Function(_MuteStatusReceived) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_MuteStatusReceived(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class MuteSpeaker implements SpeakerDetailEvent {
  const MuteSpeaker({required this.meeting, required this.user, required this.isMuted});
  

 final  Meeting meeting;
 final  User user;
 final  bool isMuted;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuteSpeakerCopyWith<MuteSpeaker> get copyWith => _$MuteSpeakerCopyWithImpl<MuteSpeaker>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuteSpeaker&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.user, user) || other.user == user)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted));
}


@override
int get hashCode => Object.hash(runtimeType,meeting,user,isMuted);

@override
String toString() {
  return 'SpeakerDetailEvent.muteSpeaker(meeting: $meeting, user: $user, isMuted: $isMuted)';
}


}

/// @nodoc
abstract mixin class $MuteSpeakerCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory $MuteSpeakerCopyWith(MuteSpeaker value, $Res Function(MuteSpeaker) _then) = _$MuteSpeakerCopyWithImpl;
@useResult
$Res call({
 Meeting meeting, User user, bool isMuted
});


$MeetingCopyWith<$Res> get meeting;$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$MuteSpeakerCopyWithImpl<$Res>
    implements $MuteSpeakerCopyWith<$Res> {
  _$MuteSpeakerCopyWithImpl(this._self, this._then);

  final MuteSpeaker _self;
  final $Res Function(MuteSpeaker) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,Object? user = null,Object? isMuted = null,}) {
  return _then(MuteSpeaker(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res> get meeting {
  
  return $MeetingCopyWith<$Res>(_self.meeting, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _MuteCommandReceived implements SpeakerDetailEvent {
  const _MuteCommandReceived({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuteCommandReceivedCopyWith<_MuteCommandReceived> get copyWith => __$MuteCommandReceivedCopyWithImpl<_MuteCommandReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuteCommandReceived&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SpeakerDetailEvent.muteCommandReceived(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$MuteCommandReceivedCopyWith<$Res> implements $SpeakerDetailEventCopyWith<$Res> {
  factory _$MuteCommandReceivedCopyWith(_MuteCommandReceived value, $Res Function(_MuteCommandReceived) _then) = __$MuteCommandReceivedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$MuteCommandReceivedCopyWithImpl<$Res>
    implements _$MuteCommandReceivedCopyWith<$Res> {
  __$MuteCommandReceivedCopyWithImpl(this._self, this._then);

  final _MuteCommandReceived _self;
  final $Res Function(_MuteCommandReceived) _then;

/// Create a copy of SpeakerDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_MuteCommandReceived(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$SpeakerDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpeakerDetailState()';
}


}

/// @nodoc
class $SpeakerDetailStateCopyWith<$Res>  {
$SpeakerDetailStateCopyWith(SpeakerDetailState _, $Res Function(SpeakerDetailState) __);
}


/// Adds pattern-matching-related methods to [SpeakerDetailState].
extension SpeakerDetailStatePatterns on SpeakerDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SpeakerDetailInitial value)?  initial,TResult Function( SpeakerDetailLoading value)?  loading,TResult Function( SpeakerRequestCreated value)?  requestCreated,TResult Function( SpeakerRequestLoaded value)?  requestLoaded,TResult Function( SpeakerRequestUpdated value)?  updated,TResult Function( SpeakerRequestDeleted value)?  deleted,TResult Function( RequestedToSpeak value)?  requestedToSpeak,TResult Function( SpeakerDecision value)?  speakerDecision,TResult Function( MuteStatusChanged value)?  muteStatusChanged,TResult Function( MuteCommand value)?  muteCommand,TResult Function( SpeakerDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SpeakerDetailInitial() when initial != null:
return initial(_that);case SpeakerDetailLoading() when loading != null:
return loading(_that);case SpeakerRequestCreated() when requestCreated != null:
return requestCreated(_that);case SpeakerRequestLoaded() when requestLoaded != null:
return requestLoaded(_that);case SpeakerRequestUpdated() when updated != null:
return updated(_that);case SpeakerRequestDeleted() when deleted != null:
return deleted(_that);case RequestedToSpeak() when requestedToSpeak != null:
return requestedToSpeak(_that);case SpeakerDecision() when speakerDecision != null:
return speakerDecision(_that);case MuteStatusChanged() when muteStatusChanged != null:
return muteStatusChanged(_that);case MuteCommand() when muteCommand != null:
return muteCommand(_that);case SpeakerDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SpeakerDetailInitial value)  initial,required TResult Function( SpeakerDetailLoading value)  loading,required TResult Function( SpeakerRequestCreated value)  requestCreated,required TResult Function( SpeakerRequestLoaded value)  requestLoaded,required TResult Function( SpeakerRequestUpdated value)  updated,required TResult Function( SpeakerRequestDeleted value)  deleted,required TResult Function( RequestedToSpeak value)  requestedToSpeak,required TResult Function( SpeakerDecision value)  speakerDecision,required TResult Function( MuteStatusChanged value)  muteStatusChanged,required TResult Function( MuteCommand value)  muteCommand,required TResult Function( SpeakerDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case SpeakerDetailInitial():
return initial(_that);case SpeakerDetailLoading():
return loading(_that);case SpeakerRequestCreated():
return requestCreated(_that);case SpeakerRequestLoaded():
return requestLoaded(_that);case SpeakerRequestUpdated():
return updated(_that);case SpeakerRequestDeleted():
return deleted(_that);case RequestedToSpeak():
return requestedToSpeak(_that);case SpeakerDecision():
return speakerDecision(_that);case MuteStatusChanged():
return muteStatusChanged(_that);case MuteCommand():
return muteCommand(_that);case SpeakerDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SpeakerDetailInitial value)?  initial,TResult? Function( SpeakerDetailLoading value)?  loading,TResult? Function( SpeakerRequestCreated value)?  requestCreated,TResult? Function( SpeakerRequestLoaded value)?  requestLoaded,TResult? Function( SpeakerRequestUpdated value)?  updated,TResult? Function( SpeakerRequestDeleted value)?  deleted,TResult? Function( RequestedToSpeak value)?  requestedToSpeak,TResult? Function( SpeakerDecision value)?  speakerDecision,TResult? Function( MuteStatusChanged value)?  muteStatusChanged,TResult? Function( MuteCommand value)?  muteCommand,TResult? Function( SpeakerDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SpeakerDetailInitial() when initial != null:
return initial(_that);case SpeakerDetailLoading() when loading != null:
return loading(_that);case SpeakerRequestCreated() when requestCreated != null:
return requestCreated(_that);case SpeakerRequestLoaded() when requestLoaded != null:
return requestLoaded(_that);case SpeakerRequestUpdated() when updated != null:
return updated(_that);case SpeakerRequestDeleted() when deleted != null:
return deleted(_that);case RequestedToSpeak() when requestedToSpeak != null:
return requestedToSpeak(_that);case SpeakerDecision() when speakerDecision != null:
return speakerDecision(_that);case MuteStatusChanged() when muteStatusChanged != null:
return muteStatusChanged(_that);case MuteCommand() when muteCommand != null:
return muteCommand(_that);case SpeakerDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SpeakerRequest request)?  requestCreated,TResult Function( SpeakerRequest request)?  requestLoaded,TResult Function( SpeakerRequest request)?  updated,TResult Function( int requestId)?  deleted,TResult Function()?  requestedToSpeak,TResult Function( int userId,  bool isApproved,  int decidedBy)?  speakerDecision,TResult Function( bool isMuted)?  muteStatusChanged,TResult Function( int userId,  bool isMuted,  int mutedBy)?  muteCommand,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SpeakerDetailInitial() when initial != null:
return initial();case SpeakerDetailLoading() when loading != null:
return loading();case SpeakerRequestCreated() when requestCreated != null:
return requestCreated(_that.request);case SpeakerRequestLoaded() when requestLoaded != null:
return requestLoaded(_that.request);case SpeakerRequestUpdated() when updated != null:
return updated(_that.request);case SpeakerRequestDeleted() when deleted != null:
return deleted(_that.requestId);case RequestedToSpeak() when requestedToSpeak != null:
return requestedToSpeak();case SpeakerDecision() when speakerDecision != null:
return speakerDecision(_that.userId,_that.isApproved,_that.decidedBy);case MuteStatusChanged() when muteStatusChanged != null:
return muteStatusChanged(_that.isMuted);case MuteCommand() when muteCommand != null:
return muteCommand(_that.userId,_that.isMuted,_that.mutedBy);case SpeakerDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SpeakerRequest request)  requestCreated,required TResult Function( SpeakerRequest request)  requestLoaded,required TResult Function( SpeakerRequest request)  updated,required TResult Function( int requestId)  deleted,required TResult Function()  requestedToSpeak,required TResult Function( int userId,  bool isApproved,  int decidedBy)  speakerDecision,required TResult Function( bool isMuted)  muteStatusChanged,required TResult Function( int userId,  bool isMuted,  int mutedBy)  muteCommand,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case SpeakerDetailInitial():
return initial();case SpeakerDetailLoading():
return loading();case SpeakerRequestCreated():
return requestCreated(_that.request);case SpeakerRequestLoaded():
return requestLoaded(_that.request);case SpeakerRequestUpdated():
return updated(_that.request);case SpeakerRequestDeleted():
return deleted(_that.requestId);case RequestedToSpeak():
return requestedToSpeak();case SpeakerDecision():
return speakerDecision(_that.userId,_that.isApproved,_that.decidedBy);case MuteStatusChanged():
return muteStatusChanged(_that.isMuted);case MuteCommand():
return muteCommand(_that.userId,_that.isMuted,_that.mutedBy);case SpeakerDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SpeakerRequest request)?  requestCreated,TResult? Function( SpeakerRequest request)?  requestLoaded,TResult? Function( SpeakerRequest request)?  updated,TResult? Function( int requestId)?  deleted,TResult? Function()?  requestedToSpeak,TResult? Function( int userId,  bool isApproved,  int decidedBy)?  speakerDecision,TResult? Function( bool isMuted)?  muteStatusChanged,TResult? Function( int userId,  bool isMuted,  int mutedBy)?  muteCommand,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case SpeakerDetailInitial() when initial != null:
return initial();case SpeakerDetailLoading() when loading != null:
return loading();case SpeakerRequestCreated() when requestCreated != null:
return requestCreated(_that.request);case SpeakerRequestLoaded() when requestLoaded != null:
return requestLoaded(_that.request);case SpeakerRequestUpdated() when updated != null:
return updated(_that.request);case SpeakerRequestDeleted() when deleted != null:
return deleted(_that.requestId);case RequestedToSpeak() when requestedToSpeak != null:
return requestedToSpeak();case SpeakerDecision() when speakerDecision != null:
return speakerDecision(_that.userId,_that.isApproved,_that.decidedBy);case MuteStatusChanged() when muteStatusChanged != null:
return muteStatusChanged(_that.isMuted);case MuteCommand() when muteCommand != null:
return muteCommand(_that.userId,_that.isMuted,_that.mutedBy);case SpeakerDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class SpeakerDetailInitial implements SpeakerDetailState {
  const SpeakerDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpeakerDetailState.initial()';
}


}




/// @nodoc


class SpeakerDetailLoading implements SpeakerDetailState {
  const SpeakerDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpeakerDetailState.loading()';
}


}




/// @nodoc


class SpeakerRequestCreated implements SpeakerDetailState {
  const SpeakerRequestCreated({required this.request});
  

 final  SpeakerRequest request;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerRequestCreatedCopyWith<SpeakerRequestCreated> get copyWith => _$SpeakerRequestCreatedCopyWithImpl<SpeakerRequestCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerRequestCreated&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'SpeakerDetailState.requestCreated(request: $request)';
}


}

/// @nodoc
abstract mixin class $SpeakerRequestCreatedCopyWith<$Res> implements $SpeakerDetailStateCopyWith<$Res> {
  factory $SpeakerRequestCreatedCopyWith(SpeakerRequestCreated value, $Res Function(SpeakerRequestCreated) _then) = _$SpeakerRequestCreatedCopyWithImpl;
@useResult
$Res call({
 SpeakerRequest request
});


$SpeakerRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$SpeakerRequestCreatedCopyWithImpl<$Res>
    implements $SpeakerRequestCreatedCopyWith<$Res> {
  _$SpeakerRequestCreatedCopyWithImpl(this._self, this._then);

  final SpeakerRequestCreated _self;
  final $Res Function(SpeakerRequestCreated) _then;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(SpeakerRequestCreated(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as SpeakerRequest,
  ));
}

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeakerRequestCopyWith<$Res> get request {
  
  return $SpeakerRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class SpeakerRequestLoaded implements SpeakerDetailState {
  const SpeakerRequestLoaded({required this.request});
  

 final  SpeakerRequest request;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerRequestLoadedCopyWith<SpeakerRequestLoaded> get copyWith => _$SpeakerRequestLoadedCopyWithImpl<SpeakerRequestLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerRequestLoaded&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'SpeakerDetailState.requestLoaded(request: $request)';
}


}

/// @nodoc
abstract mixin class $SpeakerRequestLoadedCopyWith<$Res> implements $SpeakerDetailStateCopyWith<$Res> {
  factory $SpeakerRequestLoadedCopyWith(SpeakerRequestLoaded value, $Res Function(SpeakerRequestLoaded) _then) = _$SpeakerRequestLoadedCopyWithImpl;
@useResult
$Res call({
 SpeakerRequest request
});


$SpeakerRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$SpeakerRequestLoadedCopyWithImpl<$Res>
    implements $SpeakerRequestLoadedCopyWith<$Res> {
  _$SpeakerRequestLoadedCopyWithImpl(this._self, this._then);

  final SpeakerRequestLoaded _self;
  final $Res Function(SpeakerRequestLoaded) _then;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(SpeakerRequestLoaded(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as SpeakerRequest,
  ));
}

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeakerRequestCopyWith<$Res> get request {
  
  return $SpeakerRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class SpeakerRequestUpdated implements SpeakerDetailState {
  const SpeakerRequestUpdated({required this.request});
  

 final  SpeakerRequest request;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerRequestUpdatedCopyWith<SpeakerRequestUpdated> get copyWith => _$SpeakerRequestUpdatedCopyWithImpl<SpeakerRequestUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerRequestUpdated&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'SpeakerDetailState.updated(request: $request)';
}


}

/// @nodoc
abstract mixin class $SpeakerRequestUpdatedCopyWith<$Res> implements $SpeakerDetailStateCopyWith<$Res> {
  factory $SpeakerRequestUpdatedCopyWith(SpeakerRequestUpdated value, $Res Function(SpeakerRequestUpdated) _then) = _$SpeakerRequestUpdatedCopyWithImpl;
@useResult
$Res call({
 SpeakerRequest request
});


$SpeakerRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$SpeakerRequestUpdatedCopyWithImpl<$Res>
    implements $SpeakerRequestUpdatedCopyWith<$Res> {
  _$SpeakerRequestUpdatedCopyWithImpl(this._self, this._then);

  final SpeakerRequestUpdated _self;
  final $Res Function(SpeakerRequestUpdated) _then;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(SpeakerRequestUpdated(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as SpeakerRequest,
  ));
}

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeakerRequestCopyWith<$Res> get request {
  
  return $SpeakerRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class SpeakerRequestDeleted implements SpeakerDetailState {
  const SpeakerRequestDeleted({required this.requestId});
  

 final  int requestId;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerRequestDeletedCopyWith<SpeakerRequestDeleted> get copyWith => _$SpeakerRequestDeletedCopyWithImpl<SpeakerRequestDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerRequestDeleted&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'SpeakerDetailState.deleted(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $SpeakerRequestDeletedCopyWith<$Res> implements $SpeakerDetailStateCopyWith<$Res> {
  factory $SpeakerRequestDeletedCopyWith(SpeakerRequestDeleted value, $Res Function(SpeakerRequestDeleted) _then) = _$SpeakerRequestDeletedCopyWithImpl;
@useResult
$Res call({
 int requestId
});




}
/// @nodoc
class _$SpeakerRequestDeletedCopyWithImpl<$Res>
    implements $SpeakerRequestDeletedCopyWith<$Res> {
  _$SpeakerRequestDeletedCopyWithImpl(this._self, this._then);

  final SpeakerRequestDeleted _self;
  final $Res Function(SpeakerRequestDeleted) _then;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(SpeakerRequestDeleted(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RequestedToSpeak implements SpeakerDetailState {
  const RequestedToSpeak();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestedToSpeak);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpeakerDetailState.requestedToSpeak()';
}


}




/// @nodoc


class SpeakerDecision implements SpeakerDetailState {
  const SpeakerDecision({required this.userId, required this.isApproved, required this.decidedBy});
  

 final  int userId;
 final  bool isApproved;
 final  int decidedBy;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerDecisionCopyWith<SpeakerDecision> get copyWith => _$SpeakerDecisionCopyWithImpl<SpeakerDecision>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerDecision&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&(identical(other.decidedBy, decidedBy) || other.decidedBy == decidedBy));
}


@override
int get hashCode => Object.hash(runtimeType,userId,isApproved,decidedBy);

@override
String toString() {
  return 'SpeakerDetailState.speakerDecision(userId: $userId, isApproved: $isApproved, decidedBy: $decidedBy)';
}


}

/// @nodoc
abstract mixin class $SpeakerDecisionCopyWith<$Res> implements $SpeakerDetailStateCopyWith<$Res> {
  factory $SpeakerDecisionCopyWith(SpeakerDecision value, $Res Function(SpeakerDecision) _then) = _$SpeakerDecisionCopyWithImpl;
@useResult
$Res call({
 int userId, bool isApproved, int decidedBy
});




}
/// @nodoc
class _$SpeakerDecisionCopyWithImpl<$Res>
    implements $SpeakerDecisionCopyWith<$Res> {
  _$SpeakerDecisionCopyWithImpl(this._self, this._then);

  final SpeakerDecision _self;
  final $Res Function(SpeakerDecision) _then;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? isApproved = null,Object? decidedBy = null,}) {
  return _then(SpeakerDecision(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,decidedBy: null == decidedBy ? _self.decidedBy : decidedBy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MuteStatusChanged implements SpeakerDetailState {
  const MuteStatusChanged({required this.isMuted});
  

 final  bool isMuted;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuteStatusChangedCopyWith<MuteStatusChanged> get copyWith => _$MuteStatusChangedCopyWithImpl<MuteStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuteStatusChanged&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted));
}


@override
int get hashCode => Object.hash(runtimeType,isMuted);

@override
String toString() {
  return 'SpeakerDetailState.muteStatusChanged(isMuted: $isMuted)';
}


}

/// @nodoc
abstract mixin class $MuteStatusChangedCopyWith<$Res> implements $SpeakerDetailStateCopyWith<$Res> {
  factory $MuteStatusChangedCopyWith(MuteStatusChanged value, $Res Function(MuteStatusChanged) _then) = _$MuteStatusChangedCopyWithImpl;
@useResult
$Res call({
 bool isMuted
});




}
/// @nodoc
class _$MuteStatusChangedCopyWithImpl<$Res>
    implements $MuteStatusChangedCopyWith<$Res> {
  _$MuteStatusChangedCopyWithImpl(this._self, this._then);

  final MuteStatusChanged _self;
  final $Res Function(MuteStatusChanged) _then;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isMuted = null,}) {
  return _then(MuteStatusChanged(
isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class MuteCommand implements SpeakerDetailState {
  const MuteCommand({required this.userId, required this.isMuted, required this.mutedBy});
  

 final  int userId;
 final  bool isMuted;
 final  int mutedBy;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuteCommandCopyWith<MuteCommand> get copyWith => _$MuteCommandCopyWithImpl<MuteCommand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuteCommand&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.mutedBy, mutedBy) || other.mutedBy == mutedBy));
}


@override
int get hashCode => Object.hash(runtimeType,userId,isMuted,mutedBy);

@override
String toString() {
  return 'SpeakerDetailState.muteCommand(userId: $userId, isMuted: $isMuted, mutedBy: $mutedBy)';
}


}

/// @nodoc
abstract mixin class $MuteCommandCopyWith<$Res> implements $SpeakerDetailStateCopyWith<$Res> {
  factory $MuteCommandCopyWith(MuteCommand value, $Res Function(MuteCommand) _then) = _$MuteCommandCopyWithImpl;
@useResult
$Res call({
 int userId, bool isMuted, int mutedBy
});




}
/// @nodoc
class _$MuteCommandCopyWithImpl<$Res>
    implements $MuteCommandCopyWith<$Res> {
  _$MuteCommandCopyWithImpl(this._self, this._then);

  final MuteCommand _self;
  final $Res Function(MuteCommand) _then;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? isMuted = null,Object? mutedBy = null,}) {
  return _then(MuteCommand(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,mutedBy: null == mutedBy ? _self.mutedBy : mutedBy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SpeakerDetailFailure implements SpeakerDetailState {
  const SpeakerDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerDetailFailureCopyWith<SpeakerDetailFailure> get copyWith => _$SpeakerDetailFailureCopyWithImpl<SpeakerDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SpeakerDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $SpeakerDetailFailureCopyWith<$Res> implements $SpeakerDetailStateCopyWith<$Res> {
  factory $SpeakerDetailFailureCopyWith(SpeakerDetailFailure value, $Res Function(SpeakerDetailFailure) _then) = _$SpeakerDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$SpeakerDetailFailureCopyWithImpl<$Res>
    implements $SpeakerDetailFailureCopyWith<$Res> {
  _$SpeakerDetailFailureCopyWithImpl(this._self, this._then);

  final SpeakerDetailFailure _self;
  final $Res Function(SpeakerDetailFailure) _then;

/// Create a copy of SpeakerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SpeakerDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
