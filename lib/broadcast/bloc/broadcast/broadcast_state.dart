part of 'broadcast_bloc.dart';

enum BroadcastStatus { initial, loading, success, failure }

final class BroadcastState extends Equatable {
  const BroadcastState({
    this.status = BroadcastStatus.initial,
    this.broadcast,
    this.broadcastId,
  });

  final BroadcastStatus status;
  final Broadcast? broadcast;
  final int? broadcastId;

  BroadcastState copyWith({
    BroadcastStatus? status,
    Broadcast? broadcast,
    int? broadcastId,
  }) {
    return BroadcastState(
      status: status ?? this.status,
      broadcast: broadcast ?? this.broadcast,
      broadcastId: broadcastId ?? this.broadcastId,
    );
  }

  @override
  String toString() {
    return '''BroadcastState { status: $status, broadcast: $broadcast, broadcastId: $broadcastId }''';
  }

  @override
  List<Object?> get props => [status, broadcast, broadcastId];
}
