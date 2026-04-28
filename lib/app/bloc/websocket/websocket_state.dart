part of 'websocket_bloc.dart';

final class WebsocketState extends Equatable {
  const WebsocketState({
    this.status = WebsocketStatus.initial,
    this.initialConnectionAchieved = false,
  });

  final WebsocketStatus status;
  final bool initialConnectionAchieved; /// if false, splash page will be shown

  WebsocketState copyWith({
    WebsocketStatus? status,
    bool? initialConnectionAchieved,
  }) {
    return WebsocketState(
      status: status ?? this.status,
      initialConnectionAchieved:
          initialConnectionAchieved ?? this.initialConnectionAchieved,
    );
  }

  @override
  String toString() {
    return '''WebsocketState { status: $status }''';
  }

  @override
  List<Object> get props => [status, initialConnectionAchieved];
}
