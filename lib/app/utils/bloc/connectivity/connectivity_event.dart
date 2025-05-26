part of 'connectivity_bloc.dart';

@freezed
class ConnectivityEvent with _$ConnectivityEvent {
  const factory ConnectivityEvent.listenConnection() = _ListenConnection;
  const factory ConnectivityEvent.changeConnection(
      ConnectivityState status) = _ChangeConnection;
}
