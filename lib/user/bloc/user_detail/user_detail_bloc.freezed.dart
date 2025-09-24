// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserDetailState()';
}


}

/// @nodoc
class $UserDetailStateCopyWith<$Res>  {
$UserDetailStateCopyWith(UserDetailState _, $Res Function(UserDetailState) __);
}


/// Adds pattern-matching-related methods to [UserDetailState].
extension UserDetailStatePatterns on UserDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( UserLoaded value)?  loaded,TResult Function( UserUpdated value)?  updated,TResult Function( UserDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case UserLoaded() when loaded != null:
return loaded(_that);case UserUpdated() when updated != null:
return updated(_that);case UserDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( UserLoaded value)  loaded,required TResult Function( UserUpdated value)  updated,required TResult Function( UserDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case UserLoaded():
return loaded(_that);case UserUpdated():
return updated(_that);case UserDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( UserLoaded value)?  loaded,TResult? Function( UserUpdated value)?  updated,TResult? Function( UserDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case UserLoaded() when loaded != null:
return loaded(_that);case UserUpdated() when updated != null:
return updated(_that);case UserDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( User user)?  loaded,TResult Function( User user)?  updated,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case UserLoaded() when loaded != null:
return loaded(_that.user);case UserUpdated() when updated != null:
return updated(_that.user);case UserDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( User user)  loaded,required TResult Function( User user)  updated,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case UserLoaded():
return loaded(_that.user);case UserUpdated():
return updated(_that.user);case UserDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( User user)?  loaded,TResult? Function( User user)?  updated,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case UserLoaded() when loaded != null:
return loaded(_that.user);case UserUpdated() when updated != null:
return updated(_that.user);case UserDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UserDetailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserDetailState.initial()';
}


}




/// @nodoc


class _Loading implements UserDetailState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserDetailState.loading()';
}


}




/// @nodoc


class UserLoaded implements UserDetailState {
  const UserLoaded({required this.user});
  

