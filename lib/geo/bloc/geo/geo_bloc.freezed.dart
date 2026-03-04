// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeoEvent()';
}


}

/// @nodoc
class $GeoEventCopyWith<$Res>  {
$GeoEventCopyWith(GeoEvent _, $Res Function(GeoEvent) __);
}


/// Adds pattern-matching-related methods to [GeoEvent].
extension GeoEventPatterns on GeoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetCounties value)?  getCounties,TResult Function( _GetConstituencies value)?  getConstituencies,TResult Function( _GetWards value)?  getWards,TResult Function( _ReceivedCounties value)?  receivedCounties,TResult Function( _ReceivedConstituencies value)?  receivedConstituencies,TResult Function( _ReceivedWards value)?  receivedWards,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCounties() when getCounties != null:
return getCounties(_that);case _GetConstituencies() when getConstituencies != null:
return getConstituencies(_that);case _GetWards() when getWards != null:
return getWards(_that);case _ReceivedCounties() when receivedCounties != null:
return receivedCounties(_that);case _ReceivedConstituencies() when receivedConstituencies != null:
return receivedConstituencies(_that);case _ReceivedWards() when receivedWards != null:
return receivedWards(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetCounties value)  getCounties,required TResult Function( _GetConstituencies value)  getConstituencies,required TResult Function( _GetWards value)  getWards,required TResult Function( _ReceivedCounties value)  receivedCounties,required TResult Function( _ReceivedConstituencies value)  receivedConstituencies,required TResult Function( _ReceivedWards value)  receivedWards,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetCounties():
return getCounties(_that);case _GetConstituencies():
return getConstituencies(_that);case _GetWards():
return getWards(_that);case _ReceivedCounties():
return receivedCounties(_that);case _ReceivedConstituencies():
return receivedConstituencies(_that);case _ReceivedWards():
return receivedWards(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetCounties value)?  getCounties,TResult? Function( _GetConstituencies value)?  getConstituencies,TResult? Function( _GetWards value)?  getWards,TResult? Function( _ReceivedCounties value)?  receivedCounties,TResult? Function( _ReceivedConstituencies value)?  receivedConstituencies,TResult? Function( _ReceivedWards value)?  receivedWards,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCounties() when getCounties != null:
return getCounties(_that);case _GetConstituencies() when getConstituencies != null:
return getConstituencies(_that);case _GetWards() when getWards != null:
return getWards(_that);case _ReceivedCounties() when receivedCounties != null:
return receivedCounties(_that);case _ReceivedConstituencies() when receivedConstituencies != null:
return receivedConstituencies(_that);case _ReceivedWards() when receivedWards != null:
return receivedWards(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getCounties,TResult Function( County county)?  getConstituencies,TResult Function( Constituency constituency)?  getWards,TResult Function( Map<String, dynamic> payload)?  receivedCounties,TResult Function( Map<String, dynamic> payload)?  receivedConstituencies,TResult Function( Map<String, dynamic> payload)?  receivedWards,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCounties() when getCounties != null:
return getCounties();case _GetConstituencies() when getConstituencies != null:
return getConstituencies(_that.county);case _GetWards() when getWards != null:
return getWards(_that.constituency);case _ReceivedCounties() when receivedCounties != null:
return receivedCounties(_that.payload);case _ReceivedConstituencies() when receivedConstituencies != null:
return receivedConstituencies(_that.payload);case _ReceivedWards() when receivedWards != null:
return receivedWards(_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getCounties,required TResult Function( County county)  getConstituencies,required TResult Function( Constituency constituency)  getWards,required TResult Function( Map<String, dynamic> payload)  receivedCounties,required TResult Function( Map<String, dynamic> payload)  receivedConstituencies,required TResult Function( Map<String, dynamic> payload)  receivedWards,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetCounties():
return getCounties();case _GetConstituencies():
return getConstituencies(_that.county);case _GetWards():
return getWards(_that.constituency);case _ReceivedCounties():
return receivedCounties(_that.payload);case _ReceivedConstituencies():
return receivedConstituencies(_that.payload);case _ReceivedWards():
return receivedWards(_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getCounties,TResult? Function( County county)?  getConstituencies,TResult? Function( Constituency constituency)?  getWards,TResult? Function( Map<String, dynamic> payload)?  receivedCounties,TResult? Function( Map<String, dynamic> payload)?  receivedConstituencies,TResult? Function( Map<String, dynamic> payload)?  receivedWards,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCounties() when getCounties != null:
return getCounties();case _GetConstituencies() when getConstituencies != null:
return getConstituencies(_that.county);case _GetWards() when getWards != null:
return getWards(_that.constituency);case _ReceivedCounties() when receivedCounties != null:
return receivedCounties(_that.payload);case _ReceivedConstituencies() when receivedConstituencies != null:
return receivedConstituencies(_that.payload);case _ReceivedWards() when receivedWards != null:
return receivedWards(_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GeoEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeoEvent.started()';
}


}




/// @nodoc


class _GetCounties implements GeoEvent {
  const _GetCounties();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCounties);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeoEvent.getCounties()';
}


}




/// @nodoc


class _GetConstituencies implements GeoEvent {
  const _GetConstituencies({required this.county});
  

 final  County county;

/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetConstituenciesCopyWith<_GetConstituencies> get copyWith => __$GetConstituenciesCopyWithImpl<_GetConstituencies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConstituencies&&(identical(other.county, county) || other.county == county));
}


