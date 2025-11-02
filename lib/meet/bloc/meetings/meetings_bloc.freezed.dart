// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meetings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeetingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingsEvent()';
}


}

/// @nodoc
class $MeetingsEventCopyWith<$Res>  {
$MeetingsEventCopyWith(MeetingsEvent _, $Res Function(MeetingsEvent) __);
}


/// Adds pattern-matching-related methods to [MeetingsEvent].
extension MeetingsEventPatterns on MeetingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,TResult Function( _Resubscribe value)?  resubscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Resubscribe() when resubscribe != null:
return resubscribe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,required TResult Function( _Resubscribe value)  resubscribe,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);case _Resubscribe():
return resubscribe(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,TResult? Function( _Resubscribe value)?  resubscribe,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Resubscribe() when resubscribe != null:
return resubscribe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? searchTerm,  Meeting? lastMeeting,  DateTime? startDate,  DateTime? endDate)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( List<Meeting> meetings)?  resubscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.searchTerm,_that.lastMeeting,_that.startDate,_that.endDate);case _Received() when received != null:
return received(_that.payload);case _Resubscribe() when resubscribe != null:
return resubscribe(_that.meetings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? searchTerm,  Meeting? lastMeeting,  DateTime? startDate,  DateTime? endDate)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( List<Meeting> meetings)  resubscribe,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.searchTerm,_that.lastMeeting,_that.startDate,_that.endDate);case _Received():
return received(_that.payload);case _Resubscribe():
return resubscribe(_that.meetings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? searchTerm,  Meeting? lastMeeting,  DateTime? startDate,  DateTime? endDate)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( List<Meeting> meetings)?  resubscribe,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.searchTerm,_that.lastMeeting,_that.startDate,_that.endDate);case _Received() when received != null:
return received(_that.payload);case _Resubscribe() when resubscribe != null:
return resubscribe(_that.meetings);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements MeetingsEvent {
  const _Get({this.searchTerm, this.lastMeeting, this.startDate, this.endDate});
  

 final  String? searchTerm;
 final  Meeting? lastMeeting;
 final  DateTime? startDate;
 final  DateTime? endDate;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.lastMeeting, lastMeeting) || other.lastMeeting == lastMeeting)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,lastMeeting,startDate,endDate);

@override
String toString() {
  return 'MeetingsEvent.get(searchTerm: $searchTerm, lastMeeting: $lastMeeting, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $MeetingsEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, Meeting? lastMeeting, DateTime? startDate, DateTime? endDate
});


$MeetingCopyWith<$Res>? get lastMeeting;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? lastMeeting = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_Get(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,lastMeeting: freezed == lastMeeting ? _self.lastMeeting : lastMeeting // ignore: cast_nullable_to_non_nullable
as Meeting?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res>? get lastMeeting {
    if (_self.lastMeeting == null) {
    return null;
  }

  return $MeetingCopyWith<$Res>(_self.lastMeeting!, (value) {
    return _then(_self.copyWith(lastMeeting: value));
  });
}
}

/// @nodoc


class _Received implements MeetingsEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingsEvent
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
  return 'MeetingsEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $MeetingsEventCopyWith<$Res> {
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

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Resubscribe implements MeetingsEvent {
  const _Resubscribe({required final  List<Meeting> meetings}): _meetings = meetings;
  

 final  List<Meeting> _meetings;
 List<Meeting> get meetings {
  if (_meetings is EqualUnmodifiableListView) return _meetings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meetings);
}


/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResubscribeCopyWith<_Resubscribe> get copyWith => __$ResubscribeCopyWithImpl<_Resubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resubscribe&&const DeepCollectionEquality().equals(other._meetings, _meetings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_meetings));

@override
String toString() {
  return 'MeetingsEvent.resubscribe(meetings: $meetings)';
}


}

/// @nodoc
abstract mixin class _$ResubscribeCopyWith<$Res> implements $MeetingsEventCopyWith<$Res> {
  factory _$ResubscribeCopyWith(_Resubscribe value, $Res Function(_Resubscribe) _then) = __$ResubscribeCopyWithImpl;
@useResult
$Res call({
 List<Meeting> meetings
});




}
/// @nodoc
class __$ResubscribeCopyWithImpl<$Res>
    implements _$ResubscribeCopyWith<$Res> {
  __$ResubscribeCopyWithImpl(this._self, this._then);

  final _Resubscribe _self;
  final $Res Function(_Resubscribe) _then;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meetings = null,}) {
  return _then(_Resubscribe(
meetings: null == meetings ? _self._meetings : meetings // ignore: cast_nullable_to_non_nullable
as List<Meeting>,
  ));
}


}

// dart format on
