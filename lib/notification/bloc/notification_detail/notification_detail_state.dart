part of 'notification_detail_bloc.dart';

@freezed
class NotificationDetailState with _$NotificationDetailState {
  const factory NotificationDetailState.initial() = NotificationDetailInitial;

  const factory NotificationDetailState.loading() = NotificationDetailLoading;

  const factory NotificationDetailState.created({
    required Notification notification,
  }) = NotificationCreated;

  const factory NotificationDetailState.updated({
    required Notification notification,
  }) = NotificationUpdated;

  const factory NotificationDetailState.deleted({required int notificationId}) =
      NotificationDeleted;

  const factory NotificationDetailState.failure({required String error}) =
      NotificationDetailFailure;
}
