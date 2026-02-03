// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Meeting {

 int get id; User get host; String get title; String get description; County? get county; Constituency? get constituency; Ward? get ward;@JsonKey(name: 'recent_listeners') List<User> get recentListeners; int get listeners;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'start_time') DateTime get startTime;@JsonKey(name: 'end_time') DateTime get endTime;
/// Create a copy of Meeting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingCopyWith<Meeting> get copyWith => _$MeetingCopyWithImpl<Meeting>(this as Meeting, _$identity);

  /// Serializes this Meeting to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Meeting&&(identical(other.id, id) || other.id == id)&&(identical(other.host, host) || other.host == host)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.county, county) || other.county == county)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.ward, ward) || other.ward == ward)&&const DeepCollectionEquality().equals(other.recentListeners, recentListeners)&&(identical(other.listeners, listeners) || other.listeners == listeners)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,host,title,description,county,constituency,ward,const DeepCollectionEquality().hash(recentListeners),listeners,isActive,startTime,endTime);

@override
String toString() {
  return 'Meeting(id: $id, host: $host, title: $title, description: $description, county: $county, constituency: $constituency, ward: $ward, recentListeners: $recentListeners, listeners: $listeners, isActive: $isActive, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $MeetingCopyWith<$Res>  {
  factory $MeetingCopyWith(Meeting value, $Res Function(Meeting) _then) = _$MeetingCopyWithImpl;
@useResult
$Res call({
 int id, User host, String title, String description, County? county, Constituency? constituency, Ward? ward,@JsonKey(name: 'recent_listeners') List<User> recentListeners, int listeners,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime
});


$UserCopyWith<$Res> get host;$CountyCopyWith<$Res>? get county;$ConstituencyCopyWith<$Res>? get constituency;$WardCopyWith<$Res>? get ward;

}
/// @nodoc
class _$MeetingCopyWithImpl<$Res>
    implements $MeetingCopyWith<$Res> {
  _$MeetingCopyWithImpl(this._self, this._then);

  final Meeting _self;
  final $Res Function(Meeting) _then;

/// Create a copy of Meeting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? host = null,Object? title = null,Object? description = null,Object? county = freezed,Object? constituency = freezed,Object? ward = freezed,Object? recentListeners = null,Object? listeners = null,Object? isActive = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as User,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as County?,constituency: freezed == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as Constituency?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as Ward?,recentListeners: null == recentListeners ? _self.recentListeners : recentListeners // ignore: cast_nullable_to_non_nullable
as List<User>,listeners: null == listeners ? _self.listeners : listeners // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Meeting
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get host {
  
  return $UserCopyWith<$Res>(_self.host, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of Meeting
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
}/// Create a copy of Meeting
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
}/// Create a copy of Meeting
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


/// Adds pattern-matching-related methods to [Meeting].
extension MeetingPatterns on Meeting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Meeting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Meeting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Meeting value)  $default,){
final _that = this;
switch (_that) {
case _Meeting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Meeting value)?  $default,){
final _that = this;
switch (_that) {
case _Meeting() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  User host,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward, @JsonKey(name: 'recent_listeners')  List<User> recentListeners,  int listeners, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Meeting() when $default != null:
return $default(_that.id,_that.host,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.recentListeners,_that.listeners,_that.isActive,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  User host,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward, @JsonKey(name: 'recent_listeners')  List<User> recentListeners,  int listeners, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime)  $default,) {final _that = this;
switch (_that) {
case _Meeting():
return $default(_that.id,_that.host,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.recentListeners,_that.listeners,_that.isActive,_that.startTime,_that.endTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  User host,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward, @JsonKey(name: 'recent_listeners')  List<User> recentListeners,  int listeners, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime)?  $default,) {final _that = this;
switch (_that) {
case _Meeting() when $default != null:
return $default(_that.id,_that.host,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.recentListeners,_that.listeners,_that.isActive,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Meeting implements Meeting {
  const _Meeting({required this.id, required this.host, required this.title, required this.description, required this.county, required this.constituency, required this.ward, @JsonKey(name: 'recent_listeners') required final  List<User> recentListeners, required this.listeners, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime}): _recentListeners = recentListeners;
  factory _Meeting.fromJson(Map<String, dynamic> json) => _$MeetingFromJson(json);

@override final  int id;
@override final  User host;
@override final  String title;
@override final  String description;
@override final  County? county;
@override final  Constituency? constituency;
@override final  Ward? ward;
 final  List<User> _recentListeners;
@override@JsonKey(name: 'recent_listeners') List<User> get recentListeners {
  if (_recentListeners is EqualUnmodifiableListView) return _recentListeners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentListeners);
}

@override final  int listeners;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'start_time') final  DateTime startTime;
@override@JsonKey(name: 'end_time') final  DateTime endTime;

/// Create a copy of Meeting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeetingCopyWith<_Meeting> get copyWith => __$MeetingCopyWithImpl<_Meeting>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeetingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meeting&&(identical(other.id, id) || other.id == id)&&(identical(other.host, host) || other.host == host)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.county, county) || other.county == county)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.ward, ward) || other.ward == ward)&&const DeepCollectionEquality().equals(other._recentListeners, _recentListeners)&&(identical(other.listeners, listeners) || other.listeners == listeners)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,host,title,description,county,constituency,ward,const DeepCollectionEquality().hash(_recentListeners),listeners,isActive,startTime,endTime);

@override
String toString() {
  return 'Meeting(id: $id, host: $host, title: $title, description: $description, county: $county, constituency: $constituency, ward: $ward, recentListeners: $recentListeners, listeners: $listeners, isActive: $isActive, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$MeetingCopyWith<$Res> implements $MeetingCopyWith<$Res> {
  factory _$MeetingCopyWith(_Meeting value, $Res Function(_Meeting) _then) = __$MeetingCopyWithImpl;
@override @useResult
$Res call({
 int id, User host, String title, String description, County? county, Constituency? constituency, Ward? ward,@JsonKey(name: 'recent_listeners') List<User> recentListeners, int listeners,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime
});


@override $UserCopyWith<$Res> get host;@override $CountyCopyWith<$Res>? get county;@override $ConstituencyCopyWith<$Res>? get constituency;@override $WardCopyWith<$Res>? get ward;

}
/// @nodoc
class __$MeetingCopyWithImpl<$Res>
    implements _$MeetingCopyWith<$Res> {
  __$MeetingCopyWithImpl(this._self, this._then);

  final _Meeting _self;
  final $Res Function(_Meeting) _then;

/// Create a copy of Meeting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? host = null,Object? title = null,Object? description = null,Object? county = freezed,Object? constituency = freezed,Object? ward = freezed,Object? recentListeners = null,Object? listeners = null,Object? isActive = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_Meeting(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as User,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as County?,constituency: freezed == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as Constituency?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as Ward?,recentListeners: null == recentListeners ? _self._recentListeners : recentListeners // ignore: cast_nullable_to_non_nullable
as List<User>,listeners: null == listeners ? _self.listeners : listeners // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Meeting
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get host {
  
  return $UserCopyWith<$Res>(_self.host, (value) {
    return _then(_self.copyWith(host: value));
  });
}/// Create a copy of Meeting
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
}/// Create a copy of Meeting
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
}/// Create a copy of Meeting
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
