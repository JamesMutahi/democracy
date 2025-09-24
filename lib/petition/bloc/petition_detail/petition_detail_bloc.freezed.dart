// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petition_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetitionDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetitionDetailState()';
}


}

/// @nodoc
class $PetitionDetailStateCopyWith<$Res>  {
$PetitionDetailStateCopyWith(PetitionDetailState _, $Res Function(PetitionDetailState) __);
}


/// Adds pattern-matching-related methods to [PetitionDetailState].
extension PetitionDetailStatePatterns on PetitionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetitionDetailInitial value)?  initial,TResult Function( PetitionDetailLoading value)?  loading,TResult Function( PetitionCreated value)?  created,TResult Function( PetitionUpdated value)?  updated,TResult Function( PetitionDeleted value)?  deleted,TResult Function( PetitionDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetitionDetailInitial() when initial != null:
return initial(_that);case PetitionDetailLoading() when loading != null:
return loading(_that);case PetitionCreated() when created != null:
return created(_that);case PetitionUpdated() when updated != null:
return updated(_that);case PetitionDeleted() when deleted != null:
return deleted(_that);case PetitionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetitionDetailInitial value)  initial,required TResult Function( PetitionDetailLoading value)  loading,required TResult Function( PetitionCreated value)  created,required TResult Function( PetitionUpdated value)  updated,required TResult Function( PetitionDeleted value)  deleted,required TResult Function( PetitionDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case PetitionDetailInitial():
return initial(_that);case PetitionDetailLoading():
return loading(_that);case PetitionCreated():
return created(_that);case PetitionUpdated():
return updated(_that);case PetitionDeleted():
return deleted(_that);case PetitionDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetitionDetailInitial value)?  initial,TResult? Function( PetitionDetailLoading value)?  loading,TResult? Function( PetitionCreated value)?  created,TResult? Function( PetitionUpdated value)?  updated,TResult? Function( PetitionDeleted value)?  deleted,TResult? Function( PetitionDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case PetitionDetailInitial() when initial != null:
return initial(_that);case PetitionDetailLoading() when loading != null:
return loading(_that);case PetitionCreated() when created != null:
return created(_that);case PetitionUpdated() when updated != null:
return updated(_that);case PetitionDeleted() when deleted != null:
return deleted(_that);case PetitionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Petition petition)?  created,TResult Function( Petition petition)?  updated,TResult Function( int petitionId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetitionDetailInitial() when initial != null:
return initial();case PetitionDetailLoading() when loading != null:
return loading();case PetitionCreated() when created != null:
return created(_that.petition);case PetitionUpdated() when updated != null:
return updated(_that.petition);case PetitionDeleted() when deleted != null:
return deleted(_that.petitionId);case PetitionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Petition petition)  created,required TResult Function( Petition petition)  updated,required TResult Function( int petitionId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case PetitionDetailInitial():
return initial();case PetitionDetailLoading():
return loading();case PetitionCreated():
return created(_that.petition);case PetitionUpdated():
return updated(_that.petition);case PetitionDeleted():
return deleted(_that.petitionId);case PetitionDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Petition petition)?  created,TResult? Function( Petition petition)?  updated,TResult? Function( int petitionId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case PetitionDetailInitial() when initial != null:
return initial();case PetitionDetailLoading() when loading != null:
return loading();case PetitionCreated() when created != null:
return created(_that.petition);case PetitionUpdated() when updated != null:
return updated(_that.petition);case PetitionDeleted() when deleted != null:
return deleted(_that.petitionId);case PetitionDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PetitionDetailInitial implements PetitionDetailState {
  const PetitionDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetitionDetailState.initial()';
}


}




/// @nodoc


class PetitionDetailLoading implements PetitionDetailState {
  const PetitionDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetitionDetailState.loading()';
}


}




/// @nodoc


