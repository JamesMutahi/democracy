import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
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
  NotificationsBloc({
    required this.webSocketService,
    required this.databaseRepository,
  }) : super(const NotificationsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) async => await _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
    on<_OpenedChat>((event, emit) {
      emit(state.copyWith(openChatId: event.chatId));
    });
  }

  void _onGet(_Get event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(status: NotificationsStatus.loading));
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

  Future _onReceived(_Received event, Emitter<NotificationsState> emit) async {
    emit(state.copyWith(status: NotificationsStatus.loading));
    if (event.payload['response_status'] == 200) {
      List<Notification> notifications = List.from(
        event.payload['data'].map((e) => Notification.fromJson(e)),
      );
      for (var data in event.payload['data']) {
        if (data['chat'] != null) {
          await databaseRepository.saveChat(data: data['chat']);
        }
      }
      emit(
        state.copyWith(
          status: NotificationsStatus.success,
          notifications: notifications,
          unreadCount: _getUnreadCount(notifications),
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
          unreadCount: _getUnreadCount([
            event.notification,
            ...state.notifications,
          ]),
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
        status: NotificationsStatus.success,
        notifications: updatedNotifications,
        unreadCount: _getUnreadCount(updatedNotifications),
      ),
    );
  }

  void _onRemove(_Remove event, Emitter<NotificationsState> emit) {
    final updatedNotifications = state.notifications
        .where((element) => element.id != event.notificationId)
        .toList();

    emit(
      state.copyWith(
        status: NotificationsStatus.success,
        notifications: updatedNotifications,
        unreadCount: _getUnreadCount(updatedNotifications),
      ),
    );
  }

  int _getUnreadCount(List<Notification> notifications) {
    return notifications.where((n) {
      // It must be unread
      if (n.isRead) return false;

      // If it is a chat notification, exclude it if it matches the open chat
      if (n.chat != null) {
        return n.chat!.id != state.openChatId;
      }

      // Always count unread non-chat notifications (where n.chat is null)
      return true;
    }).length;
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
  final DatabaseRepository databaseRepository;
}
