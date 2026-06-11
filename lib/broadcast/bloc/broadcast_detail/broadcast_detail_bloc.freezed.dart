// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'broadcast_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BroadcastDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BroadcastDetailEvent()';
}


}

/// @nodoc
class $BroadcastDetailEventCopyWith<$Res>  {
$BroadcastDetailEventCopyWith(BroadcastDetailEvent _, $Res Function(BroadcastDetailEvent) __);
}


/// Adds pattern-matching-related methods to [BroadcastDetailEvent].
extension BroadcastDetailEventPatterns on BroadcastDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Created value)?  created,TResult Function( _Loaded value)?  loaded,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,TResult Function( _Create value)?  create,TResult Function( _Join value)?  join,TResult Function( _Retrieve value)?  retrieve,TResult Function( _Subscribe value)?  subscribe,TResult Function( _Unsubscribe value)?  unsubscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Create() when create != null:
return create(_that);case _Join() when join != null:
return join(_that);case _Retrieve() when retrieve != null:
return retrieve(_that);case _Subscribe() when subscribe != null:
return subscribe(_that);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Created value)  created,required TResult Function( _Loaded value)  loaded,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,required TResult Function( _Create value)  create,required TResult Function( _Join value)  join,required TResult Function( _Retrieve value)  retrieve,required TResult Function( _Subscribe value)  subscribe,required TResult Function( _Unsubscribe value)  unsubscribe,}){
final _that = this;
switch (_that) {
case _Created():
return created(_that);case _Loaded():
return loaded(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);case _Create():
return create(_that);case _Join():
return join(_that);case _Retrieve():
return retrieve(_that);case _Subscribe():
return subscribe(_that);case _Unsubscribe():
return unsubscribe(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Created value)?  created,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Create value)?  create,TResult? Function( _Join value)?  join,TResult? Function( _Retrieve value)?  retrieve,TResult? Function( _Subscribe value)?  subscribe,TResult? Function( _Unsubscribe value)?  unsubscribe,}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Create() when create != null:
return create(_that);case _Join() when join != null:
return join(_that);case _Retrieve() when retrieve != null:
return retrieve(_that);case _Subscribe() when subscribe != null:
return subscribe(_that);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  loaded,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  deleted,TResult Function( BroadcastType type,  String title,  String description,  DateTime? startTime,  bool isRecorded)?  create,TResult Function( RtcEngine engine,  Broadcast broadcast,  User user)?  join,TResult Function( Broadcast broadcast)?  retrieve,TResult Function( Broadcast broadcast,  bool isMuted)?  subscribe,TResult Function( Broadcast broadcast)?  unsubscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.type,_that.title,_that.description,_that.startTime,_that.isRecorded);case _Join() when join != null:
return join(_that.engine,_that.broadcast,_that.user);case _Retrieve() when retrieve != null:
return retrieve(_that.broadcast);case _Subscribe() when subscribe != null:
return subscribe(_that.broadcast,_that.isMuted);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.broadcast);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  loaded,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  deleted,required TResult Function( BroadcastType type,  String title,  String description,  DateTime? startTime,  bool isRecorded)  create,required TResult Function( RtcEngine engine,  Broadcast broadcast,  User user)  join,required TResult Function( Broadcast broadcast)  retrieve,required TResult Function( Broadcast broadcast,  bool isMuted)  subscribe,required TResult Function( Broadcast broadcast)  unsubscribe,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Loaded():
return loaded(_that.payload);case _Updated():
return updated(_that.payload);case _Deleted():
return deleted(_that.payload);case _Create():
return create(_that.type,_that.title,_that.description,_that.startTime,_that.isRecorded);case _Join():
return join(_that.engine,_that.broadcast,_that.user);case _Retrieve():
return retrieve(_that.broadcast);case _Subscribe():
return subscribe(_that.broadcast,_that.isMuted);case _Unsubscribe():
return unsubscribe(_that.broadcast);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  loaded,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  deleted,TResult? Function( BroadcastType type,  String title,  String description,  DateTime? startTime,  bool isRecorded)?  create,TResult? Function( RtcEngine engine,  Broadcast broadcast,  User user)?  join,TResult? Function( Broadcast broadcast)?  retrieve,TResult? Function( Broadcast broadcast,  bool isMuted)?  subscribe,TResult? Function( Broadcast broadcast)?  unsubscribe,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.type,_that.title,_that.description,_that.startTime,_that.isRecorded);case _Join() when join != null:
return join(_that.engine,_that.broadcast,_that.user);case _Retrieve() when retrieve != null:
return retrieve(_that.broadcast);case _Subscribe() when subscribe != null:
return subscribe(_that.broadcast,_that.isMuted);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.broadcast);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements BroadcastDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'BroadcastDetailEvent.created(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $BroadcastDetailEventCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Created(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Loaded implements BroadcastDetailEvent {
  const _Loaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BroadcastDetailEvent
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
  return 'BroadcastDetailEvent.loaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $BroadcastDetailEventCopyWith<$Res> {
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

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Loaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements BroadcastDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'BroadcastDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $BroadcastDetailEventCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Deleted implements BroadcastDetailEvent {
  const _Deleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'BroadcastDetailEvent.deleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $BroadcastDetailEventCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Create implements BroadcastDetailEvent {
  const _Create({required this.type, required this.title, required this.description, this.startTime, required this.isRecorded});
  

 final  BroadcastType type;
 final  String title;
 final  String description;
 final  DateTime? startTime;
 final  bool isRecorded;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.isRecorded, isRecorded) || other.isRecorded == isRecorded));
}


