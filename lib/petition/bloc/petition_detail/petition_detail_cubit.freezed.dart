// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petition_detail_cubit.dart';

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

// dart format on
