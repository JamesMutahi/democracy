// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationDetailState()';
}


}

/// @nodoc
class $NotificationDetailStateCopyWith<$Res>  {
$NotificationDetailStateCopyWith(NotificationDetailState _, $Res Function(NotificationDetailState) __);
}


/// Adds pattern-matching-related methods to [NotificationDetailState].
extension NotificationDetailStatePatterns on NotificationDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotificationDetailInitial value)?  initial,TResult Function( NotificationDetailLoading value)?  loading,TResult Function( NotificationCreated value)?  created,TResult Function( NotificationUpdated value)?  updated,TResult Function( NotificationDeleted value)?  deleted,TResult Function( NotificationDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotificationDetailInitial() when initial != null:
return initial(_that);case NotificationDetailLoading() when loading != null:
return loading(_that);case NotificationCreated() when created != null:
return created(_that);case NotificationUpdated() when updated != null:
return updated(_that);case NotificationDeleted() when deleted != null:
return deleted(_that);case NotificationDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotificationDetailInitial value)  initial,required TResult Function( NotificationDetailLoading value)  loading,required TResult Function( NotificationCreated value)  created,required TResult Function( NotificationUpdated value)  updated,required TResult Function( NotificationDeleted value)  deleted,required TResult Function( NotificationDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case NotificationDetailInitial():
return initial(_that);case NotificationDetailLoading():
return loading(_that);case NotificationCreated():
return created(_that);case NotificationUpdated():
return updated(_that);case NotificationDeleted():
return deleted(_that);case NotificationDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotificationDetailInitial value)?  initial,TResult? Function( NotificationDetailLoading value)?  loading,TResult? Function( NotificationCreated value)?  created,TResult? Function( NotificationUpdated value)?  updated,TResult? Function( NotificationDeleted value)?  deleted,TResult? Function( NotificationDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case NotificationDetailInitial() when initial != null:
return initial(_that);case NotificationDetailLoading() when loading != null:
return loading(_that);case NotificationCreated() when created != null:
return created(_that);case NotificationUpdated() when updated != null:
return updated(_that);case NotificationDeleted() when deleted != null:
return deleted(_that);case NotificationDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Notification notification)?  created,TResult Function( Notification notification)?  updated,TResult Function( int notificationId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotificationDetailInitial() when initial != null:
return initial();case NotificationDetailLoading() when loading != null:
return loading();case NotificationCreated() when created != null:
return created(_that.notification);case NotificationUpdated() when updated != null:
return updated(_that.notification);case NotificationDeleted() when deleted != null:
return deleted(_that.notificationId);case NotificationDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Notification notification)  created,required TResult Function( Notification notification)  updated,required TResult Function( int notificationId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case NotificationDetailInitial():
return initial();case NotificationDetailLoading():
return loading();case NotificationCreated():
return created(_that.notification);case NotificationUpdated():
return updated(_that.notification);case NotificationDeleted():
return deleted(_that.notificationId);case NotificationDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Notification notification)?  created,TResult? Function( Notification notification)?  updated,TResult? Function( int notificationId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case NotificationDetailInitial() when initial != null:
return initial();case NotificationDetailLoading() when loading != null:
return loading();case NotificationCreated() when created != null:
return created(_that.notification);case NotificationUpdated() when updated != null:
return updated(_that.notification);case NotificationDeleted() when deleted != null:
return deleted(_that.notificationId);case NotificationDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class NotificationDetailInitial implements NotificationDetailState {
  const NotificationDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationDetailState.initial()';
}


}




/// @nodoc


class NotificationDetailLoading implements NotificationDetailState {
  const NotificationDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationDetailState.loading()';
}


}




/// @nodoc


class NotificationCreated implements NotificationDetailState {
  const NotificationCreated({required this.notification});
  

 final  Notification notification;

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCreatedCopyWith<NotificationCreated> get copyWith => _$NotificationCreatedCopyWithImpl<NotificationCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationCreated&&(identical(other.notification, notification) || other.notification == notification));
}


@override
int get hashCode => Object.hash(runtimeType,notification);

@override
String toString() {
  return 'NotificationDetailState.created(notification: $notification)';
}


}

