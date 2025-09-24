// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WebsocketEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent()';
}


}

/// @nodoc
class $WebsocketEventCopyWith<$Res>  {
$WebsocketEventCopyWith(WebsocketEvent _, $Res Function(WebsocketEvent) __);
}


/// Adds pattern-matching-related methods to [WebsocketEvent].
extension WebsocketEventPatterns on WebsocketEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Connect value)?  connect,TResult Function( _ChangeState value)?  changeState,TResult Function( _GetNotifications value)?  getNotifications,TResult Function( _MarkNotificationAsRead value)?  markNotificationAsRead,TResult Function( _GetPreferences value)?  getPreferences,TResult Function( _UpdatePreferences value)?  updatePreferences,TResult Function( _ChangeUserNotificationStatus value)?  changeUserNotificationStatus,TResult Function( _GetConstitution value)?  getConstitution,TResult Function( _GetConstitutionTags value)?  getConstitutionTags,TResult Function( _BookmarkSection value)?  bookmarkSection,TResult Function( _Disconnect value)?  disconnect,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _GetNotifications() when getNotifications != null:
return getNotifications(_that);case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that);case _GetPreferences() when getPreferences != null:
return getPreferences(_that);case _UpdatePreferences() when updatePreferences != null:
return updatePreferences(_that);case _ChangeUserNotificationStatus() when changeUserNotificationStatus != null:
return changeUserNotificationStatus(_that);case _GetConstitution() when getConstitution != null:
return getConstitution(_that);case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that);case _Disconnect() when disconnect != null:
return disconnect(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Connect value)  connect,required TResult Function( _ChangeState value)  changeState,required TResult Function( _GetNotifications value)  getNotifications,required TResult Function( _MarkNotificationAsRead value)  markNotificationAsRead,required TResult Function( _GetPreferences value)  getPreferences,required TResult Function( _UpdatePreferences value)  updatePreferences,required TResult Function( _ChangeUserNotificationStatus value)  changeUserNotificationStatus,required TResult Function( _GetConstitution value)  getConstitution,required TResult Function( _GetConstitutionTags value)  getConstitutionTags,required TResult Function( _BookmarkSection value)  bookmarkSection,required TResult Function( _Disconnect value)  disconnect,}){
final _that = this;
switch (_that) {
case _Connect():
return connect(_that);case _ChangeState():
return changeState(_that);case _GetNotifications():
return getNotifications(_that);case _MarkNotificationAsRead():
return markNotificationAsRead(_that);case _GetPreferences():
return getPreferences(_that);case _UpdatePreferences():
return updatePreferences(_that);case _ChangeUserNotificationStatus():
return changeUserNotificationStatus(_that);case _GetConstitution():
return getConstitution(_that);case _GetConstitutionTags():
return getConstitutionTags(_that);case _BookmarkSection():
return bookmarkSection(_that);case _Disconnect():
return disconnect(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Connect value)?  connect,TResult? Function( _ChangeState value)?  changeState,TResult? Function( _GetNotifications value)?  getNotifications,TResult? Function( _MarkNotificationAsRead value)?  markNotificationAsRead,TResult? Function( _GetPreferences value)?  getPreferences,TResult? Function( _UpdatePreferences value)?  updatePreferences,TResult? Function( _ChangeUserNotificationStatus value)?  changeUserNotificationStatus,TResult? Function( _GetConstitution value)?  getConstitution,TResult? Function( _GetConstitutionTags value)?  getConstitutionTags,TResult? Function( _BookmarkSection value)?  bookmarkSection,TResult? Function( _Disconnect value)?  disconnect,}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _GetNotifications() when getNotifications != null:
return getNotifications(_that);case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that);case _GetPreferences() when getPreferences != null:
return getPreferences(_that);case _UpdatePreferences() when updatePreferences != null:
return updatePreferences(_that);case _ChangeUserNotificationStatus() when changeUserNotificationStatus != null:
return changeUserNotificationStatus(_that);case _GetConstitution() when getConstitution != null:
return getConstitution(_that);case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that);case _Disconnect() when disconnect != null:
return disconnect(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connect,TResult Function( WebsocketState state)?  changeState,TResult Function()?  getNotifications,TResult Function( Notification notification)?  markNotificationAsRead,TResult Function()?  getPreferences,TResult Function( bool allowNotifications,  bool allowTagNotifications,  bool allowLikeNotifications,  bool allowReplyNotifications,  bool allowRepostNotifications,  bool allowMessageNotifications,  bool allowFollowNotifications)?  updatePreferences,TResult Function( User user)?  changeUserNotificationStatus,TResult Function()?  getConstitution,TResult Function( String? searchTerm)?  getConstitutionTags,TResult Function( Section section)?  bookmarkSection,TResult Function()?  disconnect,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _GetNotifications() when getNotifications != null:
return getNotifications();case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that.notification);case _GetPreferences() when getPreferences != null:
return getPreferences();case _UpdatePreferences() when updatePreferences != null:
return updatePreferences(_that.allowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications,_that.allowFollowNotifications);case _ChangeUserNotificationStatus() when changeUserNotificationStatus != null:
return changeUserNotificationStatus(_that.user);case _GetConstitution() when getConstitution != null:
return getConstitution();case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that.searchTerm);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that.section);case _Disconnect() when disconnect != null:
return disconnect();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connect,required TResult Function( WebsocketState state)  changeState,required TResult Function()  getNotifications,required TResult Function( Notification notification)  markNotificationAsRead,required TResult Function()  getPreferences,required TResult Function( bool allowNotifications,  bool allowTagNotifications,  bool allowLikeNotifications,  bool allowReplyNotifications,  bool allowRepostNotifications,  bool allowMessageNotifications,  bool allowFollowNotifications)  updatePreferences,required TResult Function( User user)  changeUserNotificationStatus,required TResult Function()  getConstitution,required TResult Function( String? searchTerm)  getConstitutionTags,required TResult Function( Section section)  bookmarkSection,required TResult Function()  disconnect,}) {final _that = this;
switch (_that) {
case _Connect():
return connect();case _ChangeState():
return changeState(_that.state);case _GetNotifications():
return getNotifications();case _MarkNotificationAsRead():
return markNotificationAsRead(_that.notification);case _GetPreferences():
return getPreferences();case _UpdatePreferences():
return updatePreferences(_that.allowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications,_that.allowFollowNotifications);case _ChangeUserNotificationStatus():
return changeUserNotificationStatus(_that.user);case _GetConstitution():
return getConstitution();case _GetConstitutionTags():
return getConstitutionTags(_that.searchTerm);case _BookmarkSection():
return bookmarkSection(_that.section);case _Disconnect():
return disconnect();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connect,TResult? Function( WebsocketState state)?  changeState,TResult? Function()?  getNotifications,TResult? Function( Notification notification)?  markNotificationAsRead,TResult? Function()?  getPreferences,TResult? Function( bool allowNotifications,  bool allowTagNotifications,  bool allowLikeNotifications,  bool allowReplyNotifications,  bool allowRepostNotifications,  bool allowMessageNotifications,  bool allowFollowNotifications)?  updatePreferences,TResult? Function( User user)?  changeUserNotificationStatus,TResult? Function()?  getConstitution,TResult? Function( String? searchTerm)?  getConstitutionTags,TResult? Function( Section section)?  bookmarkSection,TResult? Function()?  disconnect,}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _GetNotifications() when getNotifications != null:
return getNotifications();case _MarkNotificationAsRead() when markNotificationAsRead != null:
return markNotificationAsRead(_that.notification);case _GetPreferences() when getPreferences != null:
return getPreferences();case _UpdatePreferences() when updatePreferences != null:
return updatePreferences(_that.allowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications,_that.allowFollowNotifications);case _ChangeUserNotificationStatus() when changeUserNotificationStatus != null:
return changeUserNotificationStatus(_that.user);case _GetConstitution() when getConstitution != null:
return getConstitution();case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that.searchTerm);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that.section);case _Disconnect() when disconnect != null:
return disconnect();case _:
  return null;

}
}

}