@override
int get hashCode => Object.hash(runtimeType,type,title,description,startTime,isRecorded);

@override
String toString() {
  return 'BroadcastDetailEvent.create(type: $type, title: $title, description: $description, startTime: $startTime, isRecorded: $isRecorded)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $BroadcastDetailEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 BroadcastType type, String title, String description, DateTime? startTime, bool isRecorded
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? title = null,Object? description = null,Object? startTime = freezed,Object? isRecorded = null,}) {
  return _then(_Create(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BroadcastType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,isRecorded: null == isRecorded ? _self.isRecorded : isRecorded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Join implements BroadcastDetailEvent {
  const _Join({required this.engine, required this.broadcast, required this.user});
  

 final  RtcEngine engine;
 final  Broadcast broadcast;
 final  User user;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinCopyWith<_Join> get copyWith => __$JoinCopyWithImpl<_Join>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Join&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,engine,broadcast,user);

@override
String toString() {
  return 'BroadcastDetailEvent.join(engine: $engine, broadcast: $broadcast, user: $user)';
}


}

/// @nodoc
abstract mixin class _$JoinCopyWith<$Res> implements $BroadcastDetailEventCopyWith<$Res> {
  factory _$JoinCopyWith(_Join value, $Res Function(_Join) _then) = __$JoinCopyWithImpl;
@useResult
$Res call({
 RtcEngine engine, Broadcast broadcast, User user
});


$BroadcastCopyWith<$Res> get broadcast;$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$JoinCopyWithImpl<$Res>
    implements _$JoinCopyWith<$Res> {
  __$JoinCopyWithImpl(this._self, this._then);

  final _Join _self;
  final $Res Function(_Join) _then;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? engine = null,Object? broadcast = null,Object? user = null,}) {
  return _then(_Join(
engine: null == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as RtcEngine,broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res> get broadcast {
  
  return $BroadcastCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}/// Create a copy of BroadcastDetailEvent
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


class _Retrieve implements BroadcastDetailEvent {
  const _Retrieve({required this.broadcast});
  

 final  Broadcast broadcast;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetrieveCopyWith<_Retrieve> get copyWith => __$RetrieveCopyWithImpl<_Retrieve>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Retrieve&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast));
}


@override
int get hashCode => Object.hash(runtimeType,broadcast);

@override
String toString() {
  return 'BroadcastDetailEvent.retrieve(broadcast: $broadcast)';
}


}

/// @nodoc
abstract mixin class _$RetrieveCopyWith<$Res> implements $BroadcastDetailEventCopyWith<$Res> {
  factory _$RetrieveCopyWith(_Retrieve value, $Res Function(_Retrieve) _then) = __$RetrieveCopyWithImpl;
@useResult
$Res call({
 Broadcast broadcast
});


$BroadcastCopyWith<$Res> get broadcast;

}
/// @nodoc
class __$RetrieveCopyWithImpl<$Res>
    implements _$RetrieveCopyWith<$Res> {
  __$RetrieveCopyWithImpl(this._self, this._then);

  final _Retrieve _self;
  final $Res Function(_Retrieve) _then;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcast = null,}) {
  return _then(_Retrieve(
broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast,
  ));
}

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res> get broadcast {
  
  return $BroadcastCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}
}

