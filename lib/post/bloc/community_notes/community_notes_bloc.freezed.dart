// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_notes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommunityNotesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityNotesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommunityNotesEvent()';
}


}

/// @nodoc
class $CommunityNotesEventCopyWith<$Res>  {
$CommunityNotesEventCopyWith(CommunityNotesEvent _, $Res Function(CommunityNotesEvent) __);
}


/// Adds pattern-matching-related methods to [CommunityNotesEvent].
extension CommunityNotesEventPatterns on CommunityNotesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initialize value)?  initialize,TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,TResult Function( _Update value)?  update,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that);case _Get() when get != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initialize value)  initialize,required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,required TResult Function( _Update value)  update,}){
final _that = this;
switch (_that) {
case _Initialize():
return initialize(_that);case _Get():
return get(_that);case _Received():
return received(_that);case _Update():
return update(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initialize value)?  initialize,TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,TResult? Function( _Update value)?  update,}){
final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that);case _Get() when get != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Post post)?  initialize,TResult Function( Post post,  String? searchTerm,  String? sortBy,  List<Post>? previousPosts)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( List<Post> posts)?  update,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that.post);case _Get() when get != null:
return get(_that.post,_that.searchTerm,_that.sortBy,_that.previousPosts);case _Received() when received != null:
return received(_that.payload);case _Update() when update != null:
return update(_that.posts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Post post)  initialize,required TResult Function( Post post,  String? searchTerm,  String? sortBy,  List<Post>? previousPosts)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( List<Post> posts)  update,}) {final _that = this;
switch (_that) {
case _Initialize():
return initialize(_that.post);case _Get():
return get(_that.post,_that.searchTerm,_that.sortBy,_that.previousPosts);case _Received():
return received(_that.payload);case _Update():
return update(_that.posts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Post post)?  initialize,TResult? Function( Post post,  String? searchTerm,  String? sortBy,  List<Post>? previousPosts)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( List<Post> posts)?  update,}) {final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that.post);case _Get() when get != null:
return get(_that.post,_that.searchTerm,_that.sortBy,_that.previousPosts);case _Received() when received != null:
return received(_that.payload);case _Update() when update != null:
return update(_that.posts);case _:
  return null;

}
}

}

/// @nodoc


class _Initialize implements CommunityNotesEvent {
  const _Initialize({required this.post});
  

 final  Post post;

/// Create a copy of CommunityNotesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitializeCopyWith<_Initialize> get copyWith => __$InitializeCopyWithImpl<_Initialize>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initialize&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'CommunityNotesEvent.initialize(post: $post)';
}


}

/// @nodoc
abstract mixin class _$InitializeCopyWith<$Res> implements $CommunityNotesEventCopyWith<$Res> {
  factory _$InitializeCopyWith(_Initialize value, $Res Function(_Initialize) _then) = __$InitializeCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$InitializeCopyWithImpl<$Res>
    implements _$InitializeCopyWith<$Res> {
  __$InitializeCopyWithImpl(this._self, this._then);

  final _Initialize _self;
  final $Res Function(_Initialize) _then;

/// Create a copy of CommunityNotesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Initialize(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of CommunityNotesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _Get implements CommunityNotesEvent {
  const _Get({required this.post, this.searchTerm, this.sortBy, final  List<Post>? previousPosts}): _previousPosts = previousPosts;
  

 final  Post post;
 final  String? searchTerm;
 final  String? sortBy;
 final  List<Post>? _previousPosts;
 List<Post>? get previousPosts {
  final value = _previousPosts;
  if (value == null) return null;
  if (_previousPosts is EqualUnmodifiableListView) return _previousPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CommunityNotesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.post, post) || other.post == post)&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&const DeepCollectionEquality().equals(other._previousPosts, _previousPosts));
}


@override
int get hashCode => Object.hash(runtimeType,post,searchTerm,sortBy,const DeepCollectionEquality().hash(_previousPosts));

@override
String toString() {
  return 'CommunityNotesEvent.get(post: $post, searchTerm: $searchTerm, sortBy: $sortBy, previousPosts: $previousPosts)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $CommunityNotesEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 Post post, String? searchTerm, String? sortBy, List<Post>? previousPosts
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of CommunityNotesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,Object? searchTerm = freezed,Object? sortBy = freezed,Object? previousPosts = freezed,}) {
  return _then(_Get(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,previousPosts: freezed == previousPosts ? _self._previousPosts : previousPosts // ignore: cast_nullable_to_non_nullable
as List<Post>?,
  ));
}

/// Create a copy of CommunityNotesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _Received implements CommunityNotesEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of CommunityNotesEvent
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
  return 'CommunityNotesEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $CommunityNotesEventCopyWith<$Res> {
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

/// Create a copy of CommunityNotesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Update implements CommunityNotesEvent {
  const _Update({required final  List<Post> posts}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of CommunityNotesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'CommunityNotesEvent.update(posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $CommunityNotesEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of CommunityNotesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(_Update(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

// dart format on
