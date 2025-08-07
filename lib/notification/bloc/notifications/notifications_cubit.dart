import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:democracy/notification/models/notification.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsState());

  void websocketFailure({required String error}) {
    emit(state.copyWith(status: NotificationsStatus.failure));
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: NotificationsStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Notification> notifications = List.from(
        payload['data']['results'].map((e) => Notification.fromJson(e)),
      );
      int? lastNotification = payload['data']['last_notification'];
      emit(
        state.copyWith(
          status: NotificationsStatus.success,
          notifications:
              lastNotification == null
                  ? notifications
                  : [...state.notifications, ...notifications],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: NotificationsStatus.failure));
    }
  }
}
