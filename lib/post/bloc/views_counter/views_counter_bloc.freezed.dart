// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'views_counter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewsCounterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewsCounterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewsCounterEvent()';
}


}

/// @nodoc
class $ViewsCounterEventCopyWith<$Res>  {
$ViewsCounterEventCopyWith(ViewsCounterEvent _, $Res Function(ViewsCounterEvent) __);
}


/// Adds pattern-matching-related methods to [ViewsCounterEvent].
extension ViewsCounterEventPatterns on ViewsCounterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Viewed value)?  viewed,TResult Function( _Received value)?  received,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Viewed() when viewed != null:
return viewed(_that);case _Received() when received != null:
return received(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Viewed value)  viewed,required TResult Function( _Received value)  received,}){
final _that = this;
switch (_that) {
case _Viewed():
return viewed(_that);case _Received():
return received(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Viewed value)?  viewed,TResult? Function( _Received value)?  received,}){
final _that = this;
switch (_that) {
case _Viewed() when viewed != null:
return viewed(_that);case _Received() when received != null:
return received(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Post post)?  viewed,TResult Function( Map<String, dynamic> payload)?  received,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Viewed() when viewed != null:
return viewed(_that.post);case _Received() when received != null:
return received(_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Post post)  viewed,required TResult Function( Map<String, dynamic> payload)  received,}) {final _that = this;
switch (_that) {
case _Viewed():
return viewed(_that.post);case _Received():
return received(_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Post post)?  viewed,TResult? Function( Map<String, dynamic> payload)?  received,}) {final _that = this;
switch (_that) {
case _Viewed() when viewed != null:
return viewed(_that.post);case _Received() when received != null:
return received(_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _Viewed implements ViewsCounterEvent {
  const _Viewed({required this.post});
  

 final  Post post;

/// Create a copy of ViewsCounterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewedCopyWith<_Viewed> get copyWith => __$ViewedCopyWithImpl<_Viewed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Viewed&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'ViewsCounterEvent.viewed(post: $post)';
}


}

/// @nodoc
abstract mixin class _$ViewedCopyWith<$Res> implements $ViewsCounterEventCopyWith<$Res> {
  factory _$ViewedCopyWith(_Viewed value, $Res Function(_Viewed) _then) = __$ViewedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$ViewedCopyWithImpl<$Res>
    implements _$ViewedCopyWith<$Res> {
  __$ViewedCopyWithImpl(this._self, this._then);

  final _Viewed _self;
  final $Res Function(_Viewed) _then;

/// Create a copy of ViewsCounterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Viewed(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of ViewsCounterEvent
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


class _Received implements ViewsCounterEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of ViewsCounterEvent
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
  return 'ViewsCounterEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $ViewsCounterEventCopyWith<$Res> {
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

/// Create a copy of ViewsCounterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
