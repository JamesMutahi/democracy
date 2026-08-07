part of 'fcm_bloc.dart';

@freezed
sealed class FcmEvent with _$FcmEvent {
  const factory FcmEvent.started({required bool isWeb}) = FcmStarted;
  const factory FcmEvent.tokenRefreshed({
    required bool isWeb,
    required String token,
  }) = FcmTokenRefreshed;
  const factory FcmEvent.messageReceived({required RemoteMessage message}) =
      FcmMessageReceived;
  const factory FcmEvent.notificationTapped({required RemoteMessage message}) =
      FcmNotificationTapped;
}