class PetitionCreated implements PetitionDetailState {
  const PetitionCreated({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionCreatedCopyWith<PetitionCreated> get copyWith => _$PetitionCreatedCopyWithImpl<PetitionCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionCreated&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailState.created(petition: $petition)';
}


}

/// @nodoc
abstract mixin class $PetitionCreatedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionCreatedCopyWith(PetitionCreated value, $Res Function(PetitionCreated) _then) = _$PetitionCreatedCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class _$PetitionCreatedCopyWithImpl<$Res>
    implements $PetitionCreatedCopyWith<$Res> {
  _$PetitionCreatedCopyWithImpl(this._self, this._then);

  final PetitionCreated _self;
  final $Res Function(PetitionCreated) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(PetitionCreated(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class PetitionUpdated implements PetitionDetailState {
  const PetitionUpdated({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionUpdatedCopyWith<PetitionUpdated> get copyWith => _$PetitionUpdatedCopyWithImpl<PetitionUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionUpdated&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailState.updated(petition: $petition)';
}


}

/// @nodoc
abstract mixin class $PetitionUpdatedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionUpdatedCopyWith(PetitionUpdated value, $Res Function(PetitionUpdated) _then) = _$PetitionUpdatedCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class _$PetitionUpdatedCopyWithImpl<$Res>
    implements $PetitionUpdatedCopyWith<$Res> {
  _$PetitionUpdatedCopyWithImpl(this._self, this._then);

  final PetitionUpdated _self;
  final $Res Function(PetitionUpdated) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(PetitionUpdated(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class PetitionDeleted implements PetitionDetailState {
  const PetitionDeleted({required this.petitionId});
  

 final  int petitionId;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionDeletedCopyWith<PetitionDeleted> get copyWith => _$PetitionDeletedCopyWithImpl<PetitionDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDeleted&&(identical(other.petitionId, petitionId) || other.petitionId == petitionId));
}


@override
int get hashCode => Object.hash(runtimeType,petitionId);

@override
String toString() {
  return 'PetitionDetailState.deleted(petitionId: $petitionId)';
}


}

/// @nodoc
abstract mixin class $PetitionDeletedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionDeletedCopyWith(PetitionDeleted value, $Res Function(PetitionDeleted) _then) = _$PetitionDeletedCopyWithImpl;
@useResult
$Res call({
 int petitionId
});




}
/// @nodoc
class _$PetitionDeletedCopyWithImpl<$Res>
    implements $PetitionDeletedCopyWith<$Res> {
  _$PetitionDeletedCopyWithImpl(this._self, this._then);

  final PetitionDeleted _self;
  final $Res Function(PetitionDeleted) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petitionId = null,}) {
  return _then(PetitionDeleted(
petitionId: null == petitionId ? _self.petitionId : petitionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PetitionDetailFailure implements PetitionDetailState {
  const PetitionDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionDetailFailureCopyWith<PetitionDetailFailure> get copyWith => _$PetitionDetailFailureCopyWithImpl<PetitionDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PetitionDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PetitionDetailFailureCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionDetailFailureCopyWith(PetitionDetailFailure value, $Res Function(PetitionDetailFailure) _then) = _$PetitionDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PetitionDetailFailureCopyWithImpl<$Res>
    implements $PetitionDetailFailureCopyWith<$Res> {
  _$PetitionDetailFailureCopyWithImpl(this._self, this._then);

  final PetitionDetailFailure _self;
  final $Res Function(PetitionDetailFailure) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PetitionDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PetitionDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetitionDetailEvent()';
}


}

/// @nodoc
class $PetitionDetailEventCopyWith<$Res>  {
$PetitionDetailEventCopyWith(PetitionDetailEvent _, $Res Function(PetitionDetailEvent) __);
}


/// Adds pattern-matching-related methods to [PetitionDetailEvent].
extension PetitionDetailEventPatterns on PetitionDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Created value)?  created,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,TResult Function( _Create value)?  create,TResult Function( _Support value)?  support,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Create() when create != null:
return create(_that);case _Support() when support != null:
return support(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Created value)  created,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,required TResult Function( _Create value)  create,required TResult Function( _Support value)  support,}){
final _that = this;
switch (_that) {
case _Created():
return created(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);case _Create():
return create(_that);case _Support():
return support(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Created value)?  created,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Create value)?  create,TResult? Function( _Support value)?  support,}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Create() when create != null:
return create(_that);case _Support() when support != null:
return support(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  deleted,TResult Function( String title,  String imagePath,  String description)?  create,TResult Function( Petition petition)?  support,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.title,_that.imagePath,_that.description);case _Support() when support != null:
return support(_that.petition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  deleted,required TResult Function( String title,  String imagePath,  String description)  create,required TResult Function( Petition petition)  support,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Updated():
return updated(_that.payload);case _Deleted():
return deleted(_that.payload);case _Create():
return create(_that.title,_that.imagePath,_that.description);case _Support():
return support(_that.petition);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  deleted,TResult? Function( String title,  String imagePath,  String description)?  create,TResult? Function( Petition petition)?  support,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.title,_that.imagePath,_that.description);case _Support() when support != null:
return support(_that.petition);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements PetitionDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PetitionDetailEvent.created(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Created(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements PetitionDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
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
  return 'PetitionDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
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

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Deleted implements PetitionDetailEvent {
  const _Deleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PetitionDetailEvent.deleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Create implements PetitionDetailEvent {
  const _Create({required this.title, required this.imagePath, required this.description});
  

 final  String title;
 final  String imagePath;
 final  String description;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.title, title) || other.title == title)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,imagePath,description);

@override
String toString() {
  return 'PetitionDetailEvent.create(title: $title, imagePath: $imagePath, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String title, String imagePath, String description
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? imagePath = null,Object? description = null,}) {
  return _then(_Create(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Support implements PetitionDetailEvent {
  const _Support({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportCopyWith<_Support> get copyWith => __$SupportCopyWithImpl<_Support>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Support&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailEvent.support(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$SupportCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$SupportCopyWith(_Support value, $Res Function(_Support) _then) = __$SupportCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$SupportCopyWithImpl<$Res>
    implements _$SupportCopyWith<$Res> {
  __$SupportCopyWithImpl(this._self, this._then);

  final _Support _self;
  final $Res Function(_Support) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_Support(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

// dart format on