/// @nodoc


class _Subscribe implements BroadcastDetailEvent {
  const _Subscribe({required this.broadcast, required this.isMuted});
  

 final  Broadcast broadcast;
 final  bool isMuted;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribeCopyWith<_Subscribe> get copyWith => __$SubscribeCopyWithImpl<_Subscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscribe&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted));
}


@override
int get hashCode => Object.hash(runtimeType,broadcast,isMuted);

@override
String toString() {
  return 'BroadcastDetailEvent.subscribe(broadcast: $broadcast, isMuted: $isMuted)';
}


}

/// @nodoc
abstract mixin class _$SubscribeCopyWith<$Res> implements $BroadcastDetailEventCopyWith<$Res> {
  factory _$SubscribeCopyWith(_Subscribe value, $Res Function(_Subscribe) _then) = __$SubscribeCopyWithImpl;
@useResult
$Res call({
 Broadcast broadcast, bool isMuted
});


$BroadcastCopyWith<$Res> get broadcast;

}
/// @nodoc
class __$SubscribeCopyWithImpl<$Res>
    implements _$SubscribeCopyWith<$Res> {
  __$SubscribeCopyWithImpl(this._self, this._then);

  final _Subscribe _self;
  final $Res Function(_Subscribe) _then;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcast = null,Object? isMuted = null,}) {
  return _then(_Subscribe(
broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res> get broadcast {
  
  return $BroadcastCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}
}

/// @nodoc


class _Unsubscribe implements BroadcastDetailEvent {
  const _Unsubscribe({required this.broadcast});
  

 final  Broadcast broadcast;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeCopyWith<_Unsubscribe> get copyWith => __$UnsubscribeCopyWithImpl<_Unsubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsubscribe&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast));
}


@override
int get hashCode => Object.hash(runtimeType,broadcast);

@override
String toString() {
  return 'BroadcastDetailEvent.unsubscribe(broadcast: $broadcast)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeCopyWith<$Res> implements $BroadcastDetailEventCopyWith<$Res> {
  factory _$UnsubscribeCopyWith(_Unsubscribe value, $Res Function(_Unsubscribe) _then) = __$UnsubscribeCopyWithImpl;
@useResult
$Res call({
 Broadcast broadcast
});


$BroadcastCopyWith<$Res> get broadcast;

}
/// @nodoc
class __$UnsubscribeCopyWithImpl<$Res>
    implements _$UnsubscribeCopyWith<$Res> {
  __$UnsubscribeCopyWithImpl(this._self, this._then);

  final _Unsubscribe _self;
  final $Res Function(_Unsubscribe) _then;

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcast = null,}) {
  return _then(_Unsubscribe(
broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast,
  ));
}

/// Create a copy of BroadcastDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res> get broadcast {
  
  return $BroadcastCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}
}

/// @nodoc
mixin _$BroadcastDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BroadcastDetailState()';
}


}

/// @nodoc
class $BroadcastDetailStateCopyWith<$Res>  {
$BroadcastDetailStateCopyWith(BroadcastDetailState _, $Res Function(BroadcastDetailState) __);
}


