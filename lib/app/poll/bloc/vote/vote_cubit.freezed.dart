// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoteState()';
}


}

/// @nodoc
class $VoteStateCopyWith<$Res>  {
$VoteStateCopyWith(VoteState _, $Res Function(VoteState) __);
}


/// @nodoc


class _Initial implements VoteState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoteState.initial()';
}


}




/// @nodoc


class _Loading implements VoteState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoteState.loading()';
}


}




/// @nodoc


class PollVoted implements VoteState {
  const PollVoted({required this.poll});
  

 final  Poll poll;

/// Create a copy of VoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollVotedCopyWith<PollVoted> get copyWith => _$PollVotedCopyWithImpl<PollVoted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollVoted&&(identical(other.poll, poll) || other.poll == poll));
}


@override
int get hashCode => Object.hash(runtimeType,poll);

@override
String toString() {
  return 'VoteState.voted(poll: $poll)';
}


}

/// @nodoc
abstract mixin class $PollVotedCopyWith<$Res> implements $VoteStateCopyWith<$Res> {
  factory $PollVotedCopyWith(PollVoted value, $Res Function(PollVoted) _then) = _$PollVotedCopyWithImpl;
@useResult
$Res call({
 Poll poll
});


$PollCopyWith<$Res> get poll;

}
/// @nodoc
class _$PollVotedCopyWithImpl<$Res>
    implements $PollVotedCopyWith<$Res> {
  _$PollVotedCopyWithImpl(this._self, this._then);

  final PollVoted _self;
  final $Res Function(PollVoted) _then;

/// Create a copy of VoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? poll = null,}) {
  return _then(PollVoted(
poll: null == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll,
  ));
}

/// Create a copy of VoteState
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


class _Failure implements VoteState {
  const _Failure({required this.error});
  

 final  String error;

/// Create a copy of VoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'VoteState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $VoteStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of VoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Failure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
