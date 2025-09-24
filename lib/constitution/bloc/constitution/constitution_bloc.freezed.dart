// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'constitution_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConstitutionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstitutionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConstitutionState()';
}


}

/// @nodoc
class $ConstitutionStateCopyWith<$Res>  {
$ConstitutionStateCopyWith(ConstitutionState _, $Res Function(ConstitutionState) __);
}


/// Adds pattern-matching-related methods to [ConstitutionState].
extension ConstitutionStatePatterns on ConstitutionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConstitutionInitial value)?  initial,TResult Function( ConstitutionLoading value)?  loading,TResult Function( ConstitutionLoaded value)?  loaded,TResult Function( ConstitutionFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConstitutionInitial() when initial != null:
return initial(_that);case ConstitutionLoading() when loading != null:
return loading(_that);case ConstitutionLoaded() when loaded != null:
return loaded(_that);case ConstitutionFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConstitutionInitial value)  initial,required TResult Function( ConstitutionLoading value)  loading,required TResult Function( ConstitutionLoaded value)  loaded,required TResult Function( ConstitutionFailure value)  failure,}){
final _that = this;
switch (_that) {
case ConstitutionInitial():
return initial(_that);case ConstitutionLoading():
return loading(_that);case ConstitutionLoaded():
return loaded(_that);case ConstitutionFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConstitutionInitial value)?  initial,TResult? Function( ConstitutionLoading value)?  loading,TResult? Function( ConstitutionLoaded value)?  loaded,TResult? Function( ConstitutionFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ConstitutionInitial() when initial != null:
return initial(_that);case ConstitutionLoading() when loading != null:
return loading(_that);case ConstitutionLoaded() when loaded != null:
return loaded(_that);case ConstitutionFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Section> sections)?  loaded,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConstitutionInitial() when initial != null:
return initial();case ConstitutionLoading() when loading != null:
return loading();case ConstitutionLoaded() when loaded != null:
return loaded(_that.sections);case ConstitutionFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Section> sections)  loaded,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case ConstitutionInitial():
return initial();case ConstitutionLoading():
return loading();case ConstitutionLoaded():
return loaded(_that.sections);case ConstitutionFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Section> sections)?  loaded,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case ConstitutionInitial() when initial != null:
return initial();case ConstitutionLoading() when loading != null:
return loading();case ConstitutionLoaded() when loaded != null:
return loaded(_that.sections);case ConstitutionFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ConstitutionInitial implements ConstitutionState {
  const ConstitutionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstitutionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConstitutionState.initial()';
}


}




/// @nodoc


class ConstitutionLoading implements ConstitutionState {
  const ConstitutionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstitutionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConstitutionState.loading()';
}


}




/// @nodoc


class ConstitutionLoaded implements ConstitutionState {
  const ConstitutionLoaded({required final  List<Section> sections}): _sections = sections;
  

 final  List<Section> _sections;
 List<Section> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of ConstitutionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConstitutionLoadedCopyWith<ConstitutionLoaded> get copyWith => _$ConstitutionLoadedCopyWithImpl<ConstitutionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstitutionLoaded&&const DeepCollectionEquality().equals(other._sections, _sections));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'ConstitutionState.loaded(sections: $sections)';
}


}

/// @nodoc
abstract mixin class $ConstitutionLoadedCopyWith<$Res> implements $ConstitutionStateCopyWith<$Res> {
  factory $ConstitutionLoadedCopyWith(ConstitutionLoaded value, $Res Function(ConstitutionLoaded) _then) = _$ConstitutionLoadedCopyWithImpl;
@useResult
$Res call({
 List<Section> sections
});




}
/// @nodoc
class _$ConstitutionLoadedCopyWithImpl<$Res>
    implements $ConstitutionLoadedCopyWith<$Res> {
  _$ConstitutionLoadedCopyWithImpl(this._self, this._then);

  final ConstitutionLoaded _self;
  final $Res Function(ConstitutionLoaded) _then;

/// Create a copy of ConstitutionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sections = null,}) {
  return _then(ConstitutionLoaded(
sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<Section>,
  ));
}


}

/// @nodoc


class ConstitutionFailure implements ConstitutionState {
  const ConstitutionFailure({required this.error});
  

 final  String error;

/// Create a copy of ConstitutionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConstitutionFailureCopyWith<ConstitutionFailure> get copyWith => _$ConstitutionFailureCopyWithImpl<ConstitutionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstitutionFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ConstitutionState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ConstitutionFailureCopyWith<$Res> implements $ConstitutionStateCopyWith<$Res> {
  factory $ConstitutionFailureCopyWith(ConstitutionFailure value, $Res Function(ConstitutionFailure) _then) = _$ConstitutionFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ConstitutionFailureCopyWithImpl<$Res>
    implements $ConstitutionFailureCopyWith<$Res> {
  _$ConstitutionFailureCopyWithImpl(this._self, this._then);

  final ConstitutionFailure _self;
  final $Res Function(ConstitutionFailure) _then;

/// Create a copy of ConstitutionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ConstitutionFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ConstitutionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstitutionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConstitutionEvent()';
}


}

/// @nodoc
class $ConstitutionEventCopyWith<$Res>  {
$ConstitutionEventCopyWith(ConstitutionEvent _, $Res Function(ConstitutionEvent) __);
}


/// Adds pattern-matching-related methods to [ConstitutionEvent].
extension ConstitutionEventPatterns on ConstitutionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Get value)?  get,TResult Function( _Received value)?  received,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Get value)  get,required TResult Function( _Received value)  received,}){
final _that = this;
switch (_that) {
case _Get():
return get(_that);case _Received():
return received(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Get value)?  get,TResult? Function( _Received value)?  received,}){
final _that = this;
switch (_that) {
case _Get() when get != null:
return get(_that);case _Received() when received != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  get,TResult Function( Map<String, dynamic> payload)?  received,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get();case _Received() when received != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  get,required TResult Function( Map<String, dynamic> payload)  received,}) {final _that = this;
switch (_that) {
case _Get():
return get();case _Received():
return received(_that.payload);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  get,TResult? Function( Map<String, dynamic> payload)?  received,}) {final _that = this;
switch (_that) {
case _Get() when get != null:
return get();case _Received() when received != null:
return received(_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _Get implements ConstitutionEvent {
  const _Get();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConstitutionEvent.get()';
}


}




/// @nodoc


class _Received implements ConstitutionEvent {
  const _Received({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of ConstitutionEvent
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
  return 'ConstitutionEvent.received(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReceivedCopyWith<$Res> implements $ConstitutionEventCopyWith<$Res> {
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

/// Create a copy of ConstitutionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Received(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
