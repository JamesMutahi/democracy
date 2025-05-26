// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_counter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OTPCounterEvent {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OTPCounterEvent);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OTPCounterEvent()';
  }


}

/// @nodoc
class $OTPCounterEventCopyWith<$Res> {
  $OTPCounterEventCopyWith(OTPCounterEvent _,
      $Res Function(OTPCounterEvent) __);
}


/// @nodoc


class _Started implements OTPCounterEvent {
  const _Started();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OTPCounterEvent.started()';
  }


}


/// @nodoc


class _Tick implements OTPCounterEvent {
  const _Tick({required this.seconds});


  final int seconds;

  /// Create a copy of OTPCounterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TickCopyWith<_Tick> get copyWith =>
      __$TickCopyWithImpl<_Tick>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Tick &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }


  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @override
  String toString() {
    return 'OTPCounterEvent.tick(seconds: $seconds)';
  }


}

/// @nodoc
abstract mixin class _$TickCopyWith<$Res>
    implements $OTPCounterEventCopyWith<$Res> {
  factory _$TickCopyWith(_Tick value,
      $Res Function(_Tick) _then) = __$TickCopyWithImpl;

  @useResult
  $Res call({
    int seconds
  });


}

/// @nodoc
class __$TickCopyWithImpl<$Res>
    implements _$TickCopyWith<$Res> {
  __$TickCopyWithImpl(this._self, this._then);

  final _Tick _self;
  final $Res Function(_Tick) _then;

  /// Create a copy of OTPCounterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? seconds = null,}) {
    return _then(_Tick(
      seconds: null == seconds
          ? _self.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
      as int,
    ));
  }


}

/// @nodoc


class _Complete implements OTPCounterEvent {
  const _Complete();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Complete);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OTPCounterEvent.complete()';
  }


}


/// @nodoc


class _Cancel implements OTPCounterEvent {
  const _Cancel();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Cancel);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OTPCounterEvent.cancel()';
  }


}


/// @nodoc
mixin _$OTPCounterState {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OTPCounterState);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OTPCounterState()';
  }


}

/// @nodoc
class $OTPCounterStateCopyWith<$Res> {
  $OTPCounterStateCopyWith(OTPCounterState _,
      $Res Function(OTPCounterState) __);
}


/// @nodoc


class OTPCounterInitial implements OTPCounterState {
  const OTPCounterInitial();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OTPCounterInitial);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OTPCounterState.initial()';
  }


}


/// @nodoc


class OTPCounterRunning implements OTPCounterState {
  const OTPCounterRunning(this.time);


  final Duration time;

  /// Create a copy of OTPCounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OTPCounterRunningCopyWith<OTPCounterRunning> get copyWith =>
      _$OTPCounterRunningCopyWithImpl<OTPCounterRunning>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OTPCounterRunning &&
            (identical(other.time, time) || other.time == time));
  }


  @override
  int get hashCode => Object.hash(runtimeType, time);

  @override
  String toString() {
    return 'OTPCounterState.running(time: $time)';
  }


}

/// @nodoc
abstract mixin class $OTPCounterRunningCopyWith<$Res>
    implements $OTPCounterStateCopyWith<$Res> {
  factory $OTPCounterRunningCopyWith(OTPCounterRunning value,
      $Res Function(OTPCounterRunning) _then) = _$OTPCounterRunningCopyWithImpl;

  @useResult
  $Res call({
    Duration time
  });


}

/// @nodoc
class _$OTPCounterRunningCopyWithImpl<$Res>
    implements $OTPCounterRunningCopyWith<$Res> {
  _$OTPCounterRunningCopyWithImpl(this._self, this._then);

  final OTPCounterRunning _self;
  final $Res Function(OTPCounterRunning) _then;

  /// Create a copy of OTPCounterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? time = null,}) {
    return _then(OTPCounterRunning(
      null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
      as Duration,
    ));
  }


}

/// @nodoc


class OTPCounterExpired implements OTPCounterState {
  const OTPCounterExpired(this.message);


  final String message;

  /// Create a copy of OTPCounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OTPCounterExpiredCopyWith<OTPCounterExpired> get copyWith =>
      _$OTPCounterExpiredCopyWithImpl<OTPCounterExpired>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OTPCounterExpired &&
            (identical(other.message, message) || other.message == message));
  }


  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'OTPCounterState.expired(message: $message)';
  }


}

/// @nodoc
abstract mixin class $OTPCounterExpiredCopyWith<$Res>
    implements $OTPCounterStateCopyWith<$Res> {
  factory $OTPCounterExpiredCopyWith(OTPCounterExpired value,
      $Res Function(OTPCounterExpired) _then) = _$OTPCounterExpiredCopyWithImpl;

  @useResult
  $Res call({
    String message
  });


}

/// @nodoc
class _$OTPCounterExpiredCopyWithImpl<$Res>
    implements $OTPCounterExpiredCopyWith<$Res> {
  _$OTPCounterExpiredCopyWithImpl(this._self, this._then);

  final OTPCounterExpired _self;
  final $Res Function(OTPCounterExpired) _then;

  /// Create a copy of OTPCounterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
    return _then(OTPCounterExpired(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

// dart format on
