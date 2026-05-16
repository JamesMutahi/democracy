// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speaker_requests_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpeakerRequestsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerRequestsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpeakerRequestsEvent()';
}


}

/// @nodoc
class $SpeakerRequestsEventCopyWith<$Res>  {
$SpeakerRequestsEventCopyWith(SpeakerRequestsEvent _, $Res Function(SpeakerRequestsEvent) __);
}


/// Adds pattern-matching-related methods to [SpeakerRequestsEvent].
extension SpeakerRequestsEventPatterns on SpeakerRequestsEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Meeting meeting,  List<SpeakerRequest> previousRequests)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( SpeakerRequest request)?  add,TResult Function( SpeakerRequest request)?  update,TResult Function( int requestId)?  remove,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.meeting,_that.previousRequests);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.request);case _Update() when update != null:
return update(_that.request);case _Remove() when remove != null:
return remove(_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Meeting meeting,  List<SpeakerRequest> previousRequests)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( SpeakerRequest request)  add,required TResult Function( SpeakerRequest request)  update,required TResult Function( int requestId)  remove,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.meeting,_that.previousRequests);case _Received():
return received(_that.payload);case _Add():
return add(_that.request);case _Update():
return update(_that.request);case _Remove():
return remove(_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Meeting meeting,  List<SpeakerRequest> previousRequests)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( SpeakerRequest request)?  add,TResult? Function( SpeakerRequest request)?  update,TResult? Function( int requestId)?  remove,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.meeting,_that.previousRequests);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.request);case _Update() when update != null:
return update(_that.request);case _Remove() when remove != null:
return remove(_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements SpeakerRequestsEvent {
  const _Get({required this.meeting, final  List<SpeakerRequest> previousRequests = const []}): _previousRequests = previousRequests;
  

 final  Meeting meeting;
 final  List<SpeakerRequest> _previousRequests;
@JsonKey() List<SpeakerRequest> get previousRequests {
  if (_previousRequests is EqualUnmodifiableListView) return _previousRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_previousRequests);
}


/// Create a copy of SpeakerRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.meeting, meeting) || other.meeting == meeting)&&const DeepCollectionEquality().equals(other._previousRequests, _previousRequests));
}


@override
int get hashCode => Object.hash(runtimeType,meeting,const DeepCollectionEquality().hash(_previousRequests));

@override
String toString() {
  return 'SpeakerRequestsEvent.get(meeting: $meeting, previousRequests: $previousRequests)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $SpeakerRequestsEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 Meeting meeting, List<SpeakerRequest> previousRequests
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of SpeakerRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,Object? previousRequests = null,}) {
  return _then(_Get(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,previousRequests: null == previousRequests ? _self._previousRequests : previousRequests // ignore: cast_nullable_to_non_nullable
as List<SpeakerRequest>,
  ));
}

/// Create a copy of SpeakerRequestsEvent
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


class _Received implements SpeakerRequestsEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SpeakerRequestsEvent
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
  return 'SpeakerRequestsEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $SpeakerRequestsEventCopyWith<$Res> {
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

/// Create a copy of SpeakerRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Add implements SpeakerRequestsEvent {
  const _Add({required this.request});
  

 final  SpeakerRequest request;

/// Create a copy of SpeakerRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCopyWith<_Add> get copyWith => __$AddCopyWithImpl<_Add>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Add&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'SpeakerRequestsEvent.add(request: $request)';
}


}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res> implements $SpeakerRequestsEventCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) = __$AddCopyWithImpl;
@useResult
$Res call({
 SpeakerRequest request
});


$SpeakerRequestCopyWith<$Res> get request;

}
/// @nodoc
class __$AddCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

/// Create a copy of SpeakerRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_Add(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as SpeakerRequest,
  ));
}

/// Create a copy of SpeakerRequestsEvent
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


class _Update implements SpeakerRequestsEvent {
  const _Update({required this.request});
  

 final  SpeakerRequest request;

/// Create a copy of SpeakerRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'SpeakerRequestsEvent.update(request: $request)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $SpeakerRequestsEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 SpeakerRequest request
});


$SpeakerRequestCopyWith<$Res> get request;

}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of SpeakerRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_Update(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as SpeakerRequest,
  ));
}

/// Create a copy of SpeakerRequestsEvent
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


class _Remove implements SpeakerRequestsEvent {
  const _Remove({required this.requestId});
  

 final  int requestId;

/// Create a copy of SpeakerRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCopyWith<_Remove> get copyWith => __$RemoveCopyWithImpl<_Remove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Remove&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'SpeakerRequestsEvent.remove(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$RemoveCopyWith<$Res> implements $SpeakerRequestsEventCopyWith<$Res> {
  factory _$RemoveCopyWith(_Remove value, $Res Function(_Remove) _then) = __$RemoveCopyWithImpl;
@useResult
$Res call({
 int requestId
});




}
/// @nodoc
class __$RemoveCopyWithImpl<$Res>
    implements _$RemoveCopyWith<$Res> {
  __$RemoveCopyWithImpl(this._self, this._then);

  final _Remove _self;
  final $Res Function(_Remove) _then;

/// Create a copy of SpeakerRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(_Remove(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