/// @nodoc


class _Connect with DiagnosticableTreeMixin implements WebsocketEvent {
  const _Connect();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.connect'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.connect()';
}


}




/// @nodoc


class _ChangeState with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ChangeState({required this.state});
  

 final  WebsocketState state;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeStateCopyWith<_ChangeState> get copyWith => __$ChangeStateCopyWithImpl<_ChangeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.changeState'))
    ..add(DiagnosticsProperty('state', state));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeState&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.changeState(state: $state)';
}


}

/// @nodoc
abstract mixin class _$ChangeStateCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ChangeStateCopyWith(_ChangeState value, $Res Function(_ChangeState) _then) = __$ChangeStateCopyWithImpl;
@useResult
$Res call({
 WebsocketState state
});




}
/// @nodoc
class __$ChangeStateCopyWithImpl<$Res>
    implements _$ChangeStateCopyWith<$Res> {
  __$ChangeStateCopyWithImpl(this._self, this._then);

  final _ChangeState _self;
  final $Res Function(_ChangeState) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(_ChangeState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as WebsocketState,
  ));
}


}

/// @nodoc


class _GetNotifications with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetNotifications();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getNotifications'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNotifications);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getNotifications()';
}


}




/// @nodoc


class _MarkNotificationAsRead with DiagnosticableTreeMixin implements WebsocketEvent {
  const _MarkNotificationAsRead({required this.notification});
  