/// Adds pattern-matching-related methods to [BroadcastDetailState].
extension BroadcastDetailStatePatterns on BroadcastDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BroadcastDetailInitial value)?  initial,TResult Function( BroadcastDetailLoading value)?  loading,TResult Function( BroadcastCreated value)?  created,TResult Function( BroadcastJoined value)?  joined,TResult Function( BroadcastLoaded value)?  loaded,TResult Function( BroadcastUpdated value)?  updated,TResult Function( BroadcastDeleted value)?  deleted,TResult Function( BroadcastDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BroadcastDetailInitial() when initial != null:
return initial(_that);case BroadcastDetailLoading() when loading != null:
return loading(_that);case BroadcastCreated() when created != null:
return created(_that);case BroadcastJoined() when joined != null:
return joined(_that);case BroadcastLoaded() when loaded != null:
return loaded(_that);case BroadcastUpdated() when updated != null:
return updated(_that);case BroadcastDeleted() when deleted != null:
return deleted(_that);case BroadcastDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BroadcastDetailInitial value)  initial,required TResult Function( BroadcastDetailLoading value)  loading,required TResult Function( BroadcastCreated value)  created,required TResult Function( BroadcastJoined value)  joined,required TResult Function( BroadcastLoaded value)  loaded,required TResult Function( BroadcastUpdated value)  updated,required TResult Function( BroadcastDeleted value)  deleted,required TResult Function( BroadcastDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case BroadcastDetailInitial():
return initial(_that);case BroadcastDetailLoading():
return loading(_that);case BroadcastCreated():
return created(_that);case BroadcastJoined():
return joined(_that);case BroadcastLoaded():
return loaded(_that);case BroadcastUpdated():
return updated(_that);case BroadcastDeleted():
return deleted(_that);case BroadcastDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BroadcastDetailInitial value)?  initial,TResult? Function( BroadcastDetailLoading value)?  loading,TResult? Function( BroadcastCreated value)?  created,TResult? Function( BroadcastJoined value)?  joined,TResult? Function( BroadcastLoaded value)?  loaded,TResult? Function( BroadcastUpdated value)?  updated,TResult? Function( BroadcastDeleted value)?  deleted,TResult? Function( BroadcastDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case BroadcastDetailInitial() when initial != null:
return initial(_that);case BroadcastDetailLoading() when loading != null:
return loading(_that);case BroadcastCreated() when created != null:
return created(_that);case BroadcastJoined() when joined != null:
return joined(_that);case BroadcastLoaded() when loaded != null:
return loaded(_that);case BroadcastUpdated() when updated != null:
return updated(_that);case BroadcastDeleted() when deleted != null:
return deleted(_that);case BroadcastDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Broadcast broadcast)?  created,TResult Function( Broadcast broadcast)?  joined,TResult Function( Broadcast broadcast)?  loaded,TResult Function( Broadcast broadcast)?  updated,TResult Function( int broadcastId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BroadcastDetailInitial() when initial != null:
return initial();case BroadcastDetailLoading() when loading != null:
return loading();case BroadcastCreated() when created != null:
return created(_that.broadcast);case BroadcastJoined() when joined != null:
return joined(_that.broadcast);case BroadcastLoaded() when loaded != null:
return loaded(_that.broadcast);case BroadcastUpdated() when updated != null:
return updated(_that.broadcast);case BroadcastDeleted() when deleted != null:
return deleted(_that.broadcastId);case BroadcastDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Broadcast broadcast)  created,required TResult Function( Broadcast broadcast)  joined,required TResult Function( Broadcast broadcast)  loaded,required TResult Function( Broadcast broadcast)  updated,required TResult Function( int broadcastId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case BroadcastDetailInitial():
return initial();case BroadcastDetailLoading():
return loading();case BroadcastCreated():
return created(_that.broadcast);case BroadcastJoined():
return joined(_that.broadcast);case BroadcastLoaded():
return loaded(_that.broadcast);case BroadcastUpdated():
return updated(_that.broadcast);case BroadcastDeleted():
return deleted(_that.broadcastId);case BroadcastDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Broadcast broadcast)?  created,TResult? Function( Broadcast broadcast)?  joined,TResult? Function( Broadcast broadcast)?  loaded,TResult? Function( Broadcast broadcast)?  updated,TResult? Function( int broadcastId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case BroadcastDetailInitial() when initial != null:
return initial();case BroadcastDetailLoading() when loading != null:
return loading();case BroadcastCreated() when created != null:
return created(_that.broadcast);case BroadcastJoined() when joined != null:
return joined(_that.broadcast);case BroadcastLoaded() when loaded != null:
return loaded(_that.broadcast);case BroadcastUpdated() when updated != null:
return updated(_that.broadcast);case BroadcastDeleted() when deleted != null:
return deleted(_that.broadcastId);case BroadcastDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class BroadcastDetailInitial implements BroadcastDetailState {
  const BroadcastDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BroadcastDetailState.initial()';
}


}




