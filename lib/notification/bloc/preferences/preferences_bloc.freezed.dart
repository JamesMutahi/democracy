// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreferencesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesState()';
}


}

/// @nodoc
class $PreferencesStateCopyWith<$Res>  {
$PreferencesStateCopyWith(PreferencesState _, $Res Function(PreferencesState) __);
}


/// Adds pattern-matching-related methods to [PreferencesState].
extension PreferencesStatePatterns on PreferencesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PreferencesLoading value)?  loading,TResult Function( PreferencesLoaded value)?  loaded,TResult Function( PreferencesFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PreferencesLoading() when loading != null:
return loading(_that);case PreferencesLoaded() when loaded != null:
return loaded(_that);case PreferencesFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PreferencesLoading value)  loading,required TResult Function( PreferencesLoaded value)  loaded,required TResult Function( PreferencesFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PreferencesLoading():
return loading(_that);case PreferencesLoaded():
return loaded(_that);case PreferencesFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PreferencesLoading value)?  loading,TResult? Function( PreferencesLoaded value)?  loaded,TResult? Function( PreferencesFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PreferencesLoading() when loading != null:
return loading(_that);case PreferencesLoaded() when loaded != null:
return loaded(_that);case PreferencesFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Preferences preferences)?  loaded,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PreferencesLoading() when loading != null:
return loading();case PreferencesLoaded() when loaded != null:
return loaded(_that.preferences);case PreferencesFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Preferences preferences)  loaded,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case PreferencesLoading():
return loading();case PreferencesLoaded():
return loaded(_that.preferences);case PreferencesFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Preferences preferences)?  loaded,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PreferencesLoading() when loading != null:
return loading();case PreferencesLoaded() when loaded != null:
return loaded(_that.preferences);case PreferencesFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PreferencesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesState.initial()';
}


}




/// @nodoc


class PreferencesLoading implements PreferencesState {
  const PreferencesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesState.loading()';
}


}




/// @nodoc


class PreferencesLoaded implements PreferencesState {
  const PreferencesLoaded({required this.preferences});
  

 final  Preferences preferences;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesLoadedCopyWith<PreferencesLoaded> get copyWith => _$PreferencesLoadedCopyWithImpl<PreferencesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesLoaded&&(identical(other.preferences, preferences) || other.preferences == preferences));
}


@override
int get hashCode => Object.hash(runtimeType,preferences);

@override
String toString() {
  return 'PreferencesState.loaded(preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class $PreferencesLoadedCopyWith<$Res> implements $PreferencesStateCopyWith<$Res> {
  factory $PreferencesLoadedCopyWith(PreferencesLoaded value, $Res Function(PreferencesLoaded) _then) = _$PreferencesLoadedCopyWithImpl;
@useResult
$Res call({
 Preferences preferences
});


$PreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class _$PreferencesLoadedCopyWithImpl<$Res>
    implements $PreferencesLoadedCopyWith<$Res> {
  _$PreferencesLoadedCopyWithImpl(this._self, this._then);

  final PreferencesLoaded _self;
  final $Res Function(PreferencesLoaded) _then;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preferences = null,}) {
  return _then(PreferencesLoaded(
preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as Preferences,
  ));
}

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreferencesCopyWith<$Res> get preferences {
  
  return $PreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}

/// @nodoc


class PreferencesFailure implements PreferencesState {
  const PreferencesFailure({required this.error});
  

