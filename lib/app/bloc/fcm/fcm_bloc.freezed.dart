// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FcmEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FcmEvent()';
}


}

/// @nodoc
class $FcmEventCopyWith<$Res>  {
$FcmEventCopyWith(FcmEvent _, $Res Function(FcmEvent) __);
}


/// Adds pattern-matching-related methods to [FcmEvent].
extension FcmEventPatterns on FcmEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FcmStarted value)?  started,TResult Function( FcmTokenRefreshed value)?  tokenRefreshed,TResult Function( FcmMessageReceived value)?  messageReceived,TResult Function( FcmNotificationTapped value)?  notificationTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FcmStarted() when started != null:
return started(_that);case FcmTokenRefreshed() when tokenRefreshed != null:
return tokenRefreshed(_that);case FcmMessageReceived() when messageReceived != null:
return messageReceived(_that);case FcmNotificationTapped() when notificationTapped != null:
return notificationTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FcmStarted value)  started,required TResult Function( FcmTokenRefreshed value)  tokenRefreshed,required TResult Function( FcmMessageReceived value)  messageReceived,required TResult Function( FcmNotificationTapped value)  notificationTapped,}){
final _that = this;
switch (_that) {
case FcmStarted():
return started(_that);case FcmTokenRefreshed():
return tokenRefreshed(_that);case FcmMessageReceived():
return messageReceived(_that);case FcmNotificationTapped():
return notificationTapped(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FcmStarted value)?  started,TResult? Function( FcmTokenRefreshed value)?  tokenRefreshed,TResult? Function( FcmMessageReceived value)?  messageReceived,TResult? Function( FcmNotificationTapped value)?  notificationTapped,}){
final _that = this;
switch (_that) {
case FcmStarted() when started != null:
return started(_that);case FcmTokenRefreshed() when tokenRefreshed != null:
return tokenRefreshed(_that);case FcmMessageReceived() when messageReceived != null:
return messageReceived(_that);case FcmNotificationTapped() when notificationTapped != null:
return notificationTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String token)?  tokenRefreshed,TResult Function( RemoteMessage message)?  messageReceived,TResult Function( RemoteMessage message)?  notificationTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FcmStarted() when started != null:
return started();case FcmTokenRefreshed() when tokenRefreshed != null:
return tokenRefreshed(_that.token);case FcmMessageReceived() when messageReceived != null:
return messageReceived(_that.message);case FcmNotificationTapped() when notificationTapped != null:
return notificationTapped(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String token)  tokenRefreshed,required TResult Function( RemoteMessage message)  messageReceived,required TResult Function( RemoteMessage message)  notificationTapped,}) {final _that = this;
switch (_that) {
case FcmStarted():
return started();case FcmTokenRefreshed():
return tokenRefreshed(_that.token);case FcmMessageReceived():
return messageReceived(_that.message);case FcmNotificationTapped():
return notificationTapped(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String token)?  tokenRefreshed,TResult? Function( RemoteMessage message)?  messageReceived,TResult? Function( RemoteMessage message)?  notificationTapped,}) {final _that = this;
switch (_that) {
case FcmStarted() when started != null:
return started();case FcmTokenRefreshed() when tokenRefreshed != null:
return tokenRefreshed(_that.token);case FcmMessageReceived() when messageReceived != null:
return messageReceived(_that.message);case FcmNotificationTapped() when notificationTapped != null:
return notificationTapped(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class FcmStarted implements FcmEvent {
  const FcmStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FcmEvent.started()';
}


}




/// @nodoc


class FcmTokenRefreshed implements FcmEvent {
  const FcmTokenRefreshed({required this.token});
  

 final  String token;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FcmTokenRefreshedCopyWith<FcmTokenRefreshed> get copyWith => _$FcmTokenRefreshedCopyWithImpl<FcmTokenRefreshed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmTokenRefreshed&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'FcmEvent.tokenRefreshed(token: $token)';
}


}

/// @nodoc
abstract mixin class $FcmTokenRefreshedCopyWith<$Res> implements $FcmEventCopyWith<$Res> {
  factory $FcmTokenRefreshedCopyWith(FcmTokenRefreshed value, $Res Function(FcmTokenRefreshed) _then) = _$FcmTokenRefreshedCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$FcmTokenRefreshedCopyWithImpl<$Res>
    implements $FcmTokenRefreshedCopyWith<$Res> {
  _$FcmTokenRefreshedCopyWithImpl(this._self, this._then);

  final FcmTokenRefreshed _self;
  final $Res Function(FcmTokenRefreshed) _then;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(FcmTokenRefreshed(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FcmMessageReceived implements FcmEvent {
  const FcmMessageReceived({required this.message});
  

 final  RemoteMessage message;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FcmMessageReceivedCopyWith<FcmMessageReceived> get copyWith => _$FcmMessageReceivedCopyWithImpl<FcmMessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmMessageReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FcmEvent.messageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class $FcmMessageReceivedCopyWith<$Res> implements $FcmEventCopyWith<$Res> {
  factory $FcmMessageReceivedCopyWith(FcmMessageReceived value, $Res Function(FcmMessageReceived) _then) = _$FcmMessageReceivedCopyWithImpl;
@useResult
$Res call({
 RemoteMessage message
});




}
/// @nodoc
class _$FcmMessageReceivedCopyWithImpl<$Res>
    implements $FcmMessageReceivedCopyWith<$Res> {
  _$FcmMessageReceivedCopyWithImpl(this._self, this._then);

  final FcmMessageReceived _self;
  final $Res Function(FcmMessageReceived) _then;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FcmMessageReceived(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as RemoteMessage,
  ));
}


}

/// @nodoc


class FcmNotificationTapped implements FcmEvent {
  const FcmNotificationTapped({required this.message});
  

 final  RemoteMessage message;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FcmNotificationTappedCopyWith<FcmNotificationTapped> get copyWith => _$FcmNotificationTappedCopyWithImpl<FcmNotificationTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmNotificationTapped&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FcmEvent.notificationTapped(message: $message)';
}


}

/// @nodoc
abstract mixin class $FcmNotificationTappedCopyWith<$Res> implements $FcmEventCopyWith<$Res> {
  factory $FcmNotificationTappedCopyWith(FcmNotificationTapped value, $Res Function(FcmNotificationTapped) _then) = _$FcmNotificationTappedCopyWithImpl;
@useResult
$Res call({
 RemoteMessage message
});




}
/// @nodoc
class _$FcmNotificationTappedCopyWithImpl<$Res>
    implements $FcmNotificationTappedCopyWith<$Res> {
  _$FcmNotificationTappedCopyWithImpl(this._self, this._then);

  final FcmNotificationTapped _self;
  final $Res Function(FcmNotificationTapped) _then;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FcmNotificationTapped(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as RemoteMessage,
  ));
}


}

// dart format on
