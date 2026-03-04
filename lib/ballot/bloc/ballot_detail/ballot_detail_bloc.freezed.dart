// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ballot_detail_bloc.dart';

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BallotDetailInitial value)?  initial,TResult Function( BallotDetailLoading value)?  loading,TResult Function( BallotCreated value)?  created,TResult Function( BallotLoaded value)?  loaded,TResult Function( BallotUpdated value)?  updated,TResult Function( BallotDeleted value)?  deleted,TResult Function( BallotDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BallotDetailInitial() when initial != null:
return initial(_that);case BallotDetailLoading() when loading != null:
return loading(_that);case BallotCreated() when created != null:
return created(_that);case BallotLoaded() when loaded != null:
return loaded(_that);case BallotUpdated() when updated != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BallotDetailInitial value)  initial,required TResult Function( BallotDetailLoading value)  loading,required TResult Function( BallotCreated value)  created,required TResult Function( BallotLoaded value)  loaded,required TResult Function( BallotUpdated value)  updated,required TResult Function( BallotDeleted value)  deleted,required TResult Function( BallotDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case BallotDetailInitial():
return initial(_that);case BallotDetailLoading():
return loading(_that);case BallotCreated():
return created(_that);case BallotLoaded():
return loaded(_that);case BallotUpdated():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BallotDetailInitial value)?  initial,TResult? Function( BallotDetailLoading value)?  loading,TResult? Function( BallotCreated value)?  created,TResult? Function( BallotLoaded value)?  loaded,TResult? Function( BallotUpdated value)?  updated,TResult? Function( BallotDeleted value)?  deleted,TResult? Function( BallotDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case BallotDetailInitial() when initial != null:
return initial(_that);case BallotDetailLoading() when loading != null:
return loading(_that);case BallotCreated() when created != null:
return created(_that);case BallotLoaded() when loaded != null:
return loaded(_that);case BallotUpdated() when updated != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Ballot ballot)?  created,TResult Function( Ballot ballot)?  loaded,TResult Function( Ballot ballot)?  updated,TResult Function( int ballotId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BallotDetailInitial() when initial != null:
return initial();case BallotDetailLoading() when loading != null:
return loading();case BallotCreated() when created != null:
return created(_that.ballot);case BallotLoaded() when loaded != null:
return loaded(_that.ballot);case BallotUpdated() when updated != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Ballot ballot)  created,required TResult Function( Ballot ballot)  loaded,required TResult Function( Ballot ballot)  updated,required TResult Function( int ballotId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case BallotDetailInitial():
return initial();case BallotDetailLoading():
return loading();case BallotCreated():
return created(_that.ballot);case BallotLoaded():
return loaded(_that.ballot);case BallotUpdated():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Ballot ballot)?  created,TResult? Function( Ballot ballot)?  loaded,TResult? Function( Ballot ballot)?  updated,TResult? Function( int ballotId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case BallotDetailInitial() when initial != null:
return initial();case BallotDetailLoading() when loading != null:
return loading();case BallotCreated() when created != null:
return created(_that.ballot);case BallotLoaded() when loaded != null:
return loaded(_that.ballot);case BallotUpdated() when updated != null:
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


class BallotLoaded implements BallotDetailState {
  const BallotLoaded({required this.ballot});
  

 final  Ballot ballot;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallotLoadedCopyWith<BallotLoaded> get copyWith => _$BallotLoadedCopyWithImpl<BallotLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotLoaded&&(identical(other.ballot, ballot) || other.ballot == ballot));
}


@override
int get hashCode => Object.hash(runtimeType,ballot);

@override
String toString() {
  return 'BallotDetailState.loaded(ballot: $ballot)';
}


}