@override
int get hashCode => Object.hash(runtimeType,county);

@override
String toString() {
  return 'GeoEvent.getConstituencies(county: $county)';
}


}

/// @nodoc
abstract mixin class _$GetConstituenciesCopyWith<$Res> implements $GeoEventCopyWith<$Res> {
  factory _$GetConstituenciesCopyWith(_GetConstituencies value, $Res Function(_GetConstituencies) _then) = __$GetConstituenciesCopyWithImpl;
@useResult
$Res call({
 County county
});


$CountyCopyWith<$Res> get county;

}
/// @nodoc
class __$GetConstituenciesCopyWithImpl<$Res>
    implements _$GetConstituenciesCopyWith<$Res> {
  __$GetConstituenciesCopyWithImpl(this._self, this._then);

  final _GetConstituencies _self;
  final $Res Function(_GetConstituencies) _then;

/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? county = null,}) {
  return _then(_GetConstituencies(
county: null == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as County,
  ));
}

/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountyCopyWith<$Res> get county {
  
  return $CountyCopyWith<$Res>(_self.county, (value) {
    return _then(_self.copyWith(county: value));
  });
}
}

/// @nodoc


class _GetWards implements GeoEvent {
  const _GetWards({required this.constituency});
  

 final  Constituency constituency;

/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetWardsCopyWith<_GetWards> get copyWith => __$GetWardsCopyWithImpl<_GetWards>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetWards&&(identical(other.constituency, constituency) || other.constituency == constituency));
}


@override
int get hashCode => Object.hash(runtimeType,constituency);

@override
String toString() {
  return 'GeoEvent.getWards(constituency: $constituency)';
}


}

/// @nodoc
abstract mixin class _$GetWardsCopyWith<$Res> implements $GeoEventCopyWith<$Res> {
  factory _$GetWardsCopyWith(_GetWards value, $Res Function(_GetWards) _then) = __$GetWardsCopyWithImpl;
@useResult
$Res call({
 Constituency constituency
});


$ConstituencyCopyWith<$Res> get constituency;

}
/// @nodoc
class __$GetWardsCopyWithImpl<$Res>
    implements _$GetWardsCopyWith<$Res> {
  __$GetWardsCopyWithImpl(this._self, this._then);

  final _GetWards _self;
  final $Res Function(_GetWards) _then;

/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? constituency = null,}) {
  return _then(_GetWards(
constituency: null == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as Constituency,
  ));
}

/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConstituencyCopyWith<$Res> get constituency {
  
  return $ConstituencyCopyWith<$Res>(_self.constituency, (value) {
    return _then(_self.copyWith(constituency: value));
  });
}
}

/// @nodoc


class _ReceivedCounties implements GeoEvent {
  const _ReceivedCounties({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceivedCountiesCopyWith<_ReceivedCounties> get copyWith => __$ReceivedCountiesCopyWithImpl<_ReceivedCounties>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceivedCounties&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'GeoEvent.receivedCounties(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCountiesCopyWith<$Res> implements $GeoEventCopyWith<$Res> {
  factory _$ReceivedCountiesCopyWith(_ReceivedCounties value, $Res Function(_ReceivedCounties) _then) = __$ReceivedCountiesCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$ReceivedCountiesCopyWithImpl<$Res>
    implements _$ReceivedCountiesCopyWith<$Res> {
  __$ReceivedCountiesCopyWithImpl(this._self, this._then);

  final _ReceivedCounties _self;
  final $Res Function(_ReceivedCounties) _then;

/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_ReceivedCounties(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _ReceivedConstituencies implements GeoEvent {
  const _ReceivedConstituencies({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceivedConstituenciesCopyWith<_ReceivedConstituencies> get copyWith => __$ReceivedConstituenciesCopyWithImpl<_ReceivedConstituencies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceivedConstituencies&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'GeoEvent.receivedConstituencies(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedConstituenciesCopyWith<$Res> implements $GeoEventCopyWith<$Res> {
  factory _$ReceivedConstituenciesCopyWith(_ReceivedConstituencies value, $Res Function(_ReceivedConstituencies) _then) = __$ReceivedConstituenciesCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$ReceivedConstituenciesCopyWithImpl<$Res>
    implements _$ReceivedConstituenciesCopyWith<$Res> {
  __$ReceivedConstituenciesCopyWithImpl(this._self, this._then);

  final _ReceivedConstituencies _self;
  final $Res Function(_ReceivedConstituencies) _then;

/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_ReceivedConstituencies(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _ReceivedWards implements GeoEvent {
  const _ReceivedWards({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceivedWardsCopyWith<_ReceivedWards> get copyWith => __$ReceivedWardsCopyWithImpl<_ReceivedWards>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceivedWards&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'GeoEvent.receivedWards(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedWardsCopyWith<$Res> implements $GeoEventCopyWith<$Res> {
  factory _$ReceivedWardsCopyWith(_ReceivedWards value, $Res Function(_ReceivedWards) _then) = __$ReceivedWardsCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$ReceivedWardsCopyWithImpl<$Res>
    implements _$ReceivedWardsCopyWith<$Res> {
  __$ReceivedWardsCopyWithImpl(this._self, this._then);

  final _ReceivedWards _self;
  final $Res Function(_ReceivedWards) _then;

/// Create a copy of GeoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_ReceivedWards(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
