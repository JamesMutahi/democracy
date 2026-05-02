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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,TResult Function( _Add value)?  add,TResult Function( _Update value)?  update,TResult Function( _UpdateFields value)?  updateFields,TResult Function( _Remove value)?  remove,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Add() when add != null:
return add(_that);case _Update() when update != null:
return update(_that);case _UpdateFields() when updateFields != null:
return updateFields(_that);case _Remove() when remove != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,required TResult Function( _Add value)  add,required TResult Function( _Update value)  update,required TResult Function( _UpdateFields value)  updateFields,required TResult Function( _Remove value)  remove,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);case _Add():
return add(_that);case _Update():
return update(_that);case _UpdateFields():
return updateFields(_that);case _Remove():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,TResult? Function( _Add value)?  add,TResult? Function( _Update value)?  update,TResult? Function( _UpdateFields value)?  updateFields,TResult? Function( _Remove value)?  remove,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Add() when add != null:
return add(_that);case _Update() when update != null:
return update(_that);case _UpdateFields() when updateFields != null:
return updateFields(_that);case _Remove() when remove != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? searchTerm,  List<Meeting>? previousMeetings,  bool? isActive,  String? sortBy,  bool? filterByRegion,  DateTime? startDate,  DateTime? endDate)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( Meeting meeting)?  add,TResult Function( Meeting meeting)?  update,TResult Function( int id,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  int participantsCount,  bool isActive)?  updateFields,TResult Function( int meetingId)?  remove,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.searchTerm,_that.previousMeetings,_that.isActive,_that.sortBy,_that.filterByRegion,_that.startDate,_that.endDate);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.meeting);case _Update() when update != null:
return update(_that.meeting);case _UpdateFields() when updateFields != null:
return updateFields(_that.id,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.participantsCount,_that.isActive);case _Remove() when remove != null:
return remove(_that.meetingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? searchTerm,  List<Meeting>? previousMeetings,  bool? isActive,  String? sortBy,  bool? filterByRegion,  DateTime? startDate,  DateTime? endDate)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( Meeting meeting)  add,required TResult Function( Meeting meeting)  update,required TResult Function( int id,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  int participantsCount,  bool isActive)  updateFields,required TResult Function( int meetingId)  remove,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.searchTerm,_that.previousMeetings,_that.isActive,_that.sortBy,_that.filterByRegion,_that.startDate,_that.endDate);case _Received():
return received(_that.payload);case _Add():
return add(_that.meeting);case _Update():
return update(_that.meeting);case _UpdateFields():
return updateFields(_that.id,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.participantsCount,_that.isActive);case _Remove():
return remove(_that.meetingId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? searchTerm,  List<Meeting>? previousMeetings,  bool? isActive,  String? sortBy,  bool? filterByRegion,  DateTime? startDate,  DateTime? endDate)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( Meeting meeting)?  add,TResult? Function( Meeting meeting)?  update,TResult? Function( int id,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  int participantsCount,  bool isActive)?  updateFields,TResult? Function( int meetingId)?  remove,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.searchTerm,_that.previousMeetings,_that.isActive,_that.sortBy,_that.filterByRegion,_that.startDate,_that.endDate);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.meeting);case _Update() when update != null:
return update(_that.meeting);case _UpdateFields() when updateFields != null:
return updateFields(_that.id,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.participantsCount,_that.isActive);case _Remove() when remove != null:
return remove(_that.meetingId);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements MeetingsEvent {
  const _Get({this.searchTerm, final  List<Meeting>? previousMeetings, this.isActive, this.sortBy, this.filterByRegion, this.startDate, this.endDate}): _previousMeetings = previousMeetings;
  

 final  String? searchTerm;
 final  List<Meeting>? _previousMeetings;
 List<Meeting>? get previousMeetings {
  final value = _previousMeetings;
  if (value == null) return null;
  if (_previousMeetings is EqualUnmodifiableListView) return _previousMeetings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool? isActive;
 final  String? sortBy;
 final  bool? filterByRegion;
 final  DateTime? startDate;
 final  DateTime? endDate;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&const DeepCollectionEquality().equals(other._previousMeetings, _previousMeetings)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.filterByRegion, filterByRegion) || other.filterByRegion == filterByRegion)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,const DeepCollectionEquality().hash(_previousMeetings),isActive,sortBy,filterByRegion,startDate,endDate);