/// @nodoc
abstract mixin class $BallotLoadedCopyWith<$Res> implements $BallotDetailStateCopyWith<$Res> {
  factory $BallotLoadedCopyWith(BallotLoaded value, $Res Function(BallotLoaded) _then) = _$BallotLoadedCopyWithImpl;
@useResult
$Res call({
 Ballot ballot
});


$BallotCopyWith<$Res> get ballot;

}
/// @nodoc
class _$BallotLoadedCopyWithImpl<$Res>
    implements $BallotLoadedCopyWith<$Res> {
  _$BallotLoadedCopyWithImpl(this._self, this._then);

  final BallotLoaded _self;
  final $Res Function(BallotLoaded) _then;

/// Create a copy of BallotDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ballot = null,}) {
  return _then(BallotLoaded(
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

/// @nodoc
mixin _$BallotDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BallotDetailEvent()';
}


}

/// @nodoc
class $BallotDetailEventCopyWith<$Res>  {
$BallotDetailEventCopyWith(BallotDetailEvent _, $Res Function(BallotDetailEvent) __);
}


/// Adds pattern-matching-related methods to [BallotDetailEvent].
extension BallotDetailEventPatterns on BallotDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Created value)?  created,TResult Function( _Loaded value)?  loaded,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,TResult Function( _Retrieve value)?  retrieve,TResult Function( _Vote value)?  vote,TResult Function( _Voted value)?  voted,TResult Function( _SubmitReason value)?  submitReason,TResult Function( _Unsubscribe value)?  unsubscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Retrieve() when retrieve != null:
return retrieve(_that);case _Vote() when vote != null:
return vote(_that);case _Voted() when voted != null:
return voted(_that);case _SubmitReason() when submitReason != null:
return submitReason(_that);case _Unsubscribe() when unsubscribe != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Created value)  created,required TResult Function( _Loaded value)  loaded,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,required TResult Function( _Retrieve value)  retrieve,required TResult Function( _Vote value)  vote,required TResult Function( _Voted value)  voted,required TResult Function( _SubmitReason value)  submitReason,required TResult Function( _Unsubscribe value)  unsubscribe,}){
final _that = this;
switch (_that) {
case _Created():
return created(_that);case _Loaded():
return loaded(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);case _Retrieve():
return retrieve(_that);case _Vote():
return vote(_that);case _Voted():
return voted(_that);case _SubmitReason():
return submitReason(_that);case _Unsubscribe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Created value)?  created,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Retrieve value)?  retrieve,TResult? Function( _Vote value)?  vote,TResult? Function( _Voted value)?  voted,TResult? Function( _SubmitReason value)?  submitReason,TResult? Function( _Unsubscribe value)?  unsubscribe,}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Retrieve() when retrieve != null:
return retrieve(_that);case _Vote() when vote != null:
return vote(_that);case _Voted() when voted != null:
return voted(_that);case _SubmitReason() when submitReason != null:
return submitReason(_that);case _Unsubscribe() when unsubscribe != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  loaded,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  deleted,TResult Function( Ballot ballot)?  retrieve,TResult Function( Option option)?  vote,TResult Function( Map<String, dynamic> payload)?  voted,TResult Function( Ballot ballot,  String text)?  submitReason,TResult Function( Ballot ballot)?  unsubscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Retrieve() when retrieve != null:
return retrieve(_that.ballot);case _Vote() when vote != null:
return vote(_that.option);case _Voted() when voted != null:
return voted(_that.payload);case _SubmitReason() when submitReason != null:
return submitReason(_that.ballot,_that.text);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.ballot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  loaded,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  deleted,required TResult Function( Ballot ballot)  retrieve,required TResult Function( Option option)  vote,required TResult Function( Map<String, dynamic> payload)  voted,required TResult Function( Ballot ballot,  String text)  submitReason,required TResult Function( Ballot ballot)  unsubscribe,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Loaded():
return loaded(_that.payload);case _Updated():
return updated(_that.payload);case _Deleted():
return deleted(_that.payload);case _Retrieve():
return retrieve(_that.ballot);case _Vote():
return vote(_that.option);case _Voted():
return voted(_that.payload);case _SubmitReason():
return submitReason(_that.ballot,_that.text);case _Unsubscribe():
return unsubscribe(_that.ballot);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  loaded,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  deleted,TResult? Function( Ballot ballot)?  retrieve,TResult? Function( Option option)?  vote,TResult? Function( Map<String, dynamic> payload)?  voted,TResult? Function( Ballot ballot,  String text)?  submitReason,TResult? Function( Ballot ballot)?  unsubscribe,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Retrieve() when retrieve != null:
return retrieve(_that.ballot);case _Vote() when vote != null:
return vote(_that.option);case _Voted() when voted != null:
return voted(_that.payload);case _SubmitReason() when submitReason != null:
return submitReason(_that.ballot,_that.text);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.ballot);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements BallotDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BallotDetailEvent
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
  return 'BallotDetailEvent.created(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $BallotDetailEventCopyWith<$Res> {
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

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Created(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Loaded implements BallotDetailEvent {
  const _Loaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'BallotDetailEvent.loaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $BallotDetailEventCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Loaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements BallotDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BallotDetailEvent
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
  return 'BallotDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $BallotDetailEventCopyWith<$Res> {
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

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Deleted implements BallotDetailEvent {
  const _Deleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BallotDetailEvent
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
  return 'BallotDetailEvent.deleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $BallotDetailEventCopyWith<$Res> {
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

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Retrieve implements BallotDetailEvent {
  const _Retrieve({required this.ballot});
  

 final  Ballot ballot;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetrieveCopyWith<_Retrieve> get copyWith => __$RetrieveCopyWithImpl<_Retrieve>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Retrieve&&(identical(other.ballot, ballot) || other.ballot == ballot));
}


@override
int get hashCode => Object.hash(runtimeType,ballot);

@override
String toString() {
  return 'BallotDetailEvent.retrieve(ballot: $ballot)';
}


}

/// @nodoc
abstract mixin class _$RetrieveCopyWith<$Res> implements $BallotDetailEventCopyWith<$Res> {
  factory _$RetrieveCopyWith(_Retrieve value, $Res Function(_Retrieve) _then) = __$RetrieveCopyWithImpl;
@useResult
$Res call({
 Ballot ballot
});


$BallotCopyWith<$Res> get ballot;

}
/// @nodoc
class __$RetrieveCopyWithImpl<$Res>
    implements _$RetrieveCopyWith<$Res> {
  __$RetrieveCopyWithImpl(this._self, this._then);

  final _Retrieve _self;
  final $Res Function(_Retrieve) _then;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ballot = null,}) {
  return _then(_Retrieve(
ballot: null == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot,
  ));
}

