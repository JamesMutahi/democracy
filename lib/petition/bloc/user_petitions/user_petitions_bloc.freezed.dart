// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_petitions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPetitionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPetitionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPetitionsEvent()';
}


}

/// @nodoc
class $UserPetitionsEventCopyWith<$Res>  {
$UserPetitionsEventCopyWith(UserPetitionsEvent _, $Res Function(UserPetitionsEvent) __);
}


/// Adds pattern-matching-related methods to [UserPetitionsEvent].
extension UserPetitionsEventPatterns on UserPetitionsEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( User user,  List<Petition>? previousPetitions)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( Petition petition)?  add,TResult Function( Petition petition)?  update,TResult Function( int petitionId)?  remove,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.user,_that.previousPetitions);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.petition);case _Update() when update != null:
return update(_that.petition);case _Remove() when remove != null:
return remove(_that.petitionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( User user,  List<Petition>? previousPetitions)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( Petition petition)  add,required TResult Function( Petition petition)  update,required TResult Function( int petitionId)  remove,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.user,_that.previousPetitions);case _Received():
return received(_that.payload);case _Add():
return add(_that.petition);case _Update():
return update(_that.petition);case _Remove():
return remove(_that.petitionId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( User user,  List<Petition>? previousPetitions)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( Petition petition)?  add,TResult? Function( Petition petition)?  update,TResult? Function( int petitionId)?  remove,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.user,_that.previousPetitions);case _Received() when received != null:
return received(_that.payload);case _Add() when add != null:
return add(_that.petition);case _Update() when update != null:
return update(_that.petition);case _Remove() when remove != null:
return remove(_that.petitionId);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements UserPetitionsEvent {
  const _Get({required this.user, final  List<Petition>? previousPetitions}): _previousPetitions = previousPetitions;
  

 final  User user;
 final  List<Petition>? _previousPetitions;
 List<Petition>? get previousPetitions {
  final value = _previousPetitions;
  if (value == null) return null;
  if (_previousPetitions is EqualUnmodifiableListView) return _previousPetitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._previousPetitions, _previousPetitions));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_previousPetitions));

@override
String toString() {
  return 'UserPetitionsEvent.get(user: $user, previousPetitions: $previousPetitions)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $UserPetitionsEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 User user, List<Petition>? previousPetitions
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? previousPetitions = freezed,}) {
  return _then(_Get(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,previousPetitions: freezed == previousPetitions ? _self._previousPetitions : previousPetitions // ignore: cast_nullable_to_non_nullable
as List<Petition>?,
  ));
}

/// Create a copy of UserPetitionsEvent
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


class _Received implements UserPetitionsEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of UserPetitionsEvent
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
  return 'UserPetitionsEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $UserPetitionsEventCopyWith<$Res> {
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

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Add implements UserPetitionsEvent {
  const _Add({required this.petition});
  

 final  Petition petition;

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCopyWith<_Add> get copyWith => __$AddCopyWithImpl<_Add>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Add&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'UserPetitionsEvent.add(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res> implements $UserPetitionsEventCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) = __$AddCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$AddCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_Add(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _Update implements UserPetitionsEvent {
  const _Update({required this.petition});
  

 final  Petition petition;

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'UserPetitionsEvent.update(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $UserPetitionsEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_Update(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _Remove implements UserPetitionsEvent {
  const _Remove({required this.petitionId});
  

 final  int petitionId;

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCopyWith<_Remove> get copyWith => __$RemoveCopyWithImpl<_Remove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Remove&&(identical(other.petitionId, petitionId) || other.petitionId == petitionId));
}


@override
int get hashCode => Object.hash(runtimeType,petitionId);

@override
String toString() {
  return 'UserPetitionsEvent.remove(petitionId: $petitionId)';
}


}

/// @nodoc
abstract mixin class _$RemoveCopyWith<$Res> implements $UserPetitionsEventCopyWith<$Res> {
  factory _$RemoveCopyWith(_Remove value, $Res Function(_Remove) _then) = __$RemoveCopyWithImpl;
@useResult
$Res call({
 int petitionId
});




}
/// @nodoc
class __$RemoveCopyWithImpl<$Res>
    implements _$RemoveCopyWith<$Res> {
  __$RemoveCopyWithImpl(this._self, this._then);

  final _Remove _self;
  final $Res Function(_Remove) _then;

/// Create a copy of UserPetitionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petitionId = null,}) {
  return _then(_Remove(
petitionId: null == petitionId ? _self.petitionId : petitionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
