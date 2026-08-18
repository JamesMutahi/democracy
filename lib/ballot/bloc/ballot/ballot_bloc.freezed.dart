// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ballot_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BallotEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BallotEvent()';
}


}

/// @nodoc
class $BallotEventCopyWith<$Res>  {
$BallotEventCopyWith(BallotEvent _, $Res Function(BallotEvent) __);
}


/// Adds pattern-matching-related methods to [BallotEvent].
extension BallotEventPatterns on BallotEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Loaded value)?  loaded,TResult Function( _BallotDetailUpdated value)?  ballotDetailUpdated,TResult Function( _VotedOptionUpdated value)?  votedOptionUpdated,TResult Function( _ReasonUpdated value)?  reasonUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Loaded() when loaded != null:
return loaded(_that);case _BallotDetailUpdated() when ballotDetailUpdated != null:
return ballotDetailUpdated(_that);case _VotedOptionUpdated() when votedOptionUpdated != null:
return votedOptionUpdated(_that);case _ReasonUpdated() when reasonUpdated != null:
return reasonUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Loaded value)  loaded,required TResult Function( _BallotDetailUpdated value)  ballotDetailUpdated,required TResult Function( _VotedOptionUpdated value)  votedOptionUpdated,required TResult Function( _ReasonUpdated value)  reasonUpdated,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Loaded():
return loaded(_that);case _BallotDetailUpdated():
return ballotDetailUpdated(_that);case _VotedOptionUpdated():
return votedOptionUpdated(_that);case _ReasonUpdated():
return reasonUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Loaded value)?  loaded,TResult? Function( _BallotDetailUpdated value)?  ballotDetailUpdated,TResult? Function( _VotedOptionUpdated value)?  votedOptionUpdated,TResult? Function( _ReasonUpdated value)?  reasonUpdated,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Loaded() when loaded != null:
return loaded(_that);case _BallotDetailUpdated() when ballotDetailUpdated != null:
return ballotDetailUpdated(_that);case _VotedOptionUpdated() when votedOptionUpdated != null:
return votedOptionUpdated(_that);case _ReasonUpdated() when reasonUpdated != null:
return reasonUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int ballotId)?  load,TResult Function( Map<String, dynamic> payload)?  loaded,TResult Function( String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  DateTime startTime,  DateTime endTime,  bool hasStarted,  bool hasEnded,  int totalVotes,  List<Option> options,  bool isActive)?  ballotDetailUpdated,TResult Function( int votedOptionId)?  votedOptionUpdated,TResult Function( String? reason)?  reasonUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.ballotId);case _Loaded() when loaded != null:
return loaded(_that.payload);case _BallotDetailUpdated() when ballotDetailUpdated != null:
return ballotDetailUpdated(_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.startTime,_that.endTime,_that.hasStarted,_that.hasEnded,_that.totalVotes,_that.options,_that.isActive);case _VotedOptionUpdated() when votedOptionUpdated != null:
return votedOptionUpdated(_that.votedOptionId);case _ReasonUpdated() when reasonUpdated != null:
return reasonUpdated(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int ballotId)  load,required TResult Function( Map<String, dynamic> payload)  loaded,required TResult Function( String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  DateTime startTime,  DateTime endTime,  bool hasStarted,  bool hasEnded,  int totalVotes,  List<Option> options,  bool isActive)  ballotDetailUpdated,required TResult Function( int votedOptionId)  votedOptionUpdated,required TResult Function( String? reason)  reasonUpdated,}) {final _that = this;
switch (_that) {
case _Load():
return load(_that.ballotId);case _Loaded():
return loaded(_that.payload);case _BallotDetailUpdated():
return ballotDetailUpdated(_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.startTime,_that.endTime,_that.hasStarted,_that.hasEnded,_that.totalVotes,_that.options,_that.isActive);case _VotedOptionUpdated():
return votedOptionUpdated(_that.votedOptionId);case _ReasonUpdated():
return reasonUpdated(_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int ballotId)?  load,TResult? Function( Map<String, dynamic> payload)?  loaded,TResult? Function( String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  DateTime startTime,  DateTime endTime,  bool hasStarted,  bool hasEnded,  int totalVotes,  List<Option> options,  bool isActive)?  ballotDetailUpdated,TResult? Function( int votedOptionId)?  votedOptionUpdated,TResult? Function( String? reason)?  reasonUpdated,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.ballotId);case _Loaded() when loaded != null:
return loaded(_that.payload);case _BallotDetailUpdated() when ballotDetailUpdated != null:
return ballotDetailUpdated(_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.startTime,_that.endTime,_that.hasStarted,_that.hasEnded,_that.totalVotes,_that.options,_that.isActive);case _VotedOptionUpdated() when votedOptionUpdated != null:
return votedOptionUpdated(_that.votedOptionId);case _ReasonUpdated() when reasonUpdated != null:
return reasonUpdated(_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements BallotEvent {
  const _Load({required this.ballotId});
  

 final  int ballotId;

/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCopyWith<_Load> get copyWith => __$LoadCopyWithImpl<_Load>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load&&(identical(other.ballotId, ballotId) || other.ballotId == ballotId));
}


@override
int get hashCode => Object.hash(runtimeType,ballotId);

@override
String toString() {
  return 'BallotEvent.load(ballotId: $ballotId)';
}


}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res> implements $BallotEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) = __$LoadCopyWithImpl;
@useResult
$Res call({
 int ballotId
});




}
/// @nodoc
class __$LoadCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ballotId = null,}) {
  return _then(_Load(
ballotId: null == ballotId ? _self.ballotId : ballotId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Loaded implements BallotEvent {
  const _Loaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'BallotEvent.loaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $BallotEventCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Loaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _BallotDetailUpdated implements BallotEvent {
  const _BallotDetailUpdated({required this.title, required this.description, required this.county, required this.constituency, required this.ward, required this.startTime, required this.endTime, required this.hasStarted, required this.hasEnded, required this.totalVotes, required final  List<Option> options, required this.isActive}): _options = options;
  

 final  String title;
 final  String description;
 final  County? county;
 final  Constituency? constituency;
 final  Ward? ward;
 final  DateTime startTime;
 final  DateTime endTime;
 final  bool hasStarted;
 final  bool hasEnded;
 final  int totalVotes;
 final  List<Option> _options;
 List<Option> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  bool isActive;

/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BallotDetailUpdatedCopyWith<_BallotDetailUpdated> get copyWith => __$BallotDetailUpdatedCopyWithImpl<_BallotDetailUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BallotDetailUpdated&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.county, county) || other.county == county)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.hasStarted, hasStarted) || other.hasStarted == hasStarted)&&(identical(other.hasEnded, hasEnded) || other.hasEnded == hasEnded)&&(identical(other.totalVotes, totalVotes) || other.totalVotes == totalVotes)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,county,constituency,ward,startTime,endTime,hasStarted,hasEnded,totalVotes,const DeepCollectionEquality().hash(_options),isActive);