/// Create a copy of BallotDetailEvent
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


class _Vote implements BallotDetailEvent {
  const _Vote({required this.option});
  

 final  Option option;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoteCopyWith<_Vote> get copyWith => __$VoteCopyWithImpl<_Vote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vote&&(identical(other.option, option) || other.option == option));
}


@override
int get hashCode => Object.hash(runtimeType,option);

@override
String toString() {
  return 'BallotDetailEvent.vote(option: $option)';
}


}

/// @nodoc
abstract mixin class _$VoteCopyWith<$Res> implements $BallotDetailEventCopyWith<$Res> {
  factory _$VoteCopyWith(_Vote value, $Res Function(_Vote) _then) = __$VoteCopyWithImpl;
@useResult
$Res call({
 Option option
});


$OptionCopyWith<$Res> get option;

}
/// @nodoc
class __$VoteCopyWithImpl<$Res>
    implements _$VoteCopyWith<$Res> {
  __$VoteCopyWithImpl(this._self, this._then);

  final _Vote _self;
  final $Res Function(_Vote) _then;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? option = null,}) {
  return _then(_Vote(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as Option,
  ));
}

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptionCopyWith<$Res> get option {
  
  return $OptionCopyWith<$Res>(_self.option, (value) {
    return _then(_self.copyWith(option: value));
  });
}
}

/// @nodoc


class _Voted implements BallotDetailEvent {
  const _Voted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VotedCopyWith<_Voted> get copyWith => __$VotedCopyWithImpl<_Voted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Voted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'BallotDetailEvent.voted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$VotedCopyWith<$Res> implements $BallotDetailEventCopyWith<$Res> {
  factory _$VotedCopyWith(_Voted value, $Res Function(_Voted) _then) = __$VotedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$VotedCopyWithImpl<$Res>
    implements _$VotedCopyWith<$Res> {
  __$VotedCopyWithImpl(this._self, this._then);

  final _Voted _self;
  final $Res Function(_Voted) _then;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Voted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _SubmitReason implements BallotDetailEvent {
  const _SubmitReason({required this.ballot, required this.text});
  

 final  Ballot ballot;
 final  String text;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitReasonCopyWith<_SubmitReason> get copyWith => __$SubmitReasonCopyWithImpl<_SubmitReason>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitReason&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,ballot,text);

@override
String toString() {
  return 'BallotDetailEvent.submitReason(ballot: $ballot, text: $text)';
}


}

/// @nodoc
abstract mixin class _$SubmitReasonCopyWith<$Res> implements $BallotDetailEventCopyWith<$Res> {
  factory _$SubmitReasonCopyWith(_SubmitReason value, $Res Function(_SubmitReason) _then) = __$SubmitReasonCopyWithImpl;
@useResult
$Res call({
 Ballot ballot, String text
});


$BallotCopyWith<$Res> get ballot;

}
/// @nodoc
class __$SubmitReasonCopyWithImpl<$Res>
    implements _$SubmitReasonCopyWith<$Res> {
  __$SubmitReasonCopyWithImpl(this._self, this._then);

  final _SubmitReason _self;
  final $Res Function(_SubmitReason) _then;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ballot = null,Object? text = null,}) {
  return _then(_SubmitReason(
ballot: null == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of BallotDetailEvent
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


class _Unsubscribe implements BallotDetailEvent {
  const _Unsubscribe({required this.ballot});
  

 final  Ballot ballot;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeCopyWith<_Unsubscribe> get copyWith => __$UnsubscribeCopyWithImpl<_Unsubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsubscribe&&(identical(other.ballot, ballot) || other.ballot == ballot));
}


@override
int get hashCode => Object.hash(runtimeType,ballot);

@override
String toString() {
  return 'BallotDetailEvent.unsubscribe(ballot: $ballot)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeCopyWith<$Res> implements $BallotDetailEventCopyWith<$Res> {
  factory _$UnsubscribeCopyWith(_Unsubscribe value, $Res Function(_Unsubscribe) _then) = __$UnsubscribeCopyWithImpl;
@useResult
$Res call({
 Ballot ballot
});


$BallotCopyWith<$Res> get ballot;

}
/// @nodoc
class __$UnsubscribeCopyWithImpl<$Res>
    implements _$UnsubscribeCopyWith<$Res> {
  __$UnsubscribeCopyWithImpl(this._self, this._then);

  final _Unsubscribe _self;
  final $Res Function(_Unsubscribe) _then;

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ballot = null,}) {
  return _then(_Unsubscribe(
ballot: null == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot,
  ));
}

/// Create a copy of BallotDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res> get ballot {
  
  return $BallotCopyWith<$Res>(_self.ballot, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}
}

// dart format on
