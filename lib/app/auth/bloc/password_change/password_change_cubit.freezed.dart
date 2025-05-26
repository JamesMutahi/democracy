// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_change_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PasswordChangeState {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordChangeState);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PasswordChangeState()';
  }


}

/// @nodoc
class $PasswordChangeStateCopyWith<$Res> {
  $PasswordChangeStateCopyWith(PasswordChangeState _,
      $Res Function(PasswordChangeState) __);
}


/// @nodoc


class PasswordChangeInitial implements PasswordChangeState {
  const PasswordChangeInitial();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordChangeInitial);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PasswordChangeState.initial()';
  }


}


/// @nodoc


class PasswordChangeLoading implements PasswordChangeState {
  const PasswordChangeLoading();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordChangeLoading);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PasswordChangeState.loading()';
  }


}


/// @nodoc


class PasswordChangeComplete implements PasswordChangeState {
  const PasswordChangeComplete();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordChangeComplete);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PasswordChangeState.changed()';
  }


}


/// @nodoc


class PasswordChangeFailure implements PasswordChangeState {
  const PasswordChangeFailure({required this.error});


  final String error;

  /// Create a copy of PasswordChangeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PasswordChangeFailureCopyWith<PasswordChangeFailure> get copyWith =>
      _$PasswordChangeFailureCopyWithImpl<PasswordChangeFailure>(
          this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordChangeFailure &&
            (identical(other.error, error) || other.error == error));
  }


  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'PasswordChangeState.failure(error: $error)';
  }


}

/// @nodoc
abstract mixin class $PasswordChangeFailureCopyWith<$Res>
    implements $PasswordChangeStateCopyWith<$Res> {
  factory $PasswordChangeFailureCopyWith(PasswordChangeFailure value,
      $Res Function(PasswordChangeFailure) _then) = _$PasswordChangeFailureCopyWithImpl;

  @useResult
  $Res call({
    String error
  });


}

/// @nodoc
class _$PasswordChangeFailureCopyWithImpl<$Res>
    implements $PasswordChangeFailureCopyWith<$Res> {
  _$PasswordChangeFailureCopyWithImpl(this._self, this._then);

  final PasswordChangeFailure _self;
  final $Res Function(PasswordChangeFailure) _then;

  /// Create a copy of PasswordChangeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
    return _then(PasswordChangeFailure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

// dart format on
