import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/shared/constants/strings.dart';
import 'package:democracy/notification/models/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_detail_bloc.freezed.dart';
part 'notification_detail_state.dart';
part 'notification_detail_event.dart';

const String stream = 'notifications';
const String requestId = 'notifications';

class NotificationDetailBloc
    extends Bloc<NotificationDetailEvent, NotificationDetailState> {
  NotificationDetailBloc({required this.webSocketService})
    : super(const NotificationDetailState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) => _onCreated(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
    on<_Deleted>((event, emit) => _onDeleted(event, emit));
    on<_MarkAsRead>((event, emit) => _onMarkAsRead(event, emit));
  }

  void _onCreated(_Created event, Emitter<NotificationDetailState> emit) {
    emit(NotificationDetailLoading());
    if (event.payload['response_status'] == 201) {
      Notification notification = Notification.fromJson(event.payload['data']);
      emit(NotificationCreated(notification: notification));
    } else {
      emit(
        NotificationDetailFailure(error: event.payload['errors'].toString()),
      );
    }
  }

  void _onUpdated(_Updated event, Emitter<NotificationDetailState> emit) {
    emit(NotificationDetailLoading());
    if (event.payload['response_status'] == 200) {
      Notification notification = Notification.fromJson(event.payload['data']);
      emit(NotificationUpdated(notification: notification));
    } else {
      emit(
        NotificationDetailFailure(error: event.payload['errors'].toString()),
      );
    }
  }

  void _onDeleted(_Deleted event, Emitter<NotificationDetailState> emit) {
    emit(NotificationDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(NotificationDeleted(notificationId: event.payload['pk']));
    } else {
      emit(
        NotificationDetailFailure(error: event.payload['errors'].toString()),
      );
    }
  }

  void _onMarkAsRead(_MarkAsRead event, Emitter<NotificationDetailState> emit) {
    emit(NotificationDetailLoading());
    if (!webSocketService.isConnected) {
      emit(NotificationDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'mark_as_read',
        'request_id': requestId,
        'pk': event.notification.id,
      },
    };
    webSocketService.send(message);
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
