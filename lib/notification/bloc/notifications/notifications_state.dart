part of 'notifications_cubit.dart';

enum NotificationsStatus { initial, loading, success, failure }

final class NotificationsState extends Equatable {
  const NotificationsState({
    this.status = NotificationsStatus.initial,
    this.notifications = const [],
    this.hasNext = false,
  });

  final NotificationsStatus status;
  final List<Notification> notifications;
  final bool hasNext;

  NotificationsState copyWith({
    NotificationsStatus? status,
    List<Notification>? notifications,
    bool? hasNext,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''NotificationsState { status: $status, notifications: ${notifications.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, notifications];
}
