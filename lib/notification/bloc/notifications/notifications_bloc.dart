import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/notification/models/notification.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_bloc.freezed.dart';
part 'notifications_state.dart';
part 'notifications_event.dart';

const String stream = 'notifications';
const String requestId = 'notifications';
const String action = 'list';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc({required this.webSocketService})
    : super(const NotificationsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  void _onGet(_Get event, Emitter<NotificationsState> emit) {
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: NotificationsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {'action': 'list', 'request_id': requestId},
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(status: NotificationsStatus.loading));
    if (event.payload['response_status'] == 200) {
      List<Notification> notifications = List.from(
        event.payload['data'].map((e) => Notification.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: NotificationsStatus.success,
          notifications: notifications,
        ),
      );
    } else {
      emit(state.copyWith(status: NotificationsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<NotificationsState> emit) {
    final exists = state.notifications.any(
      (element) => element.id == event.notification.id,
    );

    if (!exists) {
      emit(
        state.copyWith(
          notifications: [event.notification, ...state.notifications],
          status: NotificationsStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<NotificationsState> emit) {
    final index = state.notifications.indexWhere(
      (element) => element.id == event.notification.id,
    );
    if (index == -1) return;

    final updatedNotifications = List<Notification>.from(state.notifications);
    updatedNotifications[index] = event.notification;

    emit(
      state.copyWith(
        notifications: updatedNotifications,
        status: NotificationsStatus.success,
      ),
    );
  }

  void _onRemove(_Remove event, Emitter<NotificationsState> emit) {
    final updatedNotifications = state.notifications
        .where((element) => element.id != event.notificationId)
        .toList();

    emit(
      state.copyWith(
        notifications: updatedNotifications,
        status: NotificationsStatus.success,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