 final  Notification notification;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkNotificationAsReadCopyWith<_MarkNotificationAsRead> get copyWith => __$MarkNotificationAsReadCopyWithImpl<_MarkNotificationAsRead>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.markNotificationAsRead'))
    ..add(DiagnosticsProperty('notification', notification));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkNotificationAsRead&&(identical(other.notification, notification) || other.notification == notification));
}


@override
int get hashCode => Object.hash(runtimeType,notification);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.markNotificationAsRead(notification: $notification)';
}


}

/// @nodoc
abstract mixin class _$MarkNotificationAsReadCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$MarkNotificationAsReadCopyWith(_MarkNotificationAsRead value, $Res Function(_MarkNotificationAsRead) _then) = __$MarkNotificationAsReadCopyWithImpl;
@useResult
$Res call({
 Notification notification
});


$NotificationCopyWith<$Res> get notification;

}
/// @nodoc
class __$MarkNotificationAsReadCopyWithImpl<$Res>
    implements _$MarkNotificationAsReadCopyWith<$Res> {
  __$MarkNotificationAsReadCopyWithImpl(this._self, this._then);

  final _MarkNotificationAsRead _self;
  final $Res Function(_MarkNotificationAsRead) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notification = null,}) {
  return _then(_MarkNotificationAsRead(
notification: null == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as Notification,
  ));
}

/// Create a copy of WebsocketEvent
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


class _GetPreferences with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetPreferences();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getPreferences'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPreferences);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getPreferences()';
}


}




/// @nodoc


class _UpdatePreferences with DiagnosticableTreeMixin implements WebsocketEvent {
  const _UpdatePreferences({required this.allowNotifications, required this.allowTagNotifications, required this.allowLikeNotifications, required this.allowReplyNotifications, required this.allowRepostNotifications, required this.allowMessageNotifications, required this.allowFollowNotifications});
  

