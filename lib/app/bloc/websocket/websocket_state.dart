part of 'websocket_bloc.dart';

@freezed
abstract class WebsocketState with _$WebsocketState {
  const factory WebsocketState.initial() = WebsocketInitial;

  const factory WebsocketState.loading() = WebsocketLoading;

  const factory WebsocketState.success({
    required Map<String, dynamic> message,
  }) = WebsocketSuccess;

  const factory WebsocketState.failure({required String error}) =
      WebsocketFailure;
}
