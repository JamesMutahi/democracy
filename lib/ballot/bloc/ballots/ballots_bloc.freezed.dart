// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ballots_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BallotsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BallotsEvent()';
}


}

/// @nodoc
class $BallotsEventCopyWith<$Res>  {
$BallotsEventCopyWith(BallotsEvent _, $Res Function(BallotsEvent) __);
}


/// Adds pattern-matching-related methods to [BallotsEvent].
extension BallotsEventPatterns on BallotsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? searchTerm,  Ballot? lastBallot,  bool? isActive,  String? sortBy,  bool? filterByRegion,  DateTime? startDate,  DateTime? endDate)?  get,TResult Function( Map<String, dynamic> payload)?  received,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.searchTerm,_that.lastBallot,_that.isActive,_that.sortBy,_that.filterByRegion,_that.startDate,_that.endDate);case _Received() when received != null:
return received(_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? searchTerm,  Ballot? lastBallot,  bool? isActive,  String? sortBy,  bool? filterByRegion,  DateTime? startDate,  DateTime? endDate)  get,required TResult Function( Map<String, dynamic> payload)  received,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.searchTerm,_that.lastBallot,_that.isActive,_that.sortBy,_that.filterByRegion,_that.startDate,_that.endDate);case _Received():
return received(_that.payload);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? searchTerm,  Ballot? lastBallot,  bool? isActive,  String? sortBy,  bool? filterByRegion,  DateTime? startDate,  DateTime? endDate)?  get,TResult? Function( Map<String, dynamic> payload)?  received,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.searchTerm,_that.lastBallot,_that.isActive,_that.sortBy,_that.filterByRegion,_that.startDate,_that.endDate);case _Received() when received != null:
return received(_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements BallotsEvent {
  const _Get({this.searchTerm, this.lastBallot, this.isActive, this.sortBy, this.filterByRegion, this.startDate, this.endDate});
  

 final  String? searchTerm;
 final  Ballot? lastBallot;
 final  bool? isActive;
 final  String? sortBy;
 final  bool? filterByRegion;
 final  DateTime? startDate;
 final  DateTime? endDate;

/// Create a copy of BallotsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.lastBallot, lastBallot) || other.lastBallot == lastBallot)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.filterByRegion, filterByRegion) || other.filterByRegion == filterByRegion)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,lastBallot,isActive,sortBy,filterByRegion,startDate,endDate);

@override
String toString() {
  return 'BallotsEvent.get(searchTerm: $searchTerm, lastBallot: $lastBallot, isActive: $isActive, sortBy: $sortBy, filterByRegion: $filterByRegion, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $BallotsEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, Ballot? lastBallot, bool? isActive, String? sortBy, bool? filterByRegion, DateTime? startDate, DateTime? endDate
});


$BallotCopyWith<$Res>? get lastBallot;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of BallotsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? lastBallot = freezed,Object? isActive = freezed,Object? sortBy = freezed,Object? filterByRegion = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_Get(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,lastBallot: freezed == lastBallot ? _self.lastBallot : lastBallot // ignore: cast_nullable_to_non_nullable
as Ballot?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,filterByRegion: freezed == filterByRegion ? _self.filterByRegion : filterByRegion // ignore: cast_nullable_to_non_nullable
as bool?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of BallotsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res>? get lastBallot {
    if (_self.lastBallot == null) {
    return null;
  }

  return $BallotCopyWith<$Res>(_self.lastBallot!, (value) {
    return _then(_self.copyWith(lastBallot: value));
  });
}
}

/// @nodoc


class _Received implements BallotsEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BallotsEvent
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
  return 'BallotsEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $BallotsEventCopyWith<$Res> {
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

/// Create a copy of BallotsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
