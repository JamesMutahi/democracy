// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ballot_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BallotDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BallotDetailState()';
}


}

/// @nodoc
class $BallotDetailStateCopyWith<$Res>  {
$BallotDetailStateCopyWith(BallotDetailState _, $Res Function(BallotDetailState) __);
}


/// Adds pattern-matching-related methods to [BallotDetailState].
extension BallotDetailStatePatterns on BallotDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BallotDetailInitial value)?  initial,TResult Function( BallotDetailLoading value)?  loading,TResult Function( BallotCreated value)?  created,TResult Function( BallotUpdated value)?  updated,TResult Function( BallotDeleted value)?  deleted,TResult Function( BallotDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BallotDetailInitial() when initial != null:
return initial(_that);case BallotDetailLoading() when loading != null:
return loading(_that);case BallotCreated() when created != null:
return created(_that);case BallotUpdated() when updated != null:
return updated(_that);case BallotDeleted() when deleted != null:
return deleted(_that);case BallotDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BallotDetailInitial value)  initial,required TResult Function( BallotDetailLoading value)  loading,required TResult Function( BallotCreated value)  created,required TResult Function( BallotUpdated value)  updated,required TResult Function( BallotDeleted value)  deleted,required TResult Function( BallotDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case BallotDetailInitial():
return initial(_that);case BallotDetailLoading():
return loading(_that);case BallotCreated():
return created(_that);case BallotUpdated():
return updated(_that);case BallotDeleted():
return deleted(_that);case BallotDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BallotDetailInitial value)?  initial,TResult? Function( BallotDetailLoading value)?  loading,TResult? Function( BallotCreated value)?  created,TResult? Function( BallotUpdated value)?  updated,TResult? Function( BallotDeleted value)?  deleted,TResult? Function( BallotDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case BallotDetailInitial() when initial != null:
return initial(_that);case BallotDetailLoading() when loading != null:
return loading(_that);case BallotCreated() when created != null:
return created(_that);case BallotUpdated() when updated != null:
return updated(_that);case BallotDeleted() when deleted != null:
return deleted(_that);case BallotDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Ballot ballot)?  created,TResult Function( Ballot ballot)?  updated,TResult Function( int ballotId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BallotDetailInitial() when initial != null:
return initial();case BallotDetailLoading() when loading != null:
return loading();case BallotCreated() when created != null:
return created(_that.ballot);case BallotUpdated() when updated != null:
return updated(_that.ballot);case BallotDeleted() when deleted != null:
return deleted(_that.ballotId);case BallotDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Ballot ballot)  created,required TResult Function( Ballot ballot)  updated,required TResult Function( int ballotId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case BallotDetailInitial():
return initial();case BallotDetailLoading():
return loading();case BallotCreated():
return created(_that.ballot);case BallotUpdated():
return updated(_that.ballot);case BallotDeleted():
return deleted(_that.ballotId);case BallotDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Ballot ballot)?  created,TResult? Function( Ballot ballot)?  updated,TResult? Function( int ballotId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case BallotDetailInitial() when initial != null:
return initial();case BallotDetailLoading() when loading != null:
return loading();case BallotCreated() when created != null:
return created(_that.ballot);case BallotUpdated() when updated != null:
return updated(_that.ballot);case BallotDeleted() when deleted != null:
return deleted(_that.ballotId);case BallotDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class BallotDetailInitial implements BallotDetailState {
  const BallotDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BallotDetailState.initial()';
}


}




/// @nodoc


class BallotDetailLoading implements BallotDetailState {
  const BallotDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BallotDetailState.loading()';
}


}




/// @nodoc


class BallotCreated implements BallotDetailState {
  const BallotCreated({required this.ballot});
  

 final  Ballot ballot;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallotCreatedCopyWith<BallotCreated> get copyWith => _$BallotCreatedCopyWithImpl<BallotCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotCreated&&(identical(other.ballot, ballot) || other.ballot == ballot));
}


@override
int get hashCode => Object.hash(runtimeType,ballot);

@override
String toString() {
  return 'BallotDetailState.created(ballot: $ballot)';
}


}