@override
String toString() {
  return 'BallotEvent.ballotDetailUpdated(title: $title, description: $description, county: $county, constituency: $constituency, ward: $ward, startTime: $startTime, endTime: $endTime, hasStarted: $hasStarted, hasEnded: $hasEnded, totalVotes: $totalVotes, options: $options, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$BallotDetailUpdatedCopyWith<$Res> implements $BallotEventCopyWith<$Res> {
  factory _$BallotDetailUpdatedCopyWith(_BallotDetailUpdated value, $Res Function(_BallotDetailUpdated) _then) = __$BallotDetailUpdatedCopyWithImpl;
@useResult
$Res call({
 String title, String description, County? county, Constituency? constituency, Ward? ward, DateTime startTime, DateTime endTime, bool hasStarted, bool hasEnded, int totalVotes, List<Option> options, bool isActive
});


$CountyCopyWith<$Res>? get county;$ConstituencyCopyWith<$Res>? get constituency;$WardCopyWith<$Res>? get ward;

}
/// @nodoc
class __$BallotDetailUpdatedCopyWithImpl<$Res>
    implements _$BallotDetailUpdatedCopyWith<$Res> {
  __$BallotDetailUpdatedCopyWithImpl(this._self, this._then);

  final _BallotDetailUpdated _self;
  final $Res Function(_BallotDetailUpdated) _then;

/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? county = freezed,Object? constituency = freezed,Object? ward = freezed,Object? startTime = null,Object? endTime = null,Object? hasStarted = null,Object? hasEnded = null,Object? totalVotes = null,Object? options = null,Object? isActive = null,}) {
  return _then(_BallotDetailUpdated(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as County?,constituency: freezed == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as Constituency?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as Ward?,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,hasStarted: null == hasStarted ? _self.hasStarted : hasStarted // ignore: cast_nullable_to_non_nullable
as bool,hasEnded: null == hasEnded ? _self.hasEnded : hasEnded // ignore: cast_nullable_to_non_nullable
as bool,totalVotes: null == totalVotes ? _self.totalVotes : totalVotes // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<Option>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of BallotEvent
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
}/// Create a copy of BallotEvent
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
}/// Create a copy of BallotEvent
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


class _VotedOptionUpdated implements BallotEvent {
  const _VotedOptionUpdated({required this.votedOptionId});
  

 final  int votedOptionId;

/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VotedOptionUpdatedCopyWith<_VotedOptionUpdated> get copyWith => __$VotedOptionUpdatedCopyWithImpl<_VotedOptionUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VotedOptionUpdated&&(identical(other.votedOptionId, votedOptionId) || other.votedOptionId == votedOptionId));
}