 final  bool allowNotifications;
 final  bool allowTagNotifications;
 final  bool allowLikeNotifications;
 final  bool allowReplyNotifications;
 final  bool allowRepostNotifications;
 final  bool allowMessageNotifications;
 final  bool allowFollowNotifications;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePreferencesCopyWith<_UpdatePreferences> get copyWith => __$UpdatePreferencesCopyWithImpl<_UpdatePreferences>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.updatePreferences'))
    ..add(DiagnosticsProperty('allowNotifications', allowNotifications))..add(DiagnosticsProperty('allowTagNotifications', allowTagNotifications))..add(DiagnosticsProperty('allowLikeNotifications', allowLikeNotifications))..add(DiagnosticsProperty('allowReplyNotifications', allowReplyNotifications))..add(DiagnosticsProperty('allowRepostNotifications', allowRepostNotifications))..add(DiagnosticsProperty('allowMessageNotifications', allowMessageNotifications))..add(DiagnosticsProperty('allowFollowNotifications', allowFollowNotifications));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePreferences&&(identical(other.allowNotifications, allowNotifications) || other.allowNotifications == allowNotifications)&&(identical(other.allowTagNotifications, allowTagNotifications) || other.allowTagNotifications == allowTagNotifications)&&(identical(other.allowLikeNotifications, allowLikeNotifications) || other.allowLikeNotifications == allowLikeNotifications)&&(identical(other.allowReplyNotifications, allowReplyNotifications) || other.allowReplyNotifications == allowReplyNotifications)&&(identical(other.allowRepostNotifications, allowRepostNotifications) || other.allowRepostNotifications == allowRepostNotifications)&&(identical(other.allowMessageNotifications, allowMessageNotifications) || other.allowMessageNotifications == allowMessageNotifications)&&(identical(other.allowFollowNotifications, allowFollowNotifications) || other.allowFollowNotifications == allowFollowNotifications));
}


@override
int get hashCode => Object.hash(runtimeType,allowNotifications,allowTagNotifications,allowLikeNotifications,allowReplyNotifications,allowRepostNotifications,allowMessageNotifications,allowFollowNotifications);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.updatePreferences(allowNotifications: $allowNotifications, allowTagNotifications: $allowTagNotifications, allowLikeNotifications: $allowLikeNotifications, allowReplyNotifications: $allowReplyNotifications, allowRepostNotifications: $allowRepostNotifications, allowMessageNotifications: $allowMessageNotifications, allowFollowNotifications: $allowFollowNotifications)';
}


}