/// @nodoc


class BroadcastDetailLoading implements BroadcastDetailState {
  const BroadcastDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BroadcastDetailState.loading()';
}


}




/// @nodoc


class BroadcastCreated implements BroadcastDetailState {
  const BroadcastCreated({required this.broadcast});
  

 final  Broadcast broadcast;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastCreatedCopyWith<BroadcastCreated> get copyWith => _$BroadcastCreatedCopyWithImpl<BroadcastCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastCreated&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast));
}


@override
int get hashCode => Object.hash(runtimeType,broadcast);

@override
String toString() {
  return 'BroadcastDetailState.created(broadcast: $broadcast)';
}


}

/// @nodoc
abstract mixin class $BroadcastCreatedCopyWith<$Res> implements $BroadcastDetailStateCopyWith<$Res> {
  factory $BroadcastCreatedCopyWith(BroadcastCreated value, $Res Function(BroadcastCreated) _then) = _$BroadcastCreatedCopyWithImpl;
@useResult
$Res call({
 Broadcast broadcast
});


$BroadcastCopyWith<$Res> get broadcast;

}
/// @nodoc
class _$BroadcastCreatedCopyWithImpl<$Res>
    implements $BroadcastCreatedCopyWith<$Res> {
  _$BroadcastCreatedCopyWithImpl(this._self, this._then);

  final BroadcastCreated _self;
  final $Res Function(BroadcastCreated) _then;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcast = null,}) {
  return _then(BroadcastCreated(
broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast,
  ));
}

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res> get broadcast {
  
  return $BroadcastCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}
}

/// @nodoc


class BroadcastJoined implements BroadcastDetailState {
  const BroadcastJoined({required this.broadcast});
  

 final  Broadcast broadcast;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastJoinedCopyWith<BroadcastJoined> get copyWith => _$BroadcastJoinedCopyWithImpl<BroadcastJoined>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastJoined&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast));
}


@override
int get hashCode => Object.hash(runtimeType,broadcast);

@override
String toString() {
  return 'BroadcastDetailState.joined(broadcast: $broadcast)';
}


}

/// @nodoc
abstract mixin class $BroadcastJoinedCopyWith<$Res> implements $BroadcastDetailStateCopyWith<$Res> {
  factory $BroadcastJoinedCopyWith(BroadcastJoined value, $Res Function(BroadcastJoined) _then) = _$BroadcastJoinedCopyWithImpl;
@useResult
$Res call({
 Broadcast broadcast
});


$BroadcastCopyWith<$Res> get broadcast;

}
/// @nodoc
class _$BroadcastJoinedCopyWithImpl<$Res>
    implements $BroadcastJoinedCopyWith<$Res> {
  _$BroadcastJoinedCopyWithImpl(this._self, this._then);

  final BroadcastJoined _self;
  final $Res Function(BroadcastJoined) _then;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcast = null,}) {
  return _then(BroadcastJoined(
broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast,
  ));
}

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res> get broadcast {
  
  return $BroadcastCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}
}

/// @nodoc


class BroadcastLoaded implements BroadcastDetailState {
  const BroadcastLoaded({required this.broadcast});
  

 final  Broadcast broadcast;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastLoadedCopyWith<BroadcastLoaded> get copyWith => _$BroadcastLoadedCopyWithImpl<BroadcastLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastLoaded&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast));
}


@override
int get hashCode => Object.hash(runtimeType,broadcast);

@override
String toString() {
  return 'BroadcastDetailState.loaded(broadcast: $broadcast)';
}


}

/// @nodoc
abstract mixin class $BroadcastLoadedCopyWith<$Res> implements $BroadcastDetailStateCopyWith<$Res> {
  factory $BroadcastLoadedCopyWith(BroadcastLoaded value, $Res Function(BroadcastLoaded) _then) = _$BroadcastLoadedCopyWithImpl;
@useResult
$Res call({
 Broadcast broadcast
});


$BroadcastCopyWith<$Res> get broadcast;

}
/// @nodoc
class _$BroadcastLoadedCopyWithImpl<$Res>
    implements $BroadcastLoadedCopyWith<$Res> {
  _$BroadcastLoadedCopyWithImpl(this._self, this._then);

  final BroadcastLoaded _self;
  final $Res Function(BroadcastLoaded) _then;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcast = null,}) {
  return _then(BroadcastLoaded(
broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast,
  ));
}

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res> get broadcast {
  
  return $BroadcastCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}
}

/// @nodoc


class BroadcastUpdated implements BroadcastDetailState {
  const BroadcastUpdated({required this.broadcast});
  

 final  Broadcast broadcast;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastUpdatedCopyWith<BroadcastUpdated> get copyWith => _$BroadcastUpdatedCopyWithImpl<BroadcastUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastUpdated&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast));
}


@override
int get hashCode => Object.hash(runtimeType,broadcast);

@override
String toString() {
  return 'BroadcastDetailState.updated(broadcast: $broadcast)';
}


}

/// @nodoc
abstract mixin class $BroadcastUpdatedCopyWith<$Res> implements $BroadcastDetailStateCopyWith<$Res> {
  factory $BroadcastUpdatedCopyWith(BroadcastUpdated value, $Res Function(BroadcastUpdated) _then) = _$BroadcastUpdatedCopyWithImpl;
@useResult
$Res call({
 Broadcast broadcast
});


$BroadcastCopyWith<$Res> get broadcast;

}
/// @nodoc
class _$BroadcastUpdatedCopyWithImpl<$Res>
    implements $BroadcastUpdatedCopyWith<$Res> {
  _$BroadcastUpdatedCopyWithImpl(this._self, this._then);

  final BroadcastUpdated _self;
  final $Res Function(BroadcastUpdated) _then;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcast = null,}) {
  return _then(BroadcastUpdated(
broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as Broadcast,
  ));
}

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastCopyWith<$Res> get broadcast {
  
  return $BroadcastCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}
}

/// @nodoc


class BroadcastDeleted implements BroadcastDetailState {
  const BroadcastDeleted({required this.broadcastId});
  

 final  int broadcastId;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastDeletedCopyWith<BroadcastDeleted> get copyWith => _$BroadcastDeletedCopyWithImpl<BroadcastDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastDeleted&&(identical(other.broadcastId, broadcastId) || other.broadcastId == broadcastId));
}


@override
int get hashCode => Object.hash(runtimeType,broadcastId);

@override
String toString() {
  return 'BroadcastDetailState.deleted(broadcastId: $broadcastId)';
}


}

/// @nodoc
abstract mixin class $BroadcastDeletedCopyWith<$Res> implements $BroadcastDetailStateCopyWith<$Res> {
  factory $BroadcastDeletedCopyWith(BroadcastDeleted value, $Res Function(BroadcastDeleted) _then) = _$BroadcastDeletedCopyWithImpl;
@useResult
$Res call({
 int broadcastId
});




}
/// @nodoc
class _$BroadcastDeletedCopyWithImpl<$Res>
    implements $BroadcastDeletedCopyWith<$Res> {
  _$BroadcastDeletedCopyWithImpl(this._self, this._then);

  final BroadcastDeleted _self;
  final $Res Function(BroadcastDeleted) _then;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? broadcastId = null,}) {
  return _then(BroadcastDeleted(
broadcastId: null == broadcastId ? _self.broadcastId : broadcastId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class BroadcastDetailFailure implements BroadcastDetailState {
  const BroadcastDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastDetailFailureCopyWith<BroadcastDetailFailure> get copyWith => _$BroadcastDetailFailureCopyWithImpl<BroadcastDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BroadcastDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $BroadcastDetailFailureCopyWith<$Res> implements $BroadcastDetailStateCopyWith<$Res> {
  factory $BroadcastDetailFailureCopyWith(BroadcastDetailFailure value, $Res Function(BroadcastDetailFailure) _then) = _$BroadcastDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$BroadcastDetailFailureCopyWithImpl<$Res>
    implements $BroadcastDetailFailureCopyWith<$Res> {
  _$BroadcastDetailFailureCopyWithImpl(this._self, this._then);

  final BroadcastDetailFailure _self;
  final $Res Function(BroadcastDetailFailure) _then;

/// Create a copy of BroadcastDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(BroadcastDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
