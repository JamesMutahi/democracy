// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PollDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollDetailState()';
}


}

/// @nodoc
class $PollDetailStateCopyWith<$Res>  {
$PollDetailStateCopyWith(PollDetailState _, $Res Function(PollDetailState) __);
}


/// Adds pattern-matching-related methods to [PollDetailState].
extension PollDetailStatePatterns on PollDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PollDetailInitial value)?  initial,TResult Function( PollDetailLoading value)?  loading,TResult Function( PollCreated value)?  created,TResult Function( PollUpdated value)?  updated,TResult Function( PollDeleted value)?  deleted,TResult Function( PollDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PollDetailInitial() when initial != null:
return initial(_that);case PollDetailLoading() when loading != null:
return loading(_that);case PollCreated() when created != null:
return created(_that);case PollUpdated() when updated != null:
return updated(_that);case PollDeleted() when deleted != null:
return deleted(_that);case PollDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PollDetailInitial value)  initial,required TResult Function( PollDetailLoading value)  loading,required TResult Function( PollCreated value)  created,required TResult Function( PollUpdated value)  updated,required TResult Function( PollDeleted value)  deleted,required TResult Function( PollDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case PollDetailInitial():
return initial(_that);case PollDetailLoading():
return loading(_that);case PollCreated():
return created(_that);case PollUpdated():
return updated(_that);case PollDeleted():
return deleted(_that);case PollDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PollDetailInitial value)?  initial,TResult? Function( PollDetailLoading value)?  loading,TResult? Function( PollCreated value)?  created,TResult? Function( PollUpdated value)?  updated,TResult? Function( PollDeleted value)?  deleted,TResult? Function( PollDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case PollDetailInitial() when initial != null:
return initial(_that);case PollDetailLoading() when loading != null:
return loading(_that);case PollCreated() when created != null:
return created(_that);case PollUpdated() when updated != null:
return updated(_that);case PollDeleted() when deleted != null:
return deleted(_that);case PollDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Poll poll)?  created,TResult Function( Poll poll)?  updated,TResult Function( Poll poll)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PollDetailInitial() when initial != null:
return initial();case PollDetailLoading() when loading != null:
return loading();case PollCreated() when created != null:
return created(_that.poll);case PollUpdated() when updated != null:
return updated(_that.poll);case PollDeleted() when deleted != null:
return deleted(_that.poll);case PollDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Poll poll)  created,required TResult Function( Poll poll)  updated,required TResult Function( Poll poll)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case PollDetailInitial():
return initial();case PollDetailLoading():
return loading();case PollCreated():
return created(_that.poll);case PollUpdated():
return updated(_that.poll);case PollDeleted():
return deleted(_that.poll);case PollDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Poll poll)?  created,TResult? Function( Poll poll)?  updated,TResult? Function( Poll poll)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case PollDetailInitial() when initial != null:
return initial();case PollDetailLoading() when loading != null:
return loading();case PollCreated() when created != null:
return created(_that.poll);case PollUpdated() when updated != null:
return updated(_that.poll);case PollDeleted() when deleted != null:
return deleted(_that.poll);case PollDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PollDetailInitial implements PollDetailState {
  const PollDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollDetailState.initial()';
}


}




/// @nodoc


class PollDetailLoading implements PollDetailState {
  const PollDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollDetailState.loading()';
}


}




/// @nodoc


class PollCreated implements PollDetailState {
  const PollCreated({required this.poll});
  

 final  Poll poll;

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollCreatedCopyWith<PollCreated> get copyWith => _$PollCreatedCopyWithImpl<PollCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollCreated&&(identical(other.poll, poll) || other.poll == poll));
}


@override
int get hashCode => Object.hash(runtimeType,poll);

@override
String toString() {
  return 'PollDetailState.created(poll: $poll)';
}


}

