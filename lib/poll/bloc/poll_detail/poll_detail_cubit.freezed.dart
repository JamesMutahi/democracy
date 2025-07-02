// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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


class PollDetailFailure implements PollDetailState {
  const PollDetailFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollDetailFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollDetailState.failure()';
}


}




// dart format on
