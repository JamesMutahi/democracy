// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'broadcast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Broadcast {

 int get id; User get host;@BroadcastTypeConverter() BroadcastType get type;@JsonKey(name: 'co_hosts') List<User> get coHosts; String get title; String get description; County? get county; Constituency? get constituency; Ward? get ward; List<User> get speakers; List<User> get participants;@JsonKey(name: 'participants_count') int get participantsCount;@JsonKey(name: 'muted') List<int> get muted;@JsonKey(name: 'is_recorded') bool get isRecorded;@JsonKey(name: 'has_started') bool get hasStarted;@JsonKey(name: 'has_ended') bool get hasEnded;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'start_time') DateTime get startTime;@JsonKey(name: 'end_time') DateTime? get endTime;
/// Create a copy of Broadcast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastCopyWith<Broadcast> get copyWith => _$BroadcastCopyWithImpl<Broadcast>(this as Broadcast, _$identity);

  /// Serializes this Broadcast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Broadcast&&(identical(other.id, id) || other.id == id)&&(identical(other.host, host) || other.host == host)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.coHosts, coHosts)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.county, county) || other.county == county)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.ward, ward) || other.ward == ward)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.participantsCount, participantsCount) || other.participantsCount == participantsCount)&&const DeepCollectionEquality().equals(other.muted, muted)&&(identical(other.isRecorded, isRecorded) || other.isRecorded == isRecorded)&&(identical(other.hasStarted, hasStarted) || other.hasStarted == hasStarted)&&(identical(other.hasEnded, hasEnded) || other.hasEnded == hasEnded)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,host,type,const DeepCollectionEquality().hash(coHosts),title,description,county,constituency,ward,const DeepCollectionEquality().hash(speakers),const DeepCollectionEquality().hash(participants),participantsCount,const DeepCollectionEquality().hash(muted),isRecorded,hasStarted,hasEnded,isActive,startTime,endTime]);

