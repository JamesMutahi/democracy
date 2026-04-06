part of 'notifications_bloc.dart';

@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.get() = _Get;
  const factory NotificationsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory NotificationsEvent.add({required Notification notification}) =
      _Add;
  const factory NotificationsEvent.update({
    required Notification notification,
  }) = _Update;
  const factory NotificationsEvent.remove({required int notificationId}) =
      _Remove;
}
