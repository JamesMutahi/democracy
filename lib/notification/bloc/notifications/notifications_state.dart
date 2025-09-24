part of 'notifications_bloc.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = NotificationsInitial;

  const factory NotificationsState.loading() = NotificationsLoading;

  const factory NotificationsState.loaded({
    required List<Notification> notifications,
  }) = NotificationsLoaded;

  const factory NotificationsState.failure({required String error}) =
      NotificationsFailure;
}
