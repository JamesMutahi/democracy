// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RepliesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepliesEvent()';
}


}

/// @nodoc
class $RepliesEventCopyWith<$Res>  {
$RepliesEventCopyWith(RepliesEvent _, $Res Function(RepliesEvent) __);
}


/// Adds pattern-matching-related methods to [RepliesEvent].
extension RepliesEventPatterns on RepliesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,TResult Function( _Resubscribe value)?  resubscribe,TResult Function( _Unsubscribe value)?  unsubscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Resubscribe() when resubscribe != null:
return resubscribe(_that);case _Unsubscribe() when unsubscribe != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,required TResult Function( _Resubscribe value)  resubscribe,required TResult Function( _Unsubscribe value)  unsubscribe,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);case _Resubscribe():
return resubscribe(_that);case _Unsubscribe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,TResult? Function( _Resubscribe value)?  resubscribe,TResult? Function( _Unsubscribe value)?  unsubscribe,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
return received(_that);case _Resubscribe() when resubscribe != null:
return resubscribe(_that);case _Unsubscribe() when unsubscribe != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Post post,  Post? lastPost)?  get,TResult Function( Map<String, dynamic> payload)?  received,TResult Function( Post post,  List<Post> replies)?  resubscribe,TResult Function( Post post)?  unsubscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.post,_that.lastPost);case _Received() when received != null:
return received(_that.payload);case _Resubscribe() when resubscribe != null:
return resubscribe(_that.post,_that.replies);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.post);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Post post,  Post? lastPost)  get,required TResult Function( Map<String, dynamic> payload)  received,required TResult Function( Post post,  List<Post> replies)  resubscribe,required TResult Function( Post post)  unsubscribe,}) {final _that = this;
switch (_that) {
case _Get():
return get(_that.post,_that.lastPost);case _Received():
return received(_that.payload);case _Resubscribe():
return resubscribe(_that.post,_that.replies);case _Unsubscribe():
return unsubscribe(_that.post);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Post post,  Post? lastPost)?  get,TResult? Function( Map<String, dynamic> payload)?  received,TResult? Function( Post post,  List<Post> replies)?  resubscribe,TResult? Function( Post post)?  unsubscribe,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that.post,_that.lastPost);case _Received() when received != null:
return received(_that.payload);case _Resubscribe() when resubscribe != null:
return resubscribe(_that.post,_that.replies);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.post);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements RepliesEvent {
  const _Get({required this.post, this.lastPost});
  

 final  Post post;
 final  Post? lastPost;

/// Create a copy of RepliesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.post, post) || other.post == post)&&(identical(other.lastPost, lastPost) || other.lastPost == lastPost));
}


@override
int get hashCode => Object.hash(runtimeType,post,lastPost);

@override
String toString() {
  return 'RepliesEvent.get(post: $post, lastPost: $lastPost)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $RepliesEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 Post post, Post? lastPost
});


$PostCopyWith<$Res> get post;$PostCopyWith<$Res>? get lastPost;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of RepliesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,Object? lastPost = freezed,}) {
  return _then(_Get(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,lastPost: freezed == lastPost ? _self.lastPost : lastPost // ignore: cast_nullable_to_non_nullable
as Post?,
  ));
}

/// Create a copy of RepliesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}/// Create a copy of RepliesEvent
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


class _Received implements RepliesEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of RepliesEvent
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
  return 'RepliesEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $RepliesEventCopyWith<$Res> {
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

/// Create a copy of RepliesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Resubscribe implements RepliesEvent {
  const _Resubscribe({required this.post, required final  List<Post> replies}): _replies = replies;
  

 final  Post post;
 final  List<Post> _replies;
 List<Post> get replies {
  if (_replies is EqualUnmodifiableListView) return _replies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replies);
}


/// Create a copy of RepliesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResubscribeCopyWith<_Resubscribe> get copyWith => __$ResubscribeCopyWithImpl<_Resubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resubscribe&&(identical(other.post, post) || other.post == post)&&const DeepCollectionEquality().equals(other._replies, _replies));
}


@override
int get hashCode => Object.hash(runtimeType,post,const DeepCollectionEquality().hash(_replies));

@override
String toString() {
  return 'RepliesEvent.resubscribe(post: $post, replies: $replies)';
}


}

/// @nodoc
abstract mixin class _$ResubscribeCopyWith<$Res> implements $RepliesEventCopyWith<$Res> {
  factory _$ResubscribeCopyWith(_Resubscribe value, $Res Function(_Resubscribe) _then) = __$ResubscribeCopyWithImpl;
@useResult
$Res call({
 Post post, List<Post> replies
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$ResubscribeCopyWithImpl<$Res>
    implements _$ResubscribeCopyWith<$Res> {
  __$ResubscribeCopyWithImpl(this._self, this._then);

  final _Resubscribe _self;
  final $Res Function(_Resubscribe) _then;

/// Create a copy of RepliesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,Object? replies = null,}) {
  return _then(_Resubscribe(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,replies: null == replies ? _self._replies : replies // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}

/// Create a copy of RepliesEvent
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


class _Unsubscribe implements RepliesEvent {
  const _Unsubscribe({required this.post});
  

 final  Post post;

/// Create a copy of RepliesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeCopyWith<_Unsubscribe> get copyWith => __$UnsubscribeCopyWithImpl<_Unsubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsubscribe&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'RepliesEvent.unsubscribe(post: $post)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeCopyWith<$Res> implements $RepliesEventCopyWith<$Res> {
  factory _$UnsubscribeCopyWith(_Unsubscribe value, $Res Function(_Unsubscribe) _then) = __$UnsubscribeCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$UnsubscribeCopyWithImpl<$Res>
    implements _$UnsubscribeCopyWith<$Res> {
  __$UnsubscribeCopyWithImpl(this._self, this._then);

  final _Unsubscribe _self;
  final $Res Function(_Unsubscribe) _then;

/// Create a copy of RepliesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Unsubscribe(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of RepliesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