/// @nodoc
abstract mixin class $PollCreatedCopyWith<$Res> implements $PollDetailStateCopyWith<$Res> {
  factory $PollCreatedCopyWith(PollCreated value, $Res Function(PollCreated) _then) = _$PollCreatedCopyWithImpl;
@useResult
$Res call({
 Poll poll
});


$PollCopyWith<$Res> get poll;

}
/// @nodoc
class _$PollCreatedCopyWithImpl<$Res>
    implements $PollCreatedCopyWith<$Res> {
  _$PollCreatedCopyWithImpl(this._self, this._then);

  final PollCreated _self;
  final $Res Function(PollCreated) _then;

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? poll = null,}) {
  return _then(PollCreated(
poll: null == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll,
  ));
}

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res> get poll {
  
  return $PollCopyWith<$Res>(_self.poll, (value) {
    return _then(_self.copyWith(poll: value));
  });
}
}

/// @nodoc


class PollUpdated implements PollDetailState {
  const PollUpdated({required this.poll});
  

 final  Poll poll;

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollUpdatedCopyWith<PollUpdated> get copyWith => _$PollUpdatedCopyWithImpl<PollUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollUpdated&&(identical(other.poll, poll) || other.poll == poll));
}


@override
int get hashCode => Object.hash(runtimeType,poll);

@override
String toString() {
  return 'PollDetailState.updated(poll: $poll)';
}


}

/// @nodoc
abstract mixin class $PollUpdatedCopyWith<$Res> implements $PollDetailStateCopyWith<$Res> {
  factory $PollUpdatedCopyWith(PollUpdated value, $Res Function(PollUpdated) _then) = _$PollUpdatedCopyWithImpl;
@useResult
$Res call({
 Poll poll
});


$PollCopyWith<$Res> get poll;

}
/// @nodoc
class _$PollUpdatedCopyWithImpl<$Res>
    implements $PollUpdatedCopyWith<$Res> {
  _$PollUpdatedCopyWithImpl(this._self, this._then);

  final PollUpdated _self;
  final $Res Function(PollUpdated) _then;

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? poll = null,}) {
  return _then(PollUpdated(
poll: null == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll,
  ));
}

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res> get poll {
  
  return $PollCopyWith<$Res>(_self.poll, (value) {
    return _then(_self.copyWith(poll: value));
  });
}
}

/// @nodoc


class PollDeleted implements PollDetailState {
  const PollDeleted({required this.poll});
  

 final  Poll poll;

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollDeletedCopyWith<PollDeleted> get copyWith => _$PollDeletedCopyWithImpl<PollDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollDeleted&&(identical(other.poll, poll) || other.poll == poll));
}


@override
int get hashCode => Object.hash(runtimeType,poll);

@override
String toString() {
  return 'PollDetailState.deleted(poll: $poll)';
}


}

/// @nodoc
abstract mixin class $PollDeletedCopyWith<$Res> implements $PollDetailStateCopyWith<$Res> {
  factory $PollDeletedCopyWith(PollDeleted value, $Res Function(PollDeleted) _then) = _$PollDeletedCopyWithImpl;
@useResult
$Res call({
 Poll poll
});


$PollCopyWith<$Res> get poll;

}
/// @nodoc
class _$PollDeletedCopyWithImpl<$Res>
    implements $PollDeletedCopyWith<$Res> {
  _$PollDeletedCopyWithImpl(this._self, this._then);

  final PollDeleted _self;
  final $Res Function(PollDeleted) _then;

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? poll = null,}) {
  return _then(PollDeleted(
poll: null == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll,
  ));
}

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res> get poll {
  
  return $PollCopyWith<$Res>(_self.poll, (value) {
    return _then(_self.copyWith(poll: value));
  });
}
}

/// @nodoc


class PollDetailFailure implements PollDetailState {
  const PollDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollDetailFailureCopyWith<PollDetailFailure> get copyWith => _$PollDetailFailureCopyWithImpl<PollDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PollDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PollDetailFailureCopyWith<$Res> implements $PollDetailStateCopyWith<$Res> {
  factory $PollDetailFailureCopyWith(PollDetailFailure value, $Res Function(PollDetailFailure) _then) = _$PollDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PollDetailFailureCopyWithImpl<$Res>
    implements $PollDetailFailureCopyWith<$Res> {
  _$PollDetailFailureCopyWithImpl(this._self, this._then);

  final PollDetailFailure _self;
  final $Res Function(PollDetailFailure) _then;

/// Create a copy of PollDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PollDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
