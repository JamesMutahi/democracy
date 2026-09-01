part of 'broadcast_bloc.dart';

enum BroadcastStatus { initial, loading, success, failure }

enum BroadcastView { fullscreen, minimized }

final class BroadcastState extends Equatable {
  const BroadcastState({
    this.status = BroadcastStatus.initial,
    this.view = BroadcastView.fullscreen,
    this.broadcast,
    this.broadcastId,
  });

  final BroadcastStatus status;
  final BroadcastView view;
  final Broadcast? broadcast;
  final int? broadcastId;

  BroadcastState copyWith({
    BroadcastStatus? status,
    BroadcastView? view,
    Broadcast? broadcast,
    int? broadcastId,
  }) {
    return BroadcastState(
      status: status ?? this.status,
      view: view ?? this.view,
      broadcast: broadcast ?? this.broadcast,
      broadcastId: broadcastId ?? this.broadcastId,
    );
  }

  @override
  String toString() {
    return '''BroadcastState { status: $status, view: $view, broadcast: $broadcast, broadcastId: $broadcastId }''';
  }

  @override
  List<Object?> get props => [status, view, broadcast, broadcastId];
}
