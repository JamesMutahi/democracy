import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/notification/models/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_bloc.freezed.dart';
part 'notifications_state.dart';
part 'notifications_event.dart';

const String stream = 'notifications';
const String requestId = 'notifications';
const String action = 'list';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc({required this.webSocketService})
    : super(const NotificationsState.initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<NotificationsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {'action': 'list', 'request_id': requestId},
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<NotificationsState> emit) async {
    emit(NotificationsLoading());
    if (event.payload['response_status'] == 200) {
      List<Notification> notifications = List.from(
        event.payload['data'].map((e) => Notification.fromJson(e)),
      );
      emit(NotificationsLoaded(notifications: notifications));
    } else {
      emit(NotificationsFailure(error: event.payload['errors'].toString()));
    }
  }

  final WebSocketService webSocketService;
}
