// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeetingDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingDetailEvent()';
}


}

/// @nodoc
class $MeetingDetailEventCopyWith<$Res>  {
$MeetingDetailEventCopyWith(MeetingDetailEvent _, $Res Function(MeetingDetailEvent) __);
}


/// Adds pattern-matching-related methods to [MeetingDetailEvent].
extension MeetingDetailEventPatterns on MeetingDetailEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  loaded,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  deleted,TResult Function( String title,  String description,  DateTime? startTime,  bool isRecorded,  bool isLiveStream)?  create,TResult Function( RtcEngine engine,  Meeting meeting,  User user)?  join,TResult Function( Meeting meeting)?  retrieve,TResult Function( Meeting meeting,  bool isMuted)?  subscribe,TResult Function( Meeting meeting)?  unsubscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.title,_that.description,_that.startTime,_that.isRecorded,_that.isLiveStream);case _Join() when join != null:
return join(_that.engine,_that.meeting,_that.user);case _Retrieve() when retrieve != null:
return retrieve(_that.meeting);case _Subscribe() when subscribe != null:
return subscribe(_that.meeting,_that.isMuted);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.meeting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  loaded,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  deleted,required TResult Function( String title,  String description,  DateTime? startTime,  bool isRecorded,  bool isLiveStream)  create,required TResult Function( RtcEngine engine,  Meeting meeting,  User user)  join,required TResult Function( Meeting meeting)  retrieve,required TResult Function( Meeting meeting,  bool isMuted)  subscribe,required TResult Function( Meeting meeting)  unsubscribe,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Loaded():
return loaded(_that.payload);case _Updated():
return updated(_that.payload);case _Deleted():
return deleted(_that.payload);case _Create():
return create(_that.title,_that.description,_that.startTime,_that.isRecorded,_that.isLiveStream);case _Join():
return join(_that.engine,_that.meeting,_that.user);case _Retrieve():
return retrieve(_that.meeting);case _Subscribe():
return subscribe(_that.meeting,_that.isMuted);case _Unsubscribe():
return unsubscribe(_that.meeting);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  loaded,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  deleted,TResult? Function( String title,  String description,  DateTime? startTime,  bool isRecorded,  bool isLiveStream)?  create,TResult? Function( RtcEngine engine,  Meeting meeting,  User user)?  join,TResult? Function( Meeting meeting)?  retrieve,TResult? Function( Meeting meeting,  bool isMuted)?  subscribe,TResult? Function( Meeting meeting)?  unsubscribe,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.title,_that.description,_that.startTime,_that.isRecorded,_that.isLiveStream);case _Join() when join != null:
return join(_that.engine,_that.meeting,_that.user);case _Retrieve() when retrieve != null:
return retrieve(_that.meeting);case _Subscribe() when subscribe != null:
return subscribe(_that.meeting,_that.isMuted);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.meeting);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements MeetingDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
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
  return 'MeetingDetailEvent.created(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
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

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Created(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Loaded implements MeetingDetailEvent {
  const _Loaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
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
  return 'MeetingDetailEvent.loaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
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

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Loaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements MeetingDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
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
  return 'MeetingDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
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

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Deleted implements MeetingDetailEvent {
  const _Deleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of MeetingDetailEvent
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
  return 'MeetingDetailEvent.deleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
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

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Create implements MeetingDetailEvent {
  const _Create({required this.title, required this.description, this.startTime, required this.isRecorded, this.isLiveStream = false});
  

 final  String title;
 final  String description;
 final  DateTime? startTime;
 final  bool isRecorded;
@JsonKey() final  bool isLiveStream;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.isRecorded, isRecorded) || other.isRecorded == isRecorded)&&(identical(other.isLiveStream, isLiveStream) || other.isLiveStream == isLiveStream));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,startTime,isRecorded,isLiveStream);

