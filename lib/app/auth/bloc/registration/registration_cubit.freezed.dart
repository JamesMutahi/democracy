// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegistrationState {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegistrationState);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegistrationState()';
  }


}

/// @nodoc
class $RegistrationStateCopyWith<$Res> {
  $RegistrationStateCopyWith(RegistrationState _,
      $Res Function(RegistrationState) __);
}


/// @nodoc


class RegistrationInitial implements RegistrationState {
  const RegistrationInitial();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegistrationInitial);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegistrationState.initial()';
  }


}


/// @nodoc


class RegistrationLoading implements RegistrationState {
  const RegistrationLoading();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegistrationLoading);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegistrationState.loading()';
  }


}


/// @nodoc


class RegistrationUnverified implements RegistrationState {
  const RegistrationUnverified();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegistrationUnverified);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegistrationState.unverified()';
  }


}


/// @nodoc


class RegistrationVerified implements RegistrationState {
  const RegistrationVerified();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegistrationVerified);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegistrationState.verified()';
  }


}


/// @nodoc


class RegistrationFailure implements RegistrationState {
  const RegistrationFailure({required this.error});


  final String error;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegistrationFailureCopyWith<RegistrationFailure> get copyWith =>
      _$RegistrationFailureCopyWithImpl<RegistrationFailure>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegistrationFailure &&
            (identical(other.error, error) || other.error == error));
  }


  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'RegistrationState.failure(error: $error)';
  }


}

/// @nodoc
abstract mixin class $RegistrationFailureCopyWith<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  factory $RegistrationFailureCopyWith(RegistrationFailure value,
      $Res Function(RegistrationFailure) _then) = _$RegistrationFailureCopyWithImpl;

  @useResult
  $Res call({
    String error
  });


}

/// @nodoc
class _$RegistrationFailureCopyWithImpl<$Res>
    implements $RegistrationFailureCopyWith<$Res> {
  _$RegistrationFailureCopyWithImpl(this._self, this._then);

  final RegistrationFailure _self;
  final $Res Function(RegistrationFailure) _then;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
    return _then(RegistrationFailure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

// dart format on
