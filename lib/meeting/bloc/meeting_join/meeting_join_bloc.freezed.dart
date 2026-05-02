// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_join_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeetingJoinEvent {

 RtcEngine get engine; Meeting get meeting; User get user;
/// Create a copy of MeetingJoinEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingJoinEventCopyWith<MeetingJoinEvent> get copyWith => _$MeetingJoinEventCopyWithImpl<MeetingJoinEvent>(this as MeetingJoinEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingJoinEvent&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,engine,meeting,user);

@override
String toString() {
  return 'MeetingJoinEvent(engine: $engine, meeting: $meeting, user: $user)';
}


}

/// @nodoc
abstract mixin class $MeetingJoinEventCopyWith<$Res>  {
  factory $MeetingJoinEventCopyWith(MeetingJoinEvent value, $Res Function(MeetingJoinEvent) _then) = _$MeetingJoinEventCopyWithImpl;
@useResult
$Res call({
 RtcEngine engine, Meeting meeting, User user
});


$MeetingCopyWith<$Res> get meeting;$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$MeetingJoinEventCopyWithImpl<$Res>
    implements $MeetingJoinEventCopyWith<$Res> {
  _$MeetingJoinEventCopyWithImpl(this._self, this._then);

  final MeetingJoinEvent _self;
  final $Res Function(MeetingJoinEvent) _then;

/// Create a copy of MeetingJoinEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? engine = null,Object? meeting = null,Object? user = null,}) {
  return _then(_self.copyWith(
engine: null == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as RtcEngine,meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of MeetingJoinEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res> get meeting {
  
  return $MeetingCopyWith<$Res>(_self.meeting, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}/// Create a copy of MeetingJoinEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [MeetingJoinEvent].
extension MeetingJoinEventPatterns on MeetingJoinEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Join value)?  join,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Join() when join != null:
return join(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Join value)  join,}){
final _that = this;
switch (_that) {
case _Join():
return join(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Join value)?  join,}){
final _that = this;
switch (_that) {
case _Join() when join != null:
return join(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RtcEngine engine,  Meeting meeting,  User user)?  join,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Join() when join != null:
return join(_that.engine,_that.meeting,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RtcEngine engine,  Meeting meeting,  User user)  join,}) {final _that = this;
switch (_that) {
case _Join():
return join(_that.engine,_that.meeting,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RtcEngine engine,  Meeting meeting,  User user)?  join,}) {final _that = this;
switch (_that) {
case _Join() when join != null:
return join(_that.engine,_that.meeting,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _Join implements MeetingJoinEvent {
  const _Join({required this.engine, required this.meeting, required this.user});
  

@override final  RtcEngine engine;
@override final  Meeting meeting;
@override final  User user;

/// Create a copy of MeetingJoinEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'MeetingJoinEvent.join(engine: $engine, meeting: $meeting, user: $user)';
}


}

/// @nodoc
abstract mixin class _$JoinCopyWith<$Res> implements $MeetingJoinEventCopyWith<$Res> {
  factory _$JoinCopyWith(_Join value, $Res Function(_Join) _then) = __$JoinCopyWithImpl;
@override @useResult
$Res call({
 RtcEngine engine, Meeting meeting, User user
});


@override $MeetingCopyWith<$Res> get meeting;@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$JoinCopyWithImpl<$Res>
    implements _$JoinCopyWith<$Res> {
  __$JoinCopyWithImpl(this._self, this._then);

  final _Join _self;
  final $Res Function(_Join) _then;

/// Create a copy of MeetingJoinEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? engine = null,Object? meeting = null,Object? user = null,}) {
  return _then(_Join(
engine: null == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as RtcEngine,meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of MeetingJoinEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res> get meeting {
  
  return $MeetingCopyWith<$Res>(_self.meeting, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}/// Create a copy of MeetingJoinEvent
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
mixin _$MeetingJoinState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingJoinState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingJoinState()';
}


}

/// @nodoc
class $MeetingJoinStateCopyWith<$Res>  {
$MeetingJoinStateCopyWith(MeetingJoinState _, $Res Function(MeetingJoinState) __);
}


/// Adds pattern-matching-related methods to [MeetingJoinState].
extension MeetingJoinStatePatterns on MeetingJoinState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MeetingJoinInitial value)?  initial,TResult Function( MeetingJoinLoading value)?  loading,TResult Function( MeetingJoinSuccess value)?  success,TResult Function( MeetingJoinFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MeetingJoinInitial() when initial != null:
return initial(_that);case MeetingJoinLoading() when loading != null:
return loading(_that);case MeetingJoinSuccess() when success != null:
return success(_that);case MeetingJoinFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MeetingJoinInitial value)  initial,required TResult Function( MeetingJoinLoading value)  loading,required TResult Function( MeetingJoinSuccess value)  success,required TResult Function( MeetingJoinFailure value)  failure,}){
final _that = this;
switch (_that) {
case MeetingJoinInitial():
return initial(_that);case MeetingJoinLoading():
return loading(_that);case MeetingJoinSuccess():
return success(_that);case MeetingJoinFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MeetingJoinInitial value)?  initial,TResult? Function( MeetingJoinLoading value)?  loading,TResult? Function( MeetingJoinSuccess value)?  success,TResult? Function( MeetingJoinFailure value)?  failure,}){
final _that = this;
switch (_that) {
case MeetingJoinInitial() when initial != null:
return initial(_that);case MeetingJoinLoading() when loading != null:
return loading(_that);case MeetingJoinSuccess() when success != null:
return success(_that);case MeetingJoinFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MeetingJoinInitial() when initial != null:
return initial();case MeetingJoinLoading() when loading != null:
return loading();case MeetingJoinSuccess() when success != null:
return success();case MeetingJoinFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case MeetingJoinInitial():
return initial();case MeetingJoinLoading():
return loading();case MeetingJoinSuccess():
return success();case MeetingJoinFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case MeetingJoinInitial() when initial != null:
return initial();case MeetingJoinLoading() when loading != null:
return loading();case MeetingJoinSuccess() when success != null:
return success();case MeetingJoinFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class MeetingJoinInitial implements MeetingJoinState {
  const MeetingJoinInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingJoinInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingJoinState.initial()';
}


}




/// @nodoc


class MeetingJoinLoading implements MeetingJoinState {
  const MeetingJoinLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingJoinLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingJoinState.loading()';
}


}




/// @nodoc


class MeetingJoinSuccess implements MeetingJoinState {
  const MeetingJoinSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingJoinSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeetingJoinState.success()';
}


}




/// @nodoc


class MeetingJoinFailure implements MeetingJoinState {
  const MeetingJoinFailure({required this.error});
  

 final  String error;

/// Create a copy of MeetingJoinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeetingJoinFailureCopyWith<MeetingJoinFailure> get copyWith => _$MeetingJoinFailureCopyWithImpl<MeetingJoinFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeetingJoinFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MeetingJoinState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $MeetingJoinFailureCopyWith<$Res> implements $MeetingJoinStateCopyWith<$Res> {
  factory $MeetingJoinFailureCopyWith(MeetingJoinFailure value, $Res Function(MeetingJoinFailure) _then) = _$MeetingJoinFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$MeetingJoinFailureCopyWithImpl<$Res>
    implements $MeetingJoinFailureCopyWith<$Res> {
  _$MeetingJoinFailureCopyWithImpl(this._self, this._then);

  final MeetingJoinFailure _self;
  final $Res Function(MeetingJoinFailure) _then;

/// Create a copy of MeetingJoinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(MeetingJoinFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
