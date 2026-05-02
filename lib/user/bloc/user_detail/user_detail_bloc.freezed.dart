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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( UserRetrieved value)?  retrieved,TResult Function( UserSubscribed value)?  subscribed,TResult Function( UserUpdated value)?  updated,TResult Function( UserPatched value)?  patched,TResult Function( UserVisited value)?  visited,TResult Function( UserDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case UserRetrieved() when retrieved != null:
return retrieved(_that);case UserSubscribed() when subscribed != null:
return subscribed(_that);case UserUpdated() when updated != null:
return updated(_that);case UserPatched() when patched != null:
return patched(_that);case UserVisited() when visited != null:
return visited(_that);case UserDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( UserRetrieved value)  retrieved,required TResult Function( UserSubscribed value)  subscribed,required TResult Function( UserUpdated value)  updated,required TResult Function( UserPatched value)  patched,required TResult Function( UserVisited value)  visited,required TResult Function( UserDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case UserRetrieved():
return retrieved(_that);case UserSubscribed():
return subscribed(_that);case UserUpdated():
return updated(_that);case UserPatched():
return patched(_that);case UserVisited():
return visited(_that);case UserDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( UserRetrieved value)?  retrieved,TResult? Function( UserSubscribed value)?  subscribed,TResult? Function( UserUpdated value)?  updated,TResult? Function( UserPatched value)?  patched,TResult? Function( UserVisited value)?  visited,TResult? Function( UserDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case UserRetrieved() when retrieved != null:
return retrieved(_that);case UserSubscribed() when subscribed != null:
return subscribed(_that);case UserUpdated() when updated != null:
return updated(_that);case UserPatched() when patched != null:
return patched(_that);case UserVisited() when visited != null:
return visited(_that);case UserDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( User user)?  retrieved,TResult Function( User user)?  subscribed,TResult Function( User user)?  updated,TResult Function( User user)?  patched,TResult Function( int userId)?  visited,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case UserRetrieved() when retrieved != null:
return retrieved(_that.user);case UserSubscribed() when subscribed != null:
return subscribed(_that.user);case UserUpdated() when updated != null:
return updated(_that.user);case UserPatched() when patched != null:
return patched(_that.user);case UserVisited() when visited != null:
return visited(_that.userId);case UserDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( User user)  retrieved,required TResult Function( User user)  subscribed,required TResult Function( User user)  updated,required TResult Function( User user)  patched,required TResult Function( int userId)  visited,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case UserRetrieved():
return retrieved(_that.user);case UserSubscribed():
return subscribed(_that.user);case UserUpdated():
return updated(_that.user);case UserPatched():
return patched(_that.user);case UserVisited():
return visited(_that.userId);case UserDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( User user)?  retrieved,TResult? Function( User user)?  subscribed,TResult? Function( User user)?  updated,TResult? Function( User user)?  patched,TResult? Function( int userId)?  visited,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case UserRetrieved() when retrieved != null:
return retrieved(_that.user);case UserSubscribed() when subscribed != null:
return subscribed(_that.user);case UserUpdated() when updated != null:
return updated(_that.user);case UserPatched() when patched != null:
return patched(_that.user);case UserVisited() when visited != null:
return visited(_that.userId);case UserDetailFailure() when failure != null:
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


class UserRetrieved implements UserDetailState {
  const UserRetrieved({required this.user});
  

 final  User user;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRetrievedCopyWith<UserRetrieved> get copyWith => _$UserRetrievedCopyWithImpl<UserRetrieved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRetrieved&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailState.retrieved(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserRetrievedCopyWith<$Res> implements $UserDetailStateCopyWith<$Res> {
  factory $UserRetrievedCopyWith(UserRetrieved value, $Res Function(UserRetrieved) _then) = _$UserRetrievedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserRetrievedCopyWithImpl<$Res>
    implements $UserRetrievedCopyWith<$Res> {
  _$UserRetrievedCopyWithImpl(this._self, this._then);

  final UserRetrieved _self;
  final $Res Function(UserRetrieved) _then;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UserRetrieved(
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


class UserSubscribed implements UserDetailState {
  const UserSubscribed({required this.user});
  

 final  User user;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSubscribedCopyWith<UserSubscribed> get copyWith => _$UserSubscribedCopyWithImpl<UserSubscribed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubscribed&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailState.subscribed(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserSubscribedCopyWith<$Res> implements $UserDetailStateCopyWith<$Res> {
  factory $UserSubscribedCopyWith(UserSubscribed value, $Res Function(UserSubscribed) _then) = _$UserSubscribedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserSubscribedCopyWithImpl<$Res>
    implements $UserSubscribedCopyWith<$Res> {
  _$UserSubscribedCopyWithImpl(this._self, this._then);

  final UserSubscribed _self;
  final $Res Function(UserSubscribed) _then;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UserSubscribed(
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


class UserPatched implements UserDetailState {
  const UserPatched({required this.user});
  

 final  User user;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPatchedCopyWith<UserPatched> get copyWith => _$UserPatchedCopyWithImpl<UserPatched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPatched&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailState.patched(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserPatchedCopyWith<$Res> implements $UserDetailStateCopyWith<$Res> {
  factory $UserPatchedCopyWith(UserPatched value, $Res Function(UserPatched) _then) = _$UserPatchedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserPatchedCopyWithImpl<$Res>
    implements $UserPatchedCopyWith<$Res> {
  _$UserPatchedCopyWithImpl(this._self, this._then);

  final UserPatched _self;
  final $Res Function(UserPatched) _then;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UserPatched(
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


class UserVisited implements UserDetailState {
  const UserVisited({required this.userId});
  

 final  int userId;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserVisitedCopyWith<UserVisited> get copyWith => _$UserVisitedCopyWithImpl<UserVisited>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserVisited&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'UserDetailState.visited(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserVisitedCopyWith<$Res> implements $UserDetailStateCopyWith<$Res> {
  factory $UserVisitedCopyWith(UserVisited value, $Res Function(UserVisited) _then) = _$UserVisitedCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$UserVisitedCopyWithImpl<$Res>
    implements $UserVisitedCopyWith<$Res> {
  _$UserVisitedCopyWithImpl(this._self, this._then);

  final UserVisited _self;
  final $Res Function(UserVisited) _then;

/// Create a copy of UserDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(UserVisited(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Retrieved value)?  retrieved,TResult Function( _Subscribed value)?  subscribed,TResult Function( _Updated value)?  updated,TResult Function( _Retrieve value)?  retrieve,TResult Function( _Subscribe value)?  subscribe,TResult Function( _Patch value)?  patch,TResult Function( _Follow value)?  follow,TResult Function( _Mute value)?  mute,TResult Function( _Block value)?  block,TResult Function( _AddVisit value)?  addVisit,TResult Function( _VisitAdded value)?  visitAdded,TResult Function( _ToggleNotifications value)?  toggleNotifications,TResult Function( _Unsubscribe value)?  unsubscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Retrieved() when retrieved != null:
return retrieved(_that);case _Subscribed() when subscribed != null:
return subscribed(_that);case _Updated() when updated != null:
return updated(_that);case _Retrieve() when retrieve != null:
return retrieve(_that);case _Subscribe() when subscribe != null:
return subscribe(_that);case _Patch() when patch != null:
return patch(_that);case _Follow() when follow != null:
return follow(_that);case _Mute() when mute != null:
return mute(_that);case _Block() when block != null:
return block(_that);case _AddVisit() when addVisit != null:
return addVisit(_that);case _VisitAdded() when visitAdded != null:
return visitAdded(_that);case _ToggleNotifications() when toggleNotifications != null:
return toggleNotifications(_that);case _Unsubscribe() when unsubscribe != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Retrieved value)  retrieved,required TResult Function( _Subscribed value)  subscribed,required TResult Function( _Updated value)  updated,required TResult Function( _Retrieve value)  retrieve,required TResult Function( _Subscribe value)  subscribe,required TResult Function( _Patch value)  patch,required TResult Function( _Follow value)  follow,required TResult Function( _Mute value)  mute,required TResult Function( _Block value)  block,required TResult Function( _AddVisit value)  addVisit,required TResult Function( _VisitAdded value)  visitAdded,required TResult Function( _ToggleNotifications value)  toggleNotifications,required TResult Function( _Unsubscribe value)  unsubscribe,}){
final _that = this;
switch (_that) {
case _Retrieved():
return retrieved(_that);case _Subscribed():
return subscribed(_that);case _Updated():
return updated(_that);case _Retrieve():
return retrieve(_that);case _Subscribe():
return subscribe(_that);case _Patch():
return patch(_that);case _Follow():
return follow(_that);case _Mute():
return mute(_that);case _Block():
return block(_that);case _AddVisit():
return addVisit(_that);case _VisitAdded():
return visitAdded(_that);case _ToggleNotifications():
return toggleNotifications(_that);case _Unsubscribe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Retrieved value)?  retrieved,TResult? Function( _Subscribed value)?  subscribed,TResult? Function( _Updated value)?  updated,TResult? Function( _Retrieve value)?  retrieve,TResult? Function( _Subscribe value)?  subscribe,TResult? Function( _Patch value)?  patch,TResult? Function( _Follow value)?  follow,TResult? Function( _Mute value)?  mute,TResult? Function( _Block value)?  block,TResult? Function( _AddVisit value)?  addVisit,TResult? Function( _VisitAdded value)?  visitAdded,TResult? Function( _ToggleNotifications value)?  toggleNotifications,TResult? Function( _Unsubscribe value)?  unsubscribe,}){
final _that = this;
switch (_that) {
case _Retrieved() when retrieved != null:
return retrieved(_that);case _Subscribed() when subscribed != null:
return subscribed(_that);case _Updated() when updated != null:
return updated(_that);case _Retrieve() when retrieve != null:
return retrieve(_that);case _Subscribe() when subscribe != null:
return subscribe(_that);case _Patch() when patch != null:
return patch(_that);case _Follow() when follow != null:
return follow(_that);case _Mute() when mute != null:
return mute(_that);case _Block() when block != null:
return block(_that);case _AddVisit() when addVisit != null:
return addVisit(_that);case _VisitAdded() when visitAdded != null:
return visitAdded(_that);case _ToggleNotifications() when toggleNotifications != null:
return toggleNotifications(_that);case _Unsubscribe() when unsubscribe != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  retrieved,TResult Function( Map<String, dynamic> payload)?  subscribed,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( int userId)?  retrieve,TResult Function( int userId)?  subscribe,TResult Function( User user,  String name,  String bio,  String? imagePath,  String? coverPhotoPath)?  patch,TResult Function( User user)?  follow,TResult Function( User user)?  mute,TResult Function( User user)?  block,TResult Function( User user)?  addVisit,TResult Function( Map<String, dynamic> payload)?  visitAdded,TResult Function( User user)?  toggleNotifications,TResult Function( User user)?  unsubscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Retrieved() when retrieved != null:
return retrieved(_that.payload);case _Subscribed() when subscribed != null:
return subscribed(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Retrieve() when retrieve != null:
return retrieve(_that.userId);case _Subscribe() when subscribe != null:
return subscribe(_that.userId);case _Patch() when patch != null:
return patch(_that.user,_that.name,_that.bio,_that.imagePath,_that.coverPhotoPath);case _Follow() when follow != null:
return follow(_that.user);case _Mute() when mute != null:
return mute(_that.user);case _Block() when block != null:
return block(_that.user);case _AddVisit() when addVisit != null:
return addVisit(_that.user);case _VisitAdded() when visitAdded != null:
return visitAdded(_that.payload);case _ToggleNotifications() when toggleNotifications != null:
return toggleNotifications(_that.user);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  retrieved,required TResult Function( Map<String, dynamic> payload)  subscribed,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( int userId)  retrieve,required TResult Function( int userId)  subscribe,required TResult Function( User user,  String name,  String bio,  String? imagePath,  String? coverPhotoPath)  patch,required TResult Function( User user)  follow,required TResult Function( User user)  mute,required TResult Function( User user)  block,required TResult Function( User user)  addVisit,required TResult Function( Map<String, dynamic> payload)  visitAdded,required TResult Function( User user)  toggleNotifications,required TResult Function( User user)  unsubscribe,}) {final _that = this;
switch (_that) {
case _Retrieved():
return retrieved(_that.payload);case _Subscribed():
return subscribed(_that.payload);case _Updated():
return updated(_that.payload);case _Retrieve():
return retrieve(_that.userId);case _Subscribe():
return subscribe(_that.userId);case _Patch():
return patch(_that.user,_that.name,_that.bio,_that.imagePath,_that.coverPhotoPath);case _Follow():
return follow(_that.user);case _Mute():
return mute(_that.user);case _Block():
return block(_that.user);case _AddVisit():
return addVisit(_that.user);case _VisitAdded():
return visitAdded(_that.payload);case _ToggleNotifications():
return toggleNotifications(_that.user);case _Unsubscribe():
return unsubscribe(_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  retrieved,TResult? Function( Map<String, dynamic> payload)?  subscribed,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( int userId)?  retrieve,TResult? Function( int userId)?  subscribe,TResult? Function( User user,  String name,  String bio,  String? imagePath,  String? coverPhotoPath)?  patch,TResult? Function( User user)?  follow,TResult? Function( User user)?  mute,TResult? Function( User user)?  block,TResult? Function( User user)?  addVisit,TResult? Function( Map<String, dynamic> payload)?  visitAdded,TResult? Function( User user)?  toggleNotifications,TResult? Function( User user)?  unsubscribe,}) {final _that = this;
switch (_that) {
case _Retrieved() when retrieved != null:
return retrieved(_that.payload);case _Subscribed() when subscribed != null:
return subscribed(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Retrieve() when retrieve != null:
return retrieve(_that.userId);case _Subscribe() when subscribe != null:
return subscribe(_that.userId);case _Patch() when patch != null:
return patch(_that.user,_that.name,_that.bio,_that.imagePath,_that.coverPhotoPath);case _Follow() when follow != null:
return follow(_that.user);case _Mute() when mute != null:
return mute(_that.user);case _Block() when block != null:
return block(_that.user);case _AddVisit() when addVisit != null:
return addVisit(_that.user);case _VisitAdded() when visitAdded != null:
return visitAdded(_that.payload);case _ToggleNotifications() when toggleNotifications != null:
return toggleNotifications(_that.user);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.user);case _:
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


class _Subscribed implements UserDetailEvent {
  const _Subscribed({required final  Map<String, dynamic> payload}): _payload = payload;
  

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
_$SubscribedCopyWith<_Subscribed> get copyWith => __$SubscribedCopyWithImpl<_Subscribed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscribed&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'UserDetailEvent.subscribed(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$SubscribedCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$SubscribedCopyWith(_Subscribed value, $Res Function(_Subscribed) _then) = __$SubscribedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$SubscribedCopyWithImpl<$Res>
    implements _$SubscribedCopyWith<$Res> {
  __$SubscribedCopyWithImpl(this._self, this._then);

  final _Subscribed _self;
  final $Res Function(_Subscribed) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Subscribed(
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


class _Retrieve implements UserDetailEvent {
  const _Retrieve({required this.userId});
  

 final  int userId;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetrieveCopyWith<_Retrieve> get copyWith => __$RetrieveCopyWithImpl<_Retrieve>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Retrieve&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'UserDetailEvent.retrieve(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$RetrieveCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$RetrieveCopyWith(_Retrieve value, $Res Function(_Retrieve) _then) = __$RetrieveCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class __$RetrieveCopyWithImpl<$Res>
    implements _$RetrieveCopyWith<$Res> {
  __$RetrieveCopyWithImpl(this._self, this._then);

  final _Retrieve _self;
  final $Res Function(_Retrieve) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_Retrieve(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Subscribe implements UserDetailEvent {
  const _Subscribe({required this.userId});
  

 final  int userId;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribeCopyWith<_Subscribe> get copyWith => __$SubscribeCopyWithImpl<_Subscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscribe&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'UserDetailEvent.subscribe(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$SubscribeCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$SubscribeCopyWith(_Subscribe value, $Res Function(_Subscribe) _then) = __$SubscribeCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class __$SubscribeCopyWithImpl<$Res>
    implements _$SubscribeCopyWith<$Res> {
  __$SubscribeCopyWithImpl(this._self, this._then);

  final _Subscribe _self;
  final $Res Function(_Subscribe) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_Subscribe(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Patch implements UserDetailEvent {
  const _Patch({required this.user, required this.name, required this.bio, required this.imagePath, required this.coverPhotoPath});
  

 final  User user;
 final  String name;
 final  String bio;
 final  String? imagePath;
 final  String? coverPhotoPath;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchCopyWith<_Patch> get copyWith => __$PatchCopyWithImpl<_Patch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Patch&&(identical(other.user, user) || other.user == user)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.coverPhotoPath, coverPhotoPath) || other.coverPhotoPath == coverPhotoPath));
}


@override
int get hashCode => Object.hash(runtimeType,user,name,bio,imagePath,coverPhotoPath);

@override
String toString() {
  return 'UserDetailEvent.patch(user: $user, name: $name, bio: $bio, imagePath: $imagePath, coverPhotoPath: $coverPhotoPath)';
}


}

/// @nodoc
abstract mixin class _$PatchCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$PatchCopyWith(_Patch value, $Res Function(_Patch) _then) = __$PatchCopyWithImpl;
@useResult
$Res call({
 User user, String name, String bio, String? imagePath, String? coverPhotoPath
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$PatchCopyWithImpl<$Res>
    implements _$PatchCopyWith<$Res> {
  __$PatchCopyWithImpl(this._self, this._then);

  final _Patch _self;
  final $Res Function(_Patch) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? name = null,Object? bio = null,Object? imagePath = freezed,Object? coverPhotoPath = freezed,}) {
  return _then(_Patch(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
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

/// @nodoc


class _AddVisit implements UserDetailEvent {
  const _AddVisit({required this.user});
  

 final  User user;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddVisitCopyWith<_AddVisit> get copyWith => __$AddVisitCopyWithImpl<_AddVisit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVisit&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailEvent.addVisit(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AddVisitCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$AddVisitCopyWith(_AddVisit value, $Res Function(_AddVisit) _then) = __$AddVisitCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AddVisitCopyWithImpl<$Res>
    implements _$AddVisitCopyWith<$Res> {
  __$AddVisitCopyWithImpl(this._self, this._then);

  final _AddVisit _self;
  final $Res Function(_AddVisit) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_AddVisit(
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


class _VisitAdded implements UserDetailEvent {
  const _VisitAdded({required final  Map<String, dynamic> payload}): _payload = payload;
  

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
_$VisitAddedCopyWith<_VisitAdded> get copyWith => __$VisitAddedCopyWithImpl<_VisitAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisitAdded&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'UserDetailEvent.visitAdded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$VisitAddedCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$VisitAddedCopyWith(_VisitAdded value, $Res Function(_VisitAdded) _then) = __$VisitAddedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$VisitAddedCopyWithImpl<$Res>
    implements _$VisitAddedCopyWith<$Res> {
  __$VisitAddedCopyWithImpl(this._self, this._then);

  final _VisitAdded _self;
  final $Res Function(_VisitAdded) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_VisitAdded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _ToggleNotifications implements UserDetailEvent {
  const _ToggleNotifications({required this.user});
  

 final  User user;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleNotificationsCopyWith<_ToggleNotifications> get copyWith => __$ToggleNotificationsCopyWithImpl<_ToggleNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleNotifications&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailEvent.toggleNotifications(user: $user)';
}


}

/// @nodoc
abstract mixin class _$ToggleNotificationsCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$ToggleNotificationsCopyWith(_ToggleNotifications value, $Res Function(_ToggleNotifications) _then) = __$ToggleNotificationsCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$ToggleNotificationsCopyWithImpl<$Res>
    implements _$ToggleNotificationsCopyWith<$Res> {
  __$ToggleNotificationsCopyWithImpl(this._self, this._then);

  final _ToggleNotifications _self;
  final $Res Function(_ToggleNotifications) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_ToggleNotifications(
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


class _Unsubscribe implements UserDetailEvent {
  const _Unsubscribe({required this.user});
  

 final  User user;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeCopyWith<_Unsubscribe> get copyWith => __$UnsubscribeCopyWithImpl<_Unsubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsubscribe&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserDetailEvent.unsubscribe(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeCopyWith<$Res> implements $UserDetailEventCopyWith<$Res> {
  factory _$UnsubscribeCopyWith(_Unsubscribe value, $Res Function(_Unsubscribe) _then) = __$UnsubscribeCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UnsubscribeCopyWithImpl<$Res>
    implements _$UnsubscribeCopyWith<$Res> {
  __$UnsubscribeCopyWithImpl(this._self, this._then);

  final _Unsubscribe _self;
  final $Res Function(_Unsubscribe) _then;

/// Create a copy of UserDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Unsubscribe(
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
