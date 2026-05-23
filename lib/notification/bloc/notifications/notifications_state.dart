part of 'notifications_bloc.dart';

enum NotificationsStatus { initial, loading, success, failure }

final class NotificationsState extends Equatable {
  const NotificationsState({
    this.status = NotificationsStatus.initial,
    this.notifications = const [],
    this.unreadCount = 0,
    this.hasNext = false,
    this.openChatId,
  });

  final NotificationsStatus status;
  final List<Notification> notifications;
  final int unreadCount;
  final bool hasNext;
  final int? openChatId;

  NotificationsState copyWith({
    NotificationsStatus? status,
    List<Notification>? notifications,
    int? unreadCount,
    bool? hasNext,
    int? openChatId,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      unreadCount: unreadCount ?? this.unreadCount,
      hasNext: hasNext ?? this.hasNext,
      openChatId: openChatId ?? this.openChatId,
    );
  }

  @override
  String toString() {
    return '''NotificationsState { status: $status, notifications: ${notifications.length}, unreadCount: $unreadCount, hasNext: $hasNext, openChatId: $openChatId }''';
  }

  @override
  List<Object?> get props => [status, notifications, openChatId];
}
