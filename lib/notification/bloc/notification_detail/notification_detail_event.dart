part of 'notification_detail_bloc.dart';

@freezed
sealed class NotificationDetailEvent with _$NotificationDetailEvent {
  const factory NotificationDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;

  const factory NotificationDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;

  const factory NotificationDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;

  const factory NotificationDetailEvent.markAsRead({
    required Notification notification,
  }) = _MarkAsRead;

  const factory NotificationDetailEvent.changeStatus({required User user}) =
      _ChangeStatus;
}
