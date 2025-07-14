import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:democracy/notification/models/notification.dart';

part 'notifications_state.dart';
part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsState.initial());

  void websocketFailure({required String error}) {
    if (state is NotificationsInitial || state is NotificationsLoading) {
      emit(NotificationsFailure(error: error));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(NotificationsLoading());
    if (payload['response_status'] == 200) {
      List<Notification> notifications = List.from(
        payload['data'].map((e) => Notification.fromJson(e)),
      );
      emit(NotificationsLoaded(notifications: notifications));
    } else {
      emit(NotificationsFailure(error: payload['errors'].toString()));
    }
  }
}