 final  User user;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoadedCopyWith<UserLoaded> get copyWith => _$UserLoadedCopyWithImpl<UserLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoaded&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailState.loaded(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserLoadedCopyWith<$Res> implements $UserDetailStateCopyWith<$Res> {
  factory $UserLoadedCopyWith(UserLoaded value, $Res Function(UserLoaded) _then) = _$UserLoadedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserLoadedCopyWithImpl<$Res>
    implements $UserLoadedCopyWith<$Res> {
  _$UserLoadedCopyWithImpl(this._self, this._then);

  final UserLoaded _self;
  final $Res Function(UserLoaded) _then;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UserLoaded(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserDetailState
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


class UserUpdated implements UserDetailState {
  const UserUpdated({required this.user});
  

 final  User user;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserUpdatedCopyWith<UserUpdated> get copyWith => _$UserUpdatedCopyWithImpl<UserUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserUpdated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailState.updated(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserUpdatedCopyWith<$Res> implements $UserDetailStateCopyWith<$Res> {
  factory $UserUpdatedCopyWith(UserUpdated value, $Res Function(UserUpdated) _then) = _$UserUpdatedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserUpdatedCopyWithImpl<$Res>
    implements $UserUpdatedCopyWith<$Res> {
  _$UserUpdatedCopyWithImpl(this._self, this._then);

  final UserUpdated _self;
  final $Res Function(UserUpdated) _then;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UserUpdated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserDetailState
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


class UserDetailFailure implements UserDetailState {
  const UserDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailFailureCopyWith<UserDetailFailure> get copyWith => _$UserDetailFailureCopyWithImpl<UserDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'UserDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $UserDetailFailureCopyWith<$Res> implements $UserDetailStateCopyWith<$Res> {
  factory $UserDetailFailureCopyWith(UserDetailFailure value, $Res Function(UserDetailFailure) _then) = _$UserDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$UserDetailFailureCopyWithImpl<$Res>
    implements $UserDetailFailureCopyWith<$Res> {
  _$UserDetailFailureCopyWithImpl(this._self, this._then);

  final UserDetailFailure _self;
  final $Res Function(UserDetailFailure) _then;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(UserDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$UserDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserDetailEvent()';
}


}

/// @nodoc
class $UserDetailEventCopyWith<$Res>  {
$UserDetailEventCopyWith(UserDetailEvent _, $Res Function(UserDetailEvent) __);
}


/// Adds pattern-matching-related methods to [UserDetailEvent].
extension UserDetailEventPatterns on UserDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Retrieved value)?  retrieved,TResult Function( _Updated value)?  updated,TResult Function( _Get value)?  get,TResult Function( _Update value)?  update,TResult Function( _Follow value)?  follow,TResult Function( _Mute value)?  mute,TResult Function( _Block value)?  block,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Retrieved() when retrieved != null:
return retrieved(_that);case _Updated() when updated != null:
return updated(_that);case _Get() when get != null:
return get(_that);case _Update() when update != null:
return update(_that);case _Follow() when follow != null:
return follow(_that);case _Mute() when mute != null:
return mute(_that);case _Block() when block != null:
return block(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Retrieved value)  retrieved,required TResult Function( _Updated value)  updated,required TResult Function( _Get value)  get,required TResult Function( _Update value)  update,required TResult Function( _Follow value)  follow,required TResult Function( _Mute value)  mute,required TResult Function( _Block value)  block,}){
final _that = this;
switch (_that) {
case _Retrieved():
return retrieved(_that);case _Updated():
return updated(_that);case _Get():
return get(_that);case _Update():
return update(_that);case _Follow():
return follow(_that);case _Mute():
return mute(_that);case _Block():
return block(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Retrieved value)?  retrieved,TResult? Function( _Updated value)?  updated,TResult? Function( _Get value)?  get,TResult? Function( _Update value)?  update,TResult? Function( _Follow value)?  follow,TResult? Function( _Mute value)?  mute,TResult? Function( _Block value)?  block,}){
final _that = this;
switch (_that) {
case _Retrieved() when retrieved != null:
return retrieved(_that);case _Updated() when updated != null:
return updated(_that);case _Get() when get != null:
return get(_that);case _Update() when update != null:
return update(_that);case _Follow() when follow != null:
return follow(_that);case _Mute() when mute != null:
return mute(_that);case _Block() when block != null:
return block(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  retrieved,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( User user)?  get,TResult Function( User user,  String name,  String status,  String? imagePath,  String? coverPhotoPath)?  update,TResult Function( User user)?  follow,TResult Function( User user)?  mute,TResult Function( User user)?  block,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Retrieved() when retrieved != null:
return retrieved(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Get() when get != null:
return get(_that.user);case _Update() when update != null:
return update(_that.user,_that.name,_that.status,_that.imagePath,_that.coverPhotoPath);case _Follow() when follow != null:
return follow(_that.user);case _Mute() when mute != null:
return mute(_that.user);case _Block() when block != null:
return block(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  retrieved,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( User user)  get,required TResult Function( User user,  String name,  String status,  String? imagePath,  String? coverPhotoPath)  update,required TResult Function( User user)  follow,required TResult Function( User user)  mute,required TResult Function( User user)  block,}) {final _that = this;
switch (_that) {
case _Retrieved():
return retrieved(_that.payload);case _Updated():
return updated(_that.payload);case _Get():
return get(_that.user);case _Update():
return update(_that.user,_that.name,_that.status,_that.imagePath,_that.coverPhotoPath);case _Follow():
return follow(_that.user);case _Mute():
return mute(_that.user);case _Block():
return block(_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  retrieved,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( User user)?  get,TResult? Function( User user,  String name,  String status,  String? imagePath,  String? coverPhotoPath)?  update,TResult? Function( User user)?  follow,TResult? Function( User user)?  mute,TResult? Function( User user)?  block,}) {final _that = this;
switch (_that) {
case _Retrieved() when retrieved != null:
return retrieved(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Get() when get != null:
return get(_that.user);case _Update() when update != null:
return update(_that.user,_that.name,_that.status,_that.imagePath,_that.coverPhotoPath);case _Follow() when follow != null:
return follow(_that.user);case _Mute() when mute != null:
return mute(_that.user);case _Block() when block != null:
return block(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _Retrieved implements UserDetailEvent {
  const _Retrieved({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetrievedCopyWith<_Retrieved> get copyWith => __$RetrievedCopyWithImpl<_Retrieved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Retrieved&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'UserDetailEvent.retrieved(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$RetrievedCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$RetrievedCopyWith(_Retrieved value, $Res Function(_Retrieved) _then) = __$RetrievedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$RetrievedCopyWithImpl<$Res>
    implements _$RetrievedCopyWith<$Res> {
  __$RetrievedCopyWithImpl(this._self, this._then);

  final _Retrieved _self;
  final $Res Function(_Retrieved) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Retrieved(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements UserDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of UserDetailEvent
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
  return 'UserDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
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

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Get implements UserDetailEvent {
  const _Get({required this.user});
  

 final  User user;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailEvent.get(user: $user)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Get(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserDetailEvent
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


class _Update implements UserDetailEvent {
  const _Update({required this.user, required this.name, required this.status, required this.imagePath, required this.coverPhotoPath});
  

 final  User user;
 final  String name;
 final  String status;
 final  String? imagePath;
 final  String? coverPhotoPath;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.user, user) || other.user == user)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.coverPhotoPath, coverPhotoPath) || other.coverPhotoPath == coverPhotoPath));
}


@override
int get hashCode => Object.hash(runtimeType,user,name,status,imagePath,coverPhotoPath);

@override
String toString() {
  return 'UserDetailEvent.update(user: $user, name: $name, status: $status, imagePath: $imagePath, coverPhotoPath: $coverPhotoPath)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 User user, String name, String status, String? imagePath, String? coverPhotoPath
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? name = null,Object? status = null,Object? imagePath = freezed,Object? coverPhotoPath = freezed,}) {
  return _then(_Update(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,coverPhotoPath: freezed == coverPhotoPath ? _self.coverPhotoPath : coverPhotoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UserDetailEvent
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


class _Follow implements UserDetailEvent {
  const _Follow({required this.user});
  

 final  User user;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowCopyWith<_Follow> get copyWith => __$FollowCopyWithImpl<_Follow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Follow&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailEvent.follow(user: $user)';
}


}

/// @nodoc
abstract mixin class _$FollowCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$FollowCopyWith(_Follow value, $Res Function(_Follow) _then) = __$FollowCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$FollowCopyWithImpl<$Res>
    implements _$FollowCopyWith<$Res> {
  __$FollowCopyWithImpl(this._self, this._then);

  final _Follow _self;
  final $Res Function(_Follow) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Follow(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserDetailEvent
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


class _Mute implements UserDetailEvent {
  const _Mute({required this.user});
  

 final  User user;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuteCopyWith<_Mute> get copyWith => __$MuteCopyWithImpl<_Mute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Mute&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailEvent.mute(user: $user)';
}


}

/// @nodoc
abstract mixin class _$MuteCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$MuteCopyWith(_Mute value, $Res Function(_Mute) _then) = __$MuteCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$MuteCopyWithImpl<$Res>
    implements _$MuteCopyWith<$Res> {
  __$MuteCopyWithImpl(this._self, this._then);

  final _Mute _self;
  final $Res Function(_Mute) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Mute(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserDetailEvent
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


class _Block implements UserDetailEvent {
  const _Block({required this.user});
  

 final  User user;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockCopyWith<_Block> get copyWith => __$BlockCopyWithImpl<_Block>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Block&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailEvent.block(user: $user)';
}


}

/// @nodoc
abstract mixin class _$BlockCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$BlockCopyWith(_Block value, $Res Function(_Block) _then) = __$BlockCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$BlockCopyWithImpl<$Res>
    implements _$BlockCopyWith<$Res> {
  __$BlockCopyWithImpl(this._self, this._then);

  final _Block _self;
  final $Res Function(_Block) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Block(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