 final  String error;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesFailureCopyWith<PreferencesFailure> get copyWith => _$PreferencesFailureCopyWithImpl<PreferencesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PreferencesState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PreferencesFailureCopyWith<$Res> implements $PreferencesStateCopyWith<$Res> {
  factory $PreferencesFailureCopyWith(PreferencesFailure value, $Res Function(PreferencesFailure) _then) = _$PreferencesFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PreferencesFailureCopyWithImpl<$Res>
    implements $PreferencesFailureCopyWith<$Res> {
  _$PreferencesFailureCopyWithImpl(this._self, this._then);

  final PreferencesFailure _self;
  final $Res Function(PreferencesFailure) _then;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PreferencesFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PreferencesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesEvent()';
}


}

/// @nodoc
class $PreferencesEventCopyWith<$Res>  {
$PreferencesEventCopyWith(PreferencesEvent _, $Res Function(PreferencesEvent) __);
}


/// Adds pattern-matching-related methods to [PreferencesEvent].
extension PreferencesEventPatterns on PreferencesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,TResult Function( _Update value)?  update,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Update() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,required TResult Function( _Update value)  update,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);case _Update():
return update(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,TResult? Function( _Update value)?  update,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Update() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( bool allowNotifications,  bool allowTagNotifications,  bool allowLikeNotifications,  bool allowReplyNotifications,  bool allowRepostNotifications,  bool allowMessageNotifications,  bool allowFollowNotifications)?  update,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get();case _Received() when received != null:
return received(_that.payload);case _Update() when update != null:
return update(_that.allowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications,_that.allowFollowNotifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( bool allowNotifications,  bool allowTagNotifications,  bool allowLikeNotifications,  bool allowReplyNotifications,  bool allowRepostNotifications,  bool allowMessageNotifications,  bool allowFollowNotifications)  update,}) {final _that = this;
switch (_that) {
case _Get():
return get();case _Received():
return received(_that.payload);case _Update():
return update(_that.allowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications,_that.allowFollowNotifications);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( bool allowNotifications,  bool allowTagNotifications,  bool allowLikeNotifications,  bool allowReplyNotifications,  bool allowRepostNotifications,  bool allowMessageNotifications,  bool allowFollowNotifications)?  update,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get();case _Received() when received != null:
return received(_that.payload);case _Update() when update != null:
return update(_that.allowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications,_that.allowFollowNotifications);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements PreferencesEvent {
  const _Get();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesEvent.get()';
}


}




/// @nodoc


class _Received implements PreferencesEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PreferencesEvent
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
  return 'PreferencesEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $PreferencesEventCopyWith<$Res> {
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

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Update implements PreferencesEvent {
  const _Update({required this.allowNotifications, required this.allowTagNotifications, required this.allowLikeNotifications, required this.allowReplyNotifications, required this.allowRepostNotifications, required this.allowMessageNotifications, required this.allowFollowNotifications});
  

 final  bool allowNotifications;
 final  bool allowTagNotifications;
 final  bool allowLikeNotifications;
 final  bool allowReplyNotifications;
 final  bool allowRepostNotifications;
 final  bool allowMessageNotifications;
 final  bool allowFollowNotifications;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.allowNotifications, allowNotifications) || other.allowNotifications == allowNotifications)&&(identical(other.allowTagNotifications, allowTagNotifications) || other.allowTagNotifications == allowTagNotifications)&&(identical(other.allowLikeNotifications, allowLikeNotifications) || other.allowLikeNotifications == allowLikeNotifications)&&(identical(other.allowReplyNotifications, allowReplyNotifications) || other.allowReplyNotifications == allowReplyNotifications)&&(identical(other.allowRepostNotifications, allowRepostNotifications) || other.allowRepostNotifications == allowRepostNotifications)&&(identical(other.allowMessageNotifications, allowMessageNotifications) || other.allowMessageNotifications == allowMessageNotifications)&&(identical(other.allowFollowNotifications, allowFollowNotifications) || other.allowFollowNotifications == allowFollowNotifications));
}


@override
int get hashCode => Object.hash(runtimeType,allowNotifications,allowTagNotifications,allowLikeNotifications,allowReplyNotifications,allowRepostNotifications,allowMessageNotifications,allowFollowNotifications);

@override
String toString() {
  return 'PreferencesEvent.update(allowNotifications: $allowNotifications, allowTagNotifications: $allowTagNotifications, allowLikeNotifications: $allowLikeNotifications, allowReplyNotifications: $allowReplyNotifications, allowRepostNotifications: $allowRepostNotifications, allowMessageNotifications: $allowMessageNotifications, allowFollowNotifications: $allowFollowNotifications)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $PreferencesEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 bool allowNotifications, bool allowTagNotifications, bool allowLikeNotifications, bool allowReplyNotifications, bool allowRepostNotifications, bool allowMessageNotifications, bool allowFollowNotifications
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allowNotifications = null,Object? allowTagNotifications = null,Object? allowLikeNotifications = null,Object? allowReplyNotifications = null,Object? allowRepostNotifications = null,Object? allowMessageNotifications = null,Object? allowFollowNotifications = null,}) {
  return _then(_Update(
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

// dart format on
