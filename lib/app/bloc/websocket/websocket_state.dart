part of 'websocket_bloc.dart';

enum WebsocketStatus {
  initial,
  loading,
  connected,
  success,
  failure,
  disconnected,
}

final class WebsocketState extends Equatable {
  const WebsocketState({
    this.status = WebsocketStatus.initial,
    this.initialConnectionAchieved = false,
    this.message = const {},
  });

  final WebsocketStatus status;
  final bool initialConnectionAchieved;
  final Map<String, dynamic> message;

  WebsocketState copyWith({
    WebsocketStatus? status,
    bool? initialConnectionAchieved,
    Map<String, dynamic>? message,
  }) {
    return WebsocketState(
      status: status ?? this.status,
      initialConnectionAchieved:
          initialConnectionAchieved ?? this.initialConnectionAchieved,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return '''WebsocketState { status: $status, message: $message }''';
  }

  @override
  List<Object> get props => [status, initialConnectionAchieved, message];
}