@override
int get hashCode => Object.hash(runtimeType,votedOptionId);

@override
String toString() {
  return 'BallotEvent.votedOptionUpdated(votedOptionId: $votedOptionId)';
}


}

/// @nodoc
abstract mixin class _$VotedOptionUpdatedCopyWith<$Res> implements $BallotEventCopyWith<$Res> {
  factory _$VotedOptionUpdatedCopyWith(_VotedOptionUpdated value, $Res Function(_VotedOptionUpdated) _then) = __$VotedOptionUpdatedCopyWithImpl;
@useResult
$Res call({
 int votedOptionId
});




}
/// @nodoc
class __$VotedOptionUpdatedCopyWithImpl<$Res>
    implements _$VotedOptionUpdatedCopyWith<$Res> {
  __$VotedOptionUpdatedCopyWithImpl(this._self, this._then);

  final _VotedOptionUpdated _self;
  final $Res Function(_VotedOptionUpdated) _then;

/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? votedOptionId = null,}) {
  return _then(_VotedOptionUpdated(
votedOptionId: null == votedOptionId ? _self.votedOptionId : votedOptionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReasonUpdated implements BallotEvent {
  const _ReasonUpdated({required this.reason});
  

 final  String? reason;

/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReasonUpdatedCopyWith<_ReasonUpdated> get copyWith => __$ReasonUpdatedCopyWithImpl<_ReasonUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReasonUpdated&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'BallotEvent.reasonUpdated(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$ReasonUpdatedCopyWith<$Res> implements $BallotEventCopyWith<$Res> {
  factory _$ReasonUpdatedCopyWith(_ReasonUpdated value, $Res Function(_ReasonUpdated) _then) = __$ReasonUpdatedCopyWithImpl;
@useResult
$Res call({
 String? reason
});




}
/// @nodoc
class __$ReasonUpdatedCopyWithImpl<$Res>
    implements _$ReasonUpdatedCopyWith<$Res> {
  __$ReasonUpdatedCopyWithImpl(this._self, this._then);

  final _ReasonUpdated _self;
  final $Res Function(_ReasonUpdated) _then;

/// Create a copy of BallotEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = freezed,}) {
  return _then(_ReasonUpdated(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