@override
String toString() {
  return 'MeetingsEvent.get(searchTerm: $searchTerm, previousMeetings: $previousMeetings, isActive: $isActive, sortBy: $sortBy, filterByRegion: $filterByRegion, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $MeetingsEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, List<Meeting>? previousMeetings, bool? isActive, String? sortBy, bool? filterByRegion, DateTime? startDate, DateTime? endDate
});




}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? previousMeetings = freezed,Object? isActive = freezed,Object? sortBy = freezed,Object? filterByRegion = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_Get(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,previousMeetings: freezed == previousMeetings ? _self._previousMeetings : previousMeetings // ignore: cast_nullable_to_non_nullable
as List<Meeting>?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,filterByRegion: freezed == filterByRegion ? _self.filterByRegion : filterByRegion // ignore: cast_nullable_to_non_nullable
as bool?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
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


class _Add implements MeetingsEvent {
  const _Add({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCopyWith<_Add> get copyWith => __$AddCopyWithImpl<_Add>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Add&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingsEvent.add(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res> implements $MeetingsEventCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) = __$AddCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class __$AddCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(_Add(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingsEvent
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


class _Update implements MeetingsEvent {
  const _Update({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingsEvent.update(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $MeetingsEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(_Update(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingsEvent
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


class _UpdateFields implements MeetingsEvent {
  const _UpdateFields({required this.id, required this.title, required this.description, required this.county, required this.constituency, required this.ward, required this.participantsCount, required this.isActive});
  

 final  int id;
 final  String title;
 final  String description;
 final  County? county;
 final  Constituency? constituency;
 final  Ward? ward;
 final  int participantsCount;
 final  bool isActive;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFieldsCopyWith<_UpdateFields> get copyWith => __$UpdateFieldsCopyWithImpl<_UpdateFields>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateFields&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.county, county) || other.county == county)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.participantsCount, participantsCount) || other.participantsCount == participantsCount)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,county,constituency,ward,participantsCount,isActive);

@override
String toString() {
  return 'MeetingsEvent.updateFields(id: $id, title: $title, description: $description, county: $county, constituency: $constituency, ward: $ward, participantsCount: $participantsCount, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$UpdateFieldsCopyWith<$Res> implements $MeetingsEventCopyWith<$Res> {
  factory _$UpdateFieldsCopyWith(_UpdateFields value, $Res Function(_UpdateFields) _then) = __$UpdateFieldsCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, County? county, Constituency? constituency, Ward? ward, int participantsCount, bool isActive
});


$CountyCopyWith<$Res>? get county;$ConstituencyCopyWith<$Res>? get constituency;$WardCopyWith<$Res>? get ward;

}
/// @nodoc
class __$UpdateFieldsCopyWithImpl<$Res>
    implements _$UpdateFieldsCopyWith<$Res> {
  __$UpdateFieldsCopyWithImpl(this._self, this._then);

  final _UpdateFields _self;
  final $Res Function(_UpdateFields) _then;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? county = freezed,Object? constituency = freezed,Object? ward = freezed,Object? participantsCount = null,Object? isActive = null,}) {
  return _then(_UpdateFields(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as County?,constituency: freezed == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as Constituency?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as Ward?,participantsCount: null == participantsCount ? _self.participantsCount : participantsCount // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountyCopyWith<$Res>? get county {
    if (_self.county == null) {
    return null;
  }

  return $CountyCopyWith<$Res>(_self.county!, (value) {
    return _then(_self.copyWith(county: value));
  });
}/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConstituencyCopyWith<$Res>? get constituency {
    if (_self.constituency == null) {
    return null;
  }

  return $ConstituencyCopyWith<$Res>(_self.constituency!, (value) {
    return _then(_self.copyWith(constituency: value));
  });
}/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WardCopyWith<$Res>? get ward {
    if (_self.ward == null) {
    return null;
  }

  return $WardCopyWith<$Res>(_self.ward!, (value) {
    return _then(_self.copyWith(ward: value));
  });
}
}

/// @nodoc


class _Remove implements MeetingsEvent {
  const _Remove({required this.meetingId});
  

 final  int meetingId;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCopyWith<_Remove> get copyWith => __$RemoveCopyWithImpl<_Remove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Remove&&(identical(other.meetingId, meetingId) || other.meetingId == meetingId));
}


@override
int get hashCode => Object.hash(runtimeType,meetingId);

@override
String toString() {
  return 'MeetingsEvent.remove(meetingId: $meetingId)';
}


}

/// @nodoc
abstract mixin class _$RemoveCopyWith<$Res> implements $MeetingsEventCopyWith<$Res> {
  factory _$RemoveCopyWith(_Remove value, $Res Function(_Remove) _then) = __$RemoveCopyWithImpl;
@useResult
$Res call({
 int meetingId
});




}
/// @nodoc
class __$RemoveCopyWithImpl<$Res>
    implements _$RemoveCopyWith<$Res> {
  __$RemoveCopyWithImpl(this._self, this._then);

  final _Remove _self;
  final $Res Function(_Remove) _then;

/// Create a copy of MeetingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meetingId = null,}) {
  return _then(_Remove(
meetingId: null == meetingId ? _self.meetingId : meetingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