/// @nodoc
abstract mixin class $BallotCreatedCopyWith<$Res> implements $BallotDetailStateCopyWith<$Res> {
  factory $BallotCreatedCopyWith(BallotCreated value, $Res Function(BallotCreated) _then) = _$BallotCreatedCopyWithImpl;
@useResult
$Res call({
 Ballot ballot
});


$BallotCopyWith<$Res> get ballot;

}
/// @nodoc
class _$BallotCreatedCopyWithImpl<$Res>
    implements $BallotCreatedCopyWith<$Res> {
  _$BallotCreatedCopyWithImpl(this._self, this._then);

  final BallotCreated _self;
  final $Res Function(BallotCreated) _then;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ballot = null,}) {
  return _then(BallotCreated(
ballot: null == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot,
  ));
}

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res> get ballot {
  
  return $BallotCopyWith<$Res>(_self.ballot, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}
}

/// @nodoc


class BallotUpdated implements BallotDetailState {
  const BallotUpdated({required this.ballot});
  

 final  Ballot ballot;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallotUpdatedCopyWith<BallotUpdated> get copyWith => _$BallotUpdatedCopyWithImpl<BallotUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotUpdated&&(identical(other.ballot, ballot) || other.ballot == ballot));
}


@override
int get hashCode => Object.hash(runtimeType,ballot);

@override
String toString() {
  return 'BallotDetailState.updated(ballot: $ballot)';
}


}

/// @nodoc
abstract mixin class $BallotUpdatedCopyWith<$Res> implements $BallotDetailStateCopyWith<$Res> {
  factory $BallotUpdatedCopyWith(BallotUpdated value, $Res Function(BallotUpdated) _then) = _$BallotUpdatedCopyWithImpl;
@useResult
$Res call({
 Ballot ballot
});


$BallotCopyWith<$Res> get ballot;

}
/// @nodoc
class _$BallotUpdatedCopyWithImpl<$Res>
    implements $BallotUpdatedCopyWith<$Res> {
  _$BallotUpdatedCopyWithImpl(this._self, this._then);

  final BallotUpdated _self;
  final $Res Function(BallotUpdated) _then;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ballot = null,}) {
  return _then(BallotUpdated(
ballot: null == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot,
  ));
}

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res> get ballot {
  
  return $BallotCopyWith<$Res>(_self.ballot, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}
}

/// @nodoc


class BallotDeleted implements BallotDetailState {
  const BallotDeleted({required this.ballotId});
  

 final  int ballotId;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallotDeletedCopyWith<BallotDeleted> get copyWith => _$BallotDeletedCopyWithImpl<BallotDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotDeleted&&(identical(other.ballotId, ballotId) || other.ballotId == ballotId));
}


@override
int get hashCode => Object.hash(runtimeType,ballotId);

@override
String toString() {
  return 'BallotDetailState.deleted(ballotId: $ballotId)';
}


}

/// @nodoc
abstract mixin class $BallotDeletedCopyWith<$Res> implements $BallotDetailStateCopyWith<$Res> {
  factory $BallotDeletedCopyWith(BallotDeleted value, $Res Function(BallotDeleted) _then) = _$BallotDeletedCopyWithImpl;
@useResult
$Res call({
 int ballotId
});




}
/// @nodoc
class _$BallotDeletedCopyWithImpl<$Res>
    implements $BallotDeletedCopyWith<$Res> {
  _$BallotDeletedCopyWithImpl(this._self, this._then);

  final BallotDeleted _self;
  final $Res Function(BallotDeleted) _then;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ballotId = null,}) {
  return _then(BallotDeleted(
ballotId: null == ballotId ? _self.ballotId : ballotId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class BallotDetailFailure implements BallotDetailState {
  const BallotDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallotDetailFailureCopyWith<BallotDetailFailure> get copyWith => _$BallotDetailFailureCopyWithImpl<BallotDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BallotDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $BallotDetailFailureCopyWith<$Res> implements $BallotDetailStateCopyWith<$Res> {
  factory $BallotDetailFailureCopyWith(BallotDetailFailure value, $Res Function(BallotDetailFailure) _then) = _$BallotDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$BallotDetailFailureCopyWithImpl<$Res>
    implements $BallotDetailFailureCopyWith<$Res> {
  _$BallotDetailFailureCopyWithImpl(this._self, this._then);

  final BallotDetailFailure _self;
  final $Res Function(BallotDetailFailure) _then;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(BallotDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
