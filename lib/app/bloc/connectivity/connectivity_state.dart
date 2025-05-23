part of 'connectivity_bloc.dart';

@freezed
abstract class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState.initial() = ConnectivityInitial;

  const factory ConnectivityState.success() = ConnectivitySuccess;

  const factory ConnectivityState.failure() = ConnectivityFailure;
}