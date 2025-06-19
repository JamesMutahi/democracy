part of 'websocket_bloc.dart';

enum WebsocketStatus { initial, loading, connected, success, failure }

final class WebsocketState extends Equatable {
  const WebsocketState({
    this.status = WebsocketStatus.initial,
    this.message = const {},
  });

  final WebsocketStatus status;
  final Map<String, dynamic> message;

  WebsocketState copyWith({
    WebsocketStatus? status,
    Map<String, dynamic>? message,
  }) {
    return WebsocketState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return '''WebsocketState { status: $status, message: $message }''';
  }

  @override
  List<Object> get props => [status, message];
}
