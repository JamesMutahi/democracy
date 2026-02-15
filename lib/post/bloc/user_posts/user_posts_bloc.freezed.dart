// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_posts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPostsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPostsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPostsEvent()';
}


}

/// @nodoc
class $UserPostsEventCopyWith<$Res>  {
$UserPostsEventCopyWith(UserPostsEvent _, $Res Function(UserPostsEvent) __);
}


/// Adds pattern-matching-related methods to [UserPostsEvent].
extension UserPostsEventPatterns on UserPostsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,TResult Function( _Unsubscribe value)?  unsubscribe,TResult Function( _Resubscribe value)?  resubscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that);case _Resubscribe() when resubscribe != null:
return resubscribe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,required TResult Function( _Unsubscribe value)  unsubscribe,required TResult Function( _Resubscribe value)  resubscribe,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);case _Unsubscribe():
return unsubscribe(_that);case _Resubscribe():
return resubscribe(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,TResult? Function( _Unsubscribe value)?  unsubscribe,TResult? Function( _Resubscribe value)?  resubscribe,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that);case _Resubscribe() when resubscribe != null:
return resubscribe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( User user,  List<Post>? lastPosts)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( User user,  List<Post> posts)?  unsubscribe,TResult Function( User user,  List<Post> posts)?  resubscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.user,_that.lastPosts);case _Received() when received != null:
return received(_that.payload);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.user,_that.posts);case _Resubscribe() when resubscribe != null:
return resubscribe(_that.user,_that.posts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( User user,  List<Post>? lastPosts)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( User user,  List<Post> posts)  unsubscribe,required TResult Function( User user,  List<Post> posts)  resubscribe,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.user,_that.lastPosts);case _Received():
return received(_that.payload);case _Unsubscribe():
return unsubscribe(_that.user,_that.posts);case _Resubscribe():
return resubscribe(_that.user,_that.posts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( User user,  List<Post>? lastPosts)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( User user,  List<Post> posts)?  unsubscribe,TResult? Function( User user,  List<Post> posts)?  resubscribe,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.user,_that.lastPosts);case _Received() when received != null:
return received(_that.payload);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.user,_that.posts);case _Resubscribe() when resubscribe != null:
return resubscribe(_that.user,_that.posts);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements UserPostsEvent {
  const _Get({required this.user, final  List<Post>? lastPosts}): _lastPosts = lastPosts;
  

 final  User user;
 final  List<Post>? _lastPosts;
 List<Post>? get lastPosts {
  final value = _lastPosts;
  if (value == null) return null;
  if (_lastPosts is EqualUnmodifiableListView) return _lastPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserPostsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._lastPosts, _lastPosts));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_lastPosts));

@override
String toString() {
  return 'UserPostsEvent.get(user: $user, lastPosts: $lastPosts)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $UserPostsEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 User user, List<Post>? lastPosts
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of UserPostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? lastPosts = freezed,}) {
  return _then(_Get(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,lastPosts: freezed == lastPosts ? _self._lastPosts : lastPosts // ignore: cast_nullable_to_non_nullable
as List<Post>?,
  ));
}

/// Create a copy of UserPostsEvent
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


class _Received implements UserPostsEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of UserPostsEvent
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
  return 'UserPostsEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $UserPostsEventCopyWith<$Res> {
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

/// Create a copy of UserPostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Unsubscribe implements UserPostsEvent {
  const _Unsubscribe({required this.user, required final  List<Post> posts}): _posts = posts;
  

 final  User user;
 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of UserPostsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeCopyWith<_Unsubscribe> get copyWith => __$UnsubscribeCopyWithImpl<_Unsubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsubscribe&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'UserPostsEvent.unsubscribe(user: $user, posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeCopyWith<$Res> implements $UserPostsEventCopyWith<$Res> {
  factory _$UnsubscribeCopyWith(_Unsubscribe value, $Res Function(_Unsubscribe) _then) = __$UnsubscribeCopyWithImpl;
@useResult
$Res call({
 User user, List<Post> posts
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UnsubscribeCopyWithImpl<$Res>
    implements _$UnsubscribeCopyWith<$Res> {
  __$UnsubscribeCopyWithImpl(this._self, this._then);

  final _Unsubscribe _self;
  final $Res Function(_Unsubscribe) _then;

/// Create a copy of UserPostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? posts = null,}) {
  return _then(_Unsubscribe(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}

/// Create a copy of UserPostsEvent
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


class _Resubscribe implements UserPostsEvent {
  const _Resubscribe({required this.user, required final  List<Post> posts}): _posts = posts;
  

 final  User user;
 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of UserPostsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResubscribeCopyWith<_Resubscribe> get copyWith => __$ResubscribeCopyWithImpl<_Resubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resubscribe&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'UserPostsEvent.resubscribe(user: $user, posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$ResubscribeCopyWith<$Res> implements $UserPostsEventCopyWith<$Res> {
  factory _$ResubscribeCopyWith(_Resubscribe value, $Res Function(_Resubscribe) _then) = __$ResubscribeCopyWithImpl;
@useResult
$Res call({
 User user, List<Post> posts
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$ResubscribeCopyWithImpl<$Res>
    implements _$ResubscribeCopyWith<$Res> {
  __$ResubscribeCopyWithImpl(this._self, this._then);

  final _Resubscribe _self;
  final $Res Function(_Resubscribe) _then;

/// Create a copy of UserPostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? posts = null,}) {
  return _then(_Resubscribe(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}

/// Create a copy of UserPostsEvent
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
