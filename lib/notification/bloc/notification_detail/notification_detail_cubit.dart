import 'package:bloc/bloc.dart';
import 'package:democracy/notification/models/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_detail_cubit.freezed.dart';
part 'notification_detail_state.dart';

class NotificationDetailCubit extends Cubit<NotificationDetailState> {
  NotificationDetailCubit() : super(const NotificationDetailState.initial());

  void created({required Map<String, dynamic> payload}) {
    emit(NotificationDetailLoading());
    if (payload['response_status'] == 201) {
      Notification notification = Notification.fromJson(payload['data']);
      emit(NotificationCreated(notification: notification));
    } else {
      emit(NotificationDetailFailure(error: payload['errors'][0]));
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(NotificationDetailLoading());
    if (payload['response_status'] == 200) {
      Notification notification = Notification.fromJson(payload['data']);
      emit(NotificationUpdated(notification: notification));
    } else {
      emit(NotificationDetailFailure(error: payload['errors'][0]));
    }
  }

  void deleted({required Map<String, dynamic> payload}) {
    emit(NotificationDetailLoading());
    if (payload['response_status'] == 204) {
      emit(NotificationDeleted(notificationId: payload['pk']));
    } else {
      emit(NotificationDetailFailure(error: payload['errors'][0]));
    }
  }
}