/// @nodoc
abstract mixin class _$UpdatePreferencesCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UpdatePreferencesCopyWith(_UpdatePreferences value, $Res Function(_UpdatePreferences) _then) = __$UpdatePreferencesCopyWithImpl;
@useResult
$Res call({
 bool allowNotifications, bool allowTagNotifications, bool allowLikeNotifications, bool allowReplyNotifications, bool allowRepostNotifications, bool allowMessageNotifications, bool allowFollowNotifications
});




}
/// @nodoc
class __$UpdatePreferencesCopyWithImpl<$Res>
    implements _$UpdatePreferencesCopyWith<$Res> {
  __$UpdatePreferencesCopyWithImpl(this._self, this._then);

  final _UpdatePreferences _self;
  final $Res Function(_UpdatePreferences) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allowNotifications = null,Object? allowTagNotifications = null,Object? allowLikeNotifications = null,Object? allowReplyNotifications = null,Object? allowRepostNotifications = null,Object? allowMessageNotifications = null,Object? allowFollowNotifications = null,}) {
  return _then(_UpdatePreferences(
allowNotifications: null == allowNotifications ? _self.allowNotifications : allowNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowTagNotifications: null == allowTagNotifications ? _self.allowTagNotifications : allowTagNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowLikeNotifications: null == allowLikeNotifications ? _self.allowLikeNotifications : allowLikeNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowReplyNotifications: null == allowReplyNotifications ? _self.allowReplyNotifications : allowReplyNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowRepostNotifications: null == allowRepostNotifications ? _self.allowRepostNotifications : allowRepostNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowMessageNotifications: null == allowMessageNotifications ? _self.allowMessageNotifications : allowMessageNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowFollowNotifications: null == allowFollowNotifications ? _self.allowFollowNotifications : allowFollowNotifications // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ChangeUserNotificationStatus with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ChangeUserNotificationStatus({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeUserNotificationStatusCopyWith<_ChangeUserNotificationStatus> get copyWith => __$ChangeUserNotificationStatusCopyWithImpl<_ChangeUserNotificationStatus>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.changeUserNotificationStatus'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeUserNotificationStatus&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.changeUserNotificationStatus(user: $user)';
}


}

/// @nodoc
abstract mixin class _$ChangeUserNotificationStatusCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ChangeUserNotificationStatusCopyWith(_ChangeUserNotificationStatus value, $Res Function(_ChangeUserNotificationStatus) _then) = __$ChangeUserNotificationStatusCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$ChangeUserNotificationStatusCopyWithImpl<$Res>
    implements _$ChangeUserNotificationStatusCopyWith<$Res> {
  __$ChangeUserNotificationStatusCopyWithImpl(this._self, this._then);

  final _ChangeUserNotificationStatus _self;
  final $Res Function(_ChangeUserNotificationStatus) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_ChangeUserNotificationStatus(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of WebsocketEvent
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


class _GetConstitution with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetConstitution();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getConstitution'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConstitution);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getConstitution()';
}


}




/// @nodoc


class _GetConstitutionTags with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetConstitutionTags({this.searchTerm});
  

 final  String? searchTerm;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetConstitutionTagsCopyWith<_GetConstitutionTags> get copyWith => __$GetConstitutionTagsCopyWithImpl<_GetConstitutionTags>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getConstitutionTags'))
    ..add(DiagnosticsProperty('searchTerm', searchTerm));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConstitutionTags&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getConstitutionTags(searchTerm: $searchTerm)';
}


}

/// @nodoc
abstract mixin class _$GetConstitutionTagsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetConstitutionTagsCopyWith(_GetConstitutionTags value, $Res Function(_GetConstitutionTags) _then) = __$GetConstitutionTagsCopyWithImpl;
@useResult
$Res call({
 String? searchTerm
});




}
/// @nodoc
class __$GetConstitutionTagsCopyWithImpl<$Res>
    implements _$GetConstitutionTagsCopyWith<$Res> {
  __$GetConstitutionTagsCopyWithImpl(this._self, this._then);

  final _GetConstitutionTags _self;
  final $Res Function(_GetConstitutionTags) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,}) {
  return _then(_GetConstitutionTags(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _BookmarkSection with DiagnosticableTreeMixin implements WebsocketEvent {
  const _BookmarkSection({required this.section});
  

 final  Section section;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkSectionCopyWith<_BookmarkSection> get copyWith => __$BookmarkSectionCopyWithImpl<_BookmarkSection>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.bookmarkSection'))
    ..add(DiagnosticsProperty('section', section));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkSection&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.bookmarkSection(section: $section)';
}


}

/// @nodoc
abstract mixin class _$BookmarkSectionCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$BookmarkSectionCopyWith(_BookmarkSection value, $Res Function(_BookmarkSection) _then) = __$BookmarkSectionCopyWithImpl;
@useResult
$Res call({
 Section section
});


$SectionCopyWith<$Res> get section;

}
/// @nodoc
class __$BookmarkSectionCopyWithImpl<$Res>
    implements _$BookmarkSectionCopyWith<$Res> {
  __$BookmarkSectionCopyWithImpl(this._self, this._then);

  final _BookmarkSection _self;
  final $Res Function(_BookmarkSection) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(_BookmarkSection(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res> get section {
  
  return $SectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc


class _Disconnect with DiagnosticableTreeMixin implements WebsocketEvent {
  const _Disconnect();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.disconnect'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disconnect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.disconnect()';
}


}




// dart format on