/// @nodoc
abstract mixin class $NotificationCreatedCopyWith<$Res> implements $NotificationDetailStateCopyWith<$Res> {
  factory $NotificationCreatedCopyWith(NotificationCreated value, $Res Function(NotificationCreated) _then) = _$NotificationCreatedCopyWithImpl;
@useResult
$Res call({
 Notification notification
});


$NotificationCopyWith<$Res> get notification;

}
/// @nodoc
class _$NotificationCreatedCopyWithImpl<$Res>
    implements $NotificationCreatedCopyWith<$Res> {
  _$NotificationCreatedCopyWithImpl(this._self, this._then);

  final NotificationCreated _self;
  final $Res Function(NotificationCreated) _then;

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notification = null,}) {
  return _then(NotificationCreated(
notification: null == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as Notification,
  ));
}

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationCopyWith<$Res> get notification {
  
  return $NotificationCopyWith<$Res>(_self.notification, (value) {
    return _then(_self.copyWith(notification: value));
  });
}
}

/// @nodoc


class NotificationUpdated implements NotificationDetailState {
  const NotificationUpdated({required this.notification});
  

 final  Notification notification;

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationUpdatedCopyWith<NotificationUpdated> get copyWith => _$NotificationUpdatedCopyWithImpl<NotificationUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationUpdated&&(identical(other.notification, notification) || other.notification == notification));
}


@override
int get hashCode => Object.hash(runtimeType,notification);

@override
String toString() {
  return 'NotificationDetailState.updated(notification: $notification)';
}


}

/// @nodoc
abstract mixin class $NotificationUpdatedCopyWith<$Res> implements $NotificationDetailStateCopyWith<$Res> {
  factory $NotificationUpdatedCopyWith(NotificationUpdated value, $Res Function(NotificationUpdated) _then) = _$NotificationUpdatedCopyWithImpl;
@useResult
$Res call({
 Notification notification
});


$NotificationCopyWith<$Res> get notification;

}
/// @nodoc
class _$NotificationUpdatedCopyWithImpl<$Res>
    implements $NotificationUpdatedCopyWith<$Res> {
  _$NotificationUpdatedCopyWithImpl(this._self, this._then);

  final NotificationUpdated _self;
  final $Res Function(NotificationUpdated) _then;

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notification = null,}) {
  return _then(NotificationUpdated(
notification: null == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as Notification,
  ));
}

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationCopyWith<$Res> get notification {
  
  return $NotificationCopyWith<$Res>(_self.notification, (value) {
    return _then(_self.copyWith(notification: value));
  });
}
}

/// @nodoc


class NotificationDeleted implements NotificationDetailState {
  const NotificationDeleted({required this.notificationId});
  

 final  int notificationId;

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDeletedCopyWith<NotificationDeleted> get copyWith => _$NotificationDeletedCopyWithImpl<NotificationDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDeleted&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}


@override
int get hashCode => Object.hash(runtimeType,notificationId);

@override
String toString() {
  return 'NotificationDetailState.deleted(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class $NotificationDeletedCopyWith<$Res> implements $NotificationDetailStateCopyWith<$Res> {
  factory $NotificationDeletedCopyWith(NotificationDeleted value, $Res Function(NotificationDeleted) _then) = _$NotificationDeletedCopyWithImpl;
@useResult
$Res call({
 int notificationId
});




}
/// @nodoc
class _$NotificationDeletedCopyWithImpl<$Res>
    implements $NotificationDeletedCopyWith<$Res> {
  _$NotificationDeletedCopyWithImpl(this._self, this._then);

  final NotificationDeleted _self;
  final $Res Function(NotificationDeleted) _then;

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(NotificationDeleted(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class NotificationDetailFailure implements NotificationDetailState {
  const NotificationDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDetailFailureCopyWith<NotificationDetailFailure> get copyWith => _$NotificationDetailFailureCopyWithImpl<NotificationDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'NotificationDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $NotificationDetailFailureCopyWith<$Res> implements $NotificationDetailStateCopyWith<$Res> {
  factory $NotificationDetailFailureCopyWith(NotificationDetailFailure value, $Res Function(NotificationDetailFailure) _then) = _$NotificationDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$NotificationDetailFailureCopyWithImpl<$Res>
    implements $NotificationDetailFailureCopyWith<$Res> {
  _$NotificationDetailFailureCopyWithImpl(this._self, this._then);

  final NotificationDetailFailure _self;
  final $Res Function(NotificationDetailFailure) _then;

/// Create a copy of NotificationDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(NotificationDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