@override
String toString() {
  return 'MeetingDetailEvent.create(title: $title, description: $description, startTime: $startTime, isRecorded: $isRecorded, isLiveStream: $isLiveStream)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String title, String description, DateTime? startTime, bool isRecorded, bool isLiveStream
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? startTime = freezed,Object? isRecorded = null,Object? isLiveStream = null,}) {
  return _then(_Create(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,isRecorded: null == isRecorded ? _self.isRecorded : isRecorded // ignore: cast_nullable_to_non_nullable
as bool,isLiveStream: null == isLiveStream ? _self.isLiveStream : isLiveStream // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Join implements MeetingDetailEvent {
  const _Join({required this.engine, required this.meeting, required this.user});
  

 final  RtcEngine engine;
 final  Meeting meeting;
 final  User user;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinCopyWith<_Join> get copyWith => __$JoinCopyWithImpl<_Join>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Join&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,engine,meeting,user);

@override
String toString() {
  return 'MeetingDetailEvent.join(engine: $engine, meeting: $meeting, user: $user)';
}


}

/// @nodoc
abstract mixin class _$JoinCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
  factory _$JoinCopyWith(_Join value, $Res Function(_Join) _then) = __$JoinCopyWithImpl;
@useResult
$Res call({
 RtcEngine engine, Meeting meeting, User user
});


$MeetingCopyWith<$Res> get meeting;$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$JoinCopyWithImpl<$Res>
    implements _$JoinCopyWith<$Res> {
  __$JoinCopyWithImpl(this._self, this._then);

  final _Join _self;
  final $Res Function(_Join) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? engine = null,Object? meeting = null,Object? user = null,}) {
  return _then(_Join(
engine: null == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as RtcEngine,meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res> get meeting {
  
  return $MeetingCopyWith<$Res>(_self.meeting, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}/// Create a copy of MeetingDetailEvent
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


class _Retrieve implements MeetingDetailEvent {
  const _Retrieve({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetrieveCopyWith<_Retrieve> get copyWith => __$RetrieveCopyWithImpl<_Retrieve>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Retrieve&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailEvent.retrieve(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class _$RetrieveCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
  factory _$RetrieveCopyWith(_Retrieve value, $Res Function(_Retrieve) _then) = __$RetrieveCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class __$RetrieveCopyWithImpl<$Res>
    implements _$RetrieveCopyWith<$Res> {
  __$RetrieveCopyWithImpl(this._self, this._then);

  final _Retrieve _self;
  final $Res Function(_Retrieve) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(_Retrieve(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailEvent
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


class _Subscribe implements MeetingDetailEvent {
  const _Subscribe({required this.meeting, required this.isMuted});
  

 final  Meeting meeting;
 final  bool isMuted;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribeCopyWith<_Subscribe> get copyWith => __$SubscribeCopyWithImpl<_Subscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscribe&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted));
}


@override
int get hashCode => Object.hash(runtimeType,meeting,isMuted);

@override
String toString() {
  return 'MeetingDetailEvent.subscribe(meeting: $meeting, isMuted: $isMuted)';
}


}

/// @nodoc
abstract mixin class _$SubscribeCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
  factory _$SubscribeCopyWith(_Subscribe value, $Res Function(_Subscribe) _then) = __$SubscribeCopyWithImpl;
@useResult
$Res call({
 Meeting meeting, bool isMuted
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class __$SubscribeCopyWithImpl<$Res>
    implements _$SubscribeCopyWith<$Res> {
  __$SubscribeCopyWithImpl(this._self, this._then);

  final _Subscribe _self;
  final $Res Function(_Subscribe) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,Object? isMuted = null,}) {
  return _then(_Subscribe(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MeetingDetailEvent
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


class _Unsubscribe implements MeetingDetailEvent {
  const _Unsubscribe({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeCopyWith<_Unsubscribe> get copyWith => __$UnsubscribeCopyWithImpl<_Unsubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsubscribe&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailEvent.unsubscribe(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeCopyWith<$Res> implements $MeetingDetailEventCopyWith<$Res> {
  factory _$UnsubscribeCopyWith(_Unsubscribe value, $Res Function(_Unsubscribe) _then) = __$UnsubscribeCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class __$UnsubscribeCopyWithImpl<$Res>
    implements _$UnsubscribeCopyWith<$Res> {
  __$UnsubscribeCopyWithImpl(this._self, this._then);

  final _Unsubscribe _self;
  final $Res Function(_Unsubscribe) _then;

/// Create a copy of MeetingDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(_Unsubscribe(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailEvent
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
mixin _$MeetingDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingDetailState()';
}


}

/// @nodoc
class $MeetingDetailStateCopyWith<$Res>  {
$MeetingDetailStateCopyWith(MeetingDetailState _, $Res Function(MeetingDetailState) __);
}


/// Adds pattern-matching-related methods to [MeetingDetailState].
extension MeetingDetailStatePatterns on MeetingDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MeetingDetailInitial value)?  initial,TResult Function( MeetingDetailLoading value)?  loading,TResult Function( MeetingCreated value)?  created,TResult Function( MeetingJoined value)?  joined,TResult Function( MeetingLoaded value)?  loaded,TResult Function( MeetingUpdated value)?  updated,TResult Function( MeetingDeleted value)?  deleted,TResult Function( MeetingDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial(_that);case MeetingDetailLoading() when loading != null:
return loading(_that);case MeetingCreated() when created != null:
return created(_that);case MeetingJoined() when joined != null:
return joined(_that);case MeetingLoaded() when loaded != null:
return loaded(_that);case MeetingUpdated() when updated != null:
return updated(_that);case MeetingDeleted() when deleted != null:
return deleted(_that);case MeetingDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MeetingDetailInitial value)  initial,required TResult Function( MeetingDetailLoading value)  loading,required TResult Function( MeetingCreated value)  created,required TResult Function( MeetingJoined value)  joined,required TResult Function( MeetingLoaded value)  loaded,required TResult Function( MeetingUpdated value)  updated,required TResult Function( MeetingDeleted value)  deleted,required TResult Function( MeetingDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case MeetingDetailInitial():
return initial(_that);case MeetingDetailLoading():
return loading(_that);case MeetingCreated():
return created(_that);case MeetingJoined():
return joined(_that);case MeetingLoaded():
return loaded(_that);case MeetingUpdated():
return updated(_that);case MeetingDeleted():
return deleted(_that);case MeetingDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MeetingDetailInitial value)?  initial,TResult? Function( MeetingDetailLoading value)?  loading,TResult? Function( MeetingCreated value)?  created,TResult? Function( MeetingJoined value)?  joined,TResult? Function( MeetingLoaded value)?  loaded,TResult? Function( MeetingUpdated value)?  updated,TResult? Function( MeetingDeleted value)?  deleted,TResult? Function( MeetingDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial(_that);case MeetingDetailLoading() when loading != null:
return loading(_that);case MeetingCreated() when created != null:
return created(_that);case MeetingJoined() when joined != null:
return joined(_that);case MeetingLoaded() when loaded != null:
return loaded(_that);case MeetingUpdated() when updated != null:
return updated(_that);case MeetingDeleted() when deleted != null:
return deleted(_that);case MeetingDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Meeting meeting)?  created,TResult Function( Meeting meeting)?  joined,TResult Function( Meeting meeting)?  loaded,TResult Function( Meeting meeting)?  updated,TResult Function( int meetingId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial();case MeetingDetailLoading() when loading != null:
return loading();case MeetingCreated() when created != null:
return created(_that.meeting);case MeetingJoined() when joined != null:
return joined(_that.meeting);case MeetingLoaded() when loaded != null:
return loaded(_that.meeting);case MeetingUpdated() when updated != null:
return updated(_that.meeting);case MeetingDeleted() when deleted != null:
return deleted(_that.meetingId);case MeetingDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Meeting meeting)  created,required TResult Function( Meeting meeting)  joined,required TResult Function( Meeting meeting)  loaded,required TResult Function( Meeting meeting)  updated,required TResult Function( int meetingId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case MeetingDetailInitial():
return initial();case MeetingDetailLoading():
return loading();case MeetingCreated():
return created(_that.meeting);case MeetingJoined():
return joined(_that.meeting);case MeetingLoaded():
return loaded(_that.meeting);case MeetingUpdated():
return updated(_that.meeting);case MeetingDeleted():
return deleted(_that.meetingId);case MeetingDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Meeting meeting)?  created,TResult? Function( Meeting meeting)?  joined,TResult? Function( Meeting meeting)?  loaded,TResult? Function( Meeting meeting)?  updated,TResult? Function( int meetingId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case MeetingDetailInitial() when initial != null:
return initial();case MeetingDetailLoading() when loading != null:
return loading();case MeetingCreated() when created != null:
return created(_that.meeting);case MeetingJoined() when joined != null:
return joined(_that.meeting);case MeetingLoaded() when loaded != null:
return loaded(_that.meeting);case MeetingUpdated() when updated != null:
return updated(_that.meeting);case MeetingDeleted() when deleted != null:
return deleted(_that.meetingId);case MeetingDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class MeetingDetailInitial implements MeetingDetailState {
  const MeetingDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingDetailState.initial()';
}


}




/// @nodoc


class MeetingDetailLoading implements MeetingDetailState {
  const MeetingDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingDetailState.loading()';
}


}




/// @nodoc


class MeetingCreated implements MeetingDetailState {
  const MeetingCreated({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingCreatedCopyWith<MeetingCreated> get copyWith => _$MeetingCreatedCopyWithImpl<MeetingCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingCreated&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailState.created(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class $MeetingCreatedCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingCreatedCopyWith(MeetingCreated value, $Res Function(MeetingCreated) _then) = _$MeetingCreatedCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class _$MeetingCreatedCopyWithImpl<$Res>
    implements $MeetingCreatedCopyWith<$Res> {
  _$MeetingCreatedCopyWithImpl(this._self, this._then);

  final MeetingCreated _self;
  final $Res Function(MeetingCreated) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(MeetingCreated(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailState
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


class MeetingJoined implements MeetingDetailState {
  const MeetingJoined({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingJoinedCopyWith<MeetingJoined> get copyWith => _$MeetingJoinedCopyWithImpl<MeetingJoined>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingJoined&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailState.joined(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class $MeetingJoinedCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingJoinedCopyWith(MeetingJoined value, $Res Function(MeetingJoined) _then) = _$MeetingJoinedCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class _$MeetingJoinedCopyWithImpl<$Res>
    implements $MeetingJoinedCopyWith<$Res> {
  _$MeetingJoinedCopyWithImpl(this._self, this._then);

  final MeetingJoined _self;
  final $Res Function(MeetingJoined) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(MeetingJoined(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailState
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


class MeetingLoaded implements MeetingDetailState {
  const MeetingLoaded({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingLoadedCopyWith<MeetingLoaded> get copyWith => _$MeetingLoadedCopyWithImpl<MeetingLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingLoaded&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailState.loaded(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class $MeetingLoadedCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingLoadedCopyWith(MeetingLoaded value, $Res Function(MeetingLoaded) _then) = _$MeetingLoadedCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class _$MeetingLoadedCopyWithImpl<$Res>
    implements $MeetingLoadedCopyWith<$Res> {
  _$MeetingLoadedCopyWithImpl(this._self, this._then);

  final MeetingLoaded _self;
  final $Res Function(MeetingLoaded) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(MeetingLoaded(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailState
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


class MeetingUpdated implements MeetingDetailState {
  const MeetingUpdated({required this.meeting});
  

 final  Meeting meeting;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingUpdatedCopyWith<MeetingUpdated> get copyWith => _$MeetingUpdatedCopyWithImpl<MeetingUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingUpdated&&(identical(other.meeting, meeting) || other.meeting == meeting));
}


@override
int get hashCode => Object.hash(runtimeType,meeting);

@override
String toString() {
  return 'MeetingDetailState.updated(meeting: $meeting)';
}


}

/// @nodoc
abstract mixin class $MeetingUpdatedCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingUpdatedCopyWith(MeetingUpdated value, $Res Function(MeetingUpdated) _then) = _$MeetingUpdatedCopyWithImpl;
@useResult
$Res call({
 Meeting meeting
});


$MeetingCopyWith<$Res> get meeting;

}
/// @nodoc
class _$MeetingUpdatedCopyWithImpl<$Res>
    implements $MeetingUpdatedCopyWith<$Res> {
  _$MeetingUpdatedCopyWithImpl(this._self, this._then);

  final MeetingUpdated _self;
  final $Res Function(MeetingUpdated) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meeting = null,}) {
  return _then(MeetingUpdated(
meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,
  ));
}

/// Create a copy of MeetingDetailState
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


class MeetingDeleted implements MeetingDetailState {
  const MeetingDeleted({required this.meetingId});
  

 final  int meetingId;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingDeletedCopyWith<MeetingDeleted> get copyWith => _$MeetingDeletedCopyWithImpl<MeetingDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDeleted&&(identical(other.meetingId, meetingId) || other.meetingId == meetingId));
}


@override
int get hashCode => Object.hash(runtimeType,meetingId);

@override
String toString() {
  return 'MeetingDetailState.deleted(meetingId: $meetingId)';
}


}

/// @nodoc
abstract mixin class $MeetingDeletedCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingDeletedCopyWith(MeetingDeleted value, $Res Function(MeetingDeleted) _then) = _$MeetingDeletedCopyWithImpl;
@useResult
$Res call({
 int meetingId
});




}
/// @nodoc
class _$MeetingDeletedCopyWithImpl<$Res>
    implements $MeetingDeletedCopyWith<$Res> {
  _$MeetingDeletedCopyWithImpl(this._self, this._then);

  final MeetingDeleted _self;
  final $Res Function(MeetingDeleted) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meetingId = null,}) {
  return _then(MeetingDeleted(
meetingId: null == meetingId ? _self.meetingId : meetingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MeetingDetailFailure implements MeetingDetailState {
  const MeetingDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingDetailFailureCopyWith<MeetingDetailFailure> get copyWith => _$MeetingDetailFailureCopyWithImpl<MeetingDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MeetingDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $MeetingDetailFailureCopyWith<$Res> implements $MeetingDetailStateCopyWith<$Res> {
  factory $MeetingDetailFailureCopyWith(MeetingDetailFailure value, $Res Function(MeetingDetailFailure) _then) = _$MeetingDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$MeetingDetailFailureCopyWithImpl<$Res>
    implements $MeetingDetailFailureCopyWith<$Res> {
  _$MeetingDetailFailureCopyWithImpl(this._self, this._then);

  final MeetingDetailFailure _self;
  final $Res Function(MeetingDetailFailure) _then;

/// Create a copy of MeetingDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(MeetingDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
