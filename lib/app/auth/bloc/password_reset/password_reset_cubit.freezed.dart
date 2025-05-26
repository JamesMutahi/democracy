// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PasswordResetState {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordResetState);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PasswordResetState()';
  }


}

/// @nodoc
class $PasswordResetStateCopyWith<$Res> {
  $PasswordResetStateCopyWith(PasswordResetState _,
      $Res Function(PasswordResetState) __);
}


/// @nodoc


class PasswordResetInitial implements PasswordResetState {
  const PasswordResetInitial();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordResetInitial);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PasswordResetState.initial()';
  }


}


/// @nodoc


class PasswordResetLoading implements PasswordResetState {
  const PasswordResetLoading();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordResetLoading);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PasswordResetState.loading()';
  }


}


/// @nodoc


class PasswordResetEmailVerified implements PasswordResetState {
  const PasswordResetEmailVerified({required this.email});


  final String email;

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PasswordResetEmailVerifiedCopyWith<
      PasswordResetEmailVerified> get copyWith =>
      _$PasswordResetEmailVerifiedCopyWithImpl<PasswordResetEmailVerified>(
          this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType &&
        other is PasswordResetEmailVerified &&
        (identical(other.email, email) || other.email == email));
  }


  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'PasswordResetState.emailVerified(email: $email)';
  }


}

/// @nodoc
abstract mixin class $PasswordResetEmailVerifiedCopyWith<$Res>
    implements $PasswordResetStateCopyWith<$Res> {
  factory $PasswordResetEmailVerifiedCopyWith(PasswordResetEmailVerified value,
      $Res Function(PasswordResetEmailVerified) _then) = _$PasswordResetEmailVerifiedCopyWithImpl;

  @useResult
  $Res call({
    String email
  });


}

/// @nodoc
class _$PasswordResetEmailVerifiedCopyWithImpl<$Res>
    implements $PasswordResetEmailVerifiedCopyWith<$Res> {
  _$PasswordResetEmailVerifiedCopyWithImpl(this._self, this._then);

  final PasswordResetEmailVerified _self;
  final $Res Function(PasswordResetEmailVerified) _then;

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
    return _then(PasswordResetEmailVerified(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

/// @nodoc


class PasswordResetCodeVerified implements PasswordResetState {
  const PasswordResetCodeVerified();


  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType &&
        other is PasswordResetCodeVerified);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PasswordResetState.codeVerified()';
  }


}


/// @nodoc


class PasswordResetComplete implements PasswordResetState {
  const PasswordResetComplete();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordResetComplete);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PasswordResetState.resetComplete()';
  }


}


/// @nodoc


class PasswordResetFailure implements PasswordResetState {
  const PasswordResetFailure({required this.error});


  final String error;

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PasswordResetFailureCopyWith<PasswordResetFailure> get copyWith =>
      _$PasswordResetFailureCopyWithImpl<PasswordResetFailure>(
          this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordResetFailure &&
            (identical(other.error, error) || other.error == error));
  }


  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'PasswordResetState.failure(error: $error)';
  }


}

/// @nodoc
abstract mixin class $PasswordResetFailureCopyWith<$Res>
    implements $PasswordResetStateCopyWith<$Res> {
  factory $PasswordResetFailureCopyWith(PasswordResetFailure value,
      $Res Function(PasswordResetFailure) _then) = _$PasswordResetFailureCopyWithImpl;

  @useResult
  $Res call({
    String error
  });


}

/// @nodoc
class _$PasswordResetFailureCopyWithImpl<$Res>
    implements $PasswordResetFailureCopyWith<$Res> {
  _$PasswordResetFailureCopyWithImpl(this._self, this._then);

  final PasswordResetFailure _self;
  final $Res Function(PasswordResetFailure) _then;

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
    return _then(PasswordResetFailure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

// dart format on
