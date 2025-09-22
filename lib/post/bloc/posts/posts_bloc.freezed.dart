// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostsEvent()';
}


}

/// @nodoc
class $PostsEventCopyWith<$Res>  {
$PostsEventCopyWith(PostsEvent _, $Res Function(PostsEvent) __);
}


/// Adds pattern-matching-related methods to [PostsEvent].
extension PostsEventPatterns on PostsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,TResult Function( _Resubscribe value)?  resubscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Resubscribe() when resubscribe != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,required TResult Function( _Resubscribe value)  resubscribe,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);case _Resubscribe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,TResult? Function( _Resubscribe value)?  resubscribe,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Resubscribe() when resubscribe != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? searchTerm,  Post? lastPost)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( List<Post> posts)?  resubscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.searchTerm,_that.lastPost);case _Received() when received != null:
return received(_that.payload);case _Resubscribe() when resubscribe != null:
return resubscribe(_that.posts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? searchTerm,  Post? lastPost)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( List<Post> posts)  resubscribe,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.searchTerm,_that.lastPost);case _Received():
return received(_that.payload);case _Resubscribe():
return resubscribe(_that.posts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? searchTerm,  Post? lastPost)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( List<Post> posts)?  resubscribe,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.searchTerm,_that.lastPost);case _Received() when received != null:
return received(_that.payload);case _Resubscribe() when resubscribe != null:
return resubscribe(_that.posts);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements PostsEvent {
  const _Get({this.searchTerm, this.lastPost});
  

 final  String? searchTerm;
 final  Post? lastPost;

/// Create a copy of PostsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.lastPost, lastPost) || other.lastPost == lastPost));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,lastPost);

@override
String toString() {
  return 'PostsEvent.get(searchTerm: $searchTerm, lastPost: $lastPost)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $PostsEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, Post? lastPost
});


$PostCopyWith<$Res>? get lastPost;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of PostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? lastPost = freezed,}) {
  return _then(_Get(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,lastPost: freezed == lastPost ? _self.lastPost : lastPost // ignore: cast_nullable_to_non_nullable
as Post?,
  ));
}

/// Create a copy of PostsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get lastPost {
    if (_self.lastPost == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.lastPost!, (value) {
    return _then(_self.copyWith(lastPost: value));
  });
}
}

/// @nodoc


class _Received implements PostsEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PostsEvent
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
  return 'PostsEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $PostsEventCopyWith<$Res> {
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

/// Create a copy of PostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Resubscribe implements PostsEvent {
  const _Resubscribe({required final  List<Post> posts}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of PostsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResubscribeCopyWith<_Resubscribe> get copyWith => __$ResubscribeCopyWithImpl<_Resubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resubscribe&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'PostsEvent.resubscribe(posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$ResubscribeCopyWith<$Res> implements $PostsEventCopyWith<$Res> {
  factory _$ResubscribeCopyWith(_Resubscribe value, $Res Function(_Resubscribe) _then) = __$ResubscribeCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class __$ResubscribeCopyWithImpl<$Res>
    implements _$ResubscribeCopyWith<$Res> {
  __$ResubscribeCopyWithImpl(this._self, this._then);

  final _Resubscribe _self;
  final $Res Function(_Resubscribe) _then;

/// Create a copy of PostsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(_Resubscribe(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

// dart format on