@override
String toString() {
  return 'Broadcast(id: $id, host: $host, type: $type, coHosts: $coHosts, title: $title, description: $description, county: $county, constituency: $constituency, ward: $ward, speakers: $speakers, participants: $participants, participantsCount: $participantsCount, muted: $muted, isRecorded: $isRecorded, hasStarted: $hasStarted, hasEnded: $hasEnded, isActive: $isActive, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $BroadcastCopyWith<$Res>  {
  factory $BroadcastCopyWith(Broadcast value, $Res Function(Broadcast) _then) = _$BroadcastCopyWithImpl;
@useResult
$Res call({
 int id, User host,@BroadcastTypeConverter() BroadcastType type,@JsonKey(name: 'co_hosts') List<User> coHosts, String title, String description, County? county, Constituency? constituency, Ward? ward, List<User> speakers, List<User> participants,@JsonKey(name: 'participants_count') int participantsCount,@JsonKey(name: 'muted') List<int> muted,@JsonKey(name: 'is_recorded') bool isRecorded,@JsonKey(name: 'has_started') bool hasStarted,@JsonKey(name: 'has_ended') bool hasEnded,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime? endTime
});


$UserCopyWith<$Res> get host;$CountyCopyWith<$Res>? get county;$ConstituencyCopyWith<$Res>? get constituency;$WardCopyWith<$Res>? get ward;

}
/// @nodoc
class _$BroadcastCopyWithImpl<$Res>
    implements $BroadcastCopyWith<$Res> {
  _$BroadcastCopyWithImpl(this._self, this._then);

  final Broadcast _self;
  final $Res Function(Broadcast) _then;

/// Create a copy of Broadcast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? host = null,Object? type = null,Object? coHosts = null,Object? title = null,Object? description = null,Object? county = freezed,Object? constituency = freezed,Object? ward = freezed,Object? speakers = null,Object? participants = null,Object? participantsCount = null,Object? muted = null,Object? isRecorded = null,Object? hasStarted = null,Object? hasEnded = null,Object? isActive = null,Object? startTime = null,Object? endTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as User,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BroadcastType,coHosts: null == coHosts ? _self.coHosts : coHosts // ignore: cast_nullable_to_non_nullable
as List<User>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as County?,constituency: freezed == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as Constituency?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as Ward?,speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<User>,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<User>,participantsCount: null == participantsCount ? _self.participantsCount : participantsCount // ignore: cast_nullable_to_non_nullable
as int,muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as List<int>,isRecorded: null == isRecorded ? _self.isRecorded : isRecorded // ignore: cast_nullable_to_non_nullable
as bool,hasStarted: null == hasStarted ? _self.hasStarted : hasStarted // ignore: cast_nullable_to_non_nullable
as bool,hasEnded: null == hasEnded ? _self.hasEnded : hasEnded // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Broadcast
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get host {
  
  return $UserCopyWith<$Res>(_self.host, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of Broadcast
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
}/// Create a copy of Broadcast
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
}/// Create a copy of Broadcast
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


/// Adds pattern-matching-related methods to [Broadcast].
extension BroadcastPatterns on Broadcast {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Broadcast value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Broadcast() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Broadcast value)  $default,){
final _that = this;
switch (_that) {
case _Broadcast():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Broadcast value)?  $default,){
final _that = this;
switch (_that) {
case _Broadcast() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  User host, @BroadcastTypeConverter()  BroadcastType type, @JsonKey(name: 'co_hosts')  List<User> coHosts,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  List<User> speakers,  List<User> participants, @JsonKey(name: 'participants_count')  int participantsCount, @JsonKey(name: 'muted')  List<int> muted, @JsonKey(name: 'is_recorded')  bool isRecorded, @JsonKey(name: 'has_started')  bool hasStarted, @JsonKey(name: 'has_ended')  bool hasEnded, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime? endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Broadcast() when $default != null:
return $default(_that.id,_that.host,_that.type,_that.coHosts,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.speakers,_that.participants,_that.participantsCount,_that.muted,_that.isRecorded,_that.hasStarted,_that.hasEnded,_that.isActive,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  User host, @BroadcastTypeConverter()  BroadcastType type, @JsonKey(name: 'co_hosts')  List<User> coHosts,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  List<User> speakers,  List<User> participants, @JsonKey(name: 'participants_count')  int participantsCount, @JsonKey(name: 'muted')  List<int> muted, @JsonKey(name: 'is_recorded')  bool isRecorded, @JsonKey(name: 'has_started')  bool hasStarted, @JsonKey(name: 'has_ended')  bool hasEnded, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime? endTime)  $default,) {final _that = this;
switch (_that) {
case _Broadcast():
return $default(_that.id,_that.host,_that.type,_that.coHosts,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.speakers,_that.participants,_that.participantsCount,_that.muted,_that.isRecorded,_that.hasStarted,_that.hasEnded,_that.isActive,_that.startTime,_that.endTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  User host, @BroadcastTypeConverter()  BroadcastType type, @JsonKey(name: 'co_hosts')  List<User> coHosts,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  List<User> speakers,  List<User> participants, @JsonKey(name: 'participants_count')  int participantsCount, @JsonKey(name: 'muted')  List<int> muted, @JsonKey(name: 'is_recorded')  bool isRecorded, @JsonKey(name: 'has_started')  bool hasStarted, @JsonKey(name: 'has_ended')  bool hasEnded, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime? endTime)?  $default,) {final _that = this;
switch (_that) {
case _Broadcast() when $default != null:
return $default(_that.id,_that.host,_that.type,_that.coHosts,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.speakers,_that.participants,_that.participantsCount,_that.muted,_that.isRecorded,_that.hasStarted,_that.hasEnded,_that.isActive,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Broadcast implements Broadcast {
  const _Broadcast({required this.id, required this.host, @BroadcastTypeConverter() required this.type, @JsonKey(name: 'co_hosts') required final  List<User> coHosts, required this.title, required this.description, required this.county, required this.constituency, required this.ward, required final  List<User> speakers, required final  List<User> participants, @JsonKey(name: 'participants_count') required this.participantsCount, @JsonKey(name: 'muted') required final  List<int> muted, @JsonKey(name: 'is_recorded') required this.isRecorded, @JsonKey(name: 'has_started') required this.hasStarted, @JsonKey(name: 'has_ended') required this.hasEnded, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime}): _coHosts = coHosts,_speakers = speakers,_participants = participants,_muted = muted;
  factory _Broadcast.fromJson(Map<String, dynamic> json) => _$BroadcastFromJson(json);

@override final  int id;
@override final  User host;
@override@BroadcastTypeConverter() final  BroadcastType type;
 final  List<User> _coHosts;
@override@JsonKey(name: 'co_hosts') List<User> get coHosts {
  if (_coHosts is EqualUnmodifiableListView) return _coHosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coHosts);
}

@override final  String title;
@override final  String description;
@override final  County? county;
@override final  Constituency? constituency;
@override final  Ward? ward;
 final  List<User> _speakers;
@override List<User> get speakers {
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speakers);
}

 final  List<User> _participants;
@override List<User> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override@JsonKey(name: 'participants_count') final  int participantsCount;
 final  List<int> _muted;
@override@JsonKey(name: 'muted') List<int> get muted {
  if (_muted is EqualUnmodifiableListView) return _muted;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_muted);
}

@override@JsonKey(name: 'is_recorded') final  bool isRecorded;
@override@JsonKey(name: 'has_started') final  bool hasStarted;
@override@JsonKey(name: 'has_ended') final  bool hasEnded;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'start_time') final  DateTime startTime;
@override@JsonKey(name: 'end_time') final  DateTime? endTime;

/// Create a copy of Broadcast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastCopyWith<_Broadcast> get copyWith => __$BroadcastCopyWithImpl<_Broadcast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadcastToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Broadcast&&(identical(other.id, id) || other.id == id)&&(identical(other.host, host) || other.host == host)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._coHosts, _coHosts)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.county, county) || other.county == county)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.ward, ward) || other.ward == ward)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.participantsCount, participantsCount) || other.participantsCount == participantsCount)&&const DeepCollectionEquality().equals(other._muted, _muted)&&(identical(other.isRecorded, isRecorded) || other.isRecorded == isRecorded)&&(identical(other.hasStarted, hasStarted) || other.hasStarted == hasStarted)&&(identical(other.hasEnded, hasEnded) || other.hasEnded == hasEnded)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,host,type,const DeepCollectionEquality().hash(_coHosts),title,description,county,constituency,ward,const DeepCollectionEquality().hash(_speakers),const DeepCollectionEquality().hash(_participants),participantsCount,const DeepCollectionEquality().hash(_muted),isRecorded,hasStarted,hasEnded,isActive,startTime,endTime]);

@override
String toString() {
  return 'Broadcast(id: $id, host: $host, type: $type, coHosts: $coHosts, title: $title, description: $description, county: $county, constituency: $constituency, ward: $ward, speakers: $speakers, participants: $participants, participantsCount: $participantsCount, muted: $muted, isRecorded: $isRecorded, hasStarted: $hasStarted, hasEnded: $hasEnded, isActive: $isActive, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$BroadcastCopyWith<$Res> implements $BroadcastCopyWith<$Res> {
  factory _$BroadcastCopyWith(_Broadcast value, $Res Function(_Broadcast) _then) = __$BroadcastCopyWithImpl;
@override @useResult
$Res call({
 int id, User host,@BroadcastTypeConverter() BroadcastType type,@JsonKey(name: 'co_hosts') List<User> coHosts, String title, String description, County? county, Constituency? constituency, Ward? ward, List<User> speakers, List<User> participants,@JsonKey(name: 'participants_count') int participantsCount,@JsonKey(name: 'muted') List<int> muted,@JsonKey(name: 'is_recorded') bool isRecorded,@JsonKey(name: 'has_started') bool hasStarted,@JsonKey(name: 'has_ended') bool hasEnded,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime? endTime
});


@override $UserCopyWith<$Res> get host;@override $CountyCopyWith<$Res>? get county;@override $ConstituencyCopyWith<$Res>? get constituency;@override $WardCopyWith<$Res>? get ward;

}
/// @nodoc
class __$BroadcastCopyWithImpl<$Res>
    implements _$BroadcastCopyWith<$Res> {
  __$BroadcastCopyWithImpl(this._self, this._then);

  final _Broadcast _self;
  final $Res Function(_Broadcast) _then;

/// Create a copy of Broadcast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? host = null,Object? type = null,Object? coHosts = null,Object? title = null,Object? description = null,Object? county = freezed,Object? constituency = freezed,Object? ward = freezed,Object? speakers = null,Object? participants = null,Object? participantsCount = null,Object? muted = null,Object? isRecorded = null,Object? hasStarted = null,Object? hasEnded = null,Object? isActive = null,Object? startTime = null,Object? endTime = freezed,}) {
  return _then(_Broadcast(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as User,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BroadcastType,coHosts: null == coHosts ? _self._coHosts : coHosts // ignore: cast_nullable_to_non_nullable
as List<User>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as County?,constituency: freezed == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as Constituency?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as Ward?,speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<User>,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<User>,participantsCount: null == participantsCount ? _self.participantsCount : participantsCount // ignore: cast_nullable_to_non_nullable
as int,muted: null == muted ? _self._muted : muted // ignore: cast_nullable_to_non_nullable
as List<int>,isRecorded: null == isRecorded ? _self.isRecorded : isRecorded // ignore: cast_nullable_to_non_nullable
as bool,hasStarted: null == hasStarted ? _self.hasStarted : hasStarted // ignore: cast_nullable_to_non_nullable
as bool,hasEnded: null == hasEnded ? _self.hasEnded : hasEnded // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Broadcast
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get host {
  
  return $UserCopyWith<$Res>(_self.host, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of Broadcast
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
}/// Create a copy of Broadcast
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
}/// Create a copy of Broadcast
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

// dart format on
