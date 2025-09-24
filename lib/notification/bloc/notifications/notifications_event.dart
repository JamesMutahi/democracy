part of 'notifications_bloc.dart';

@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.get() = _Get;
  const factory NotificationsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
