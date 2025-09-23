import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_bloc.freezed.dart';
part 'messages_state.dart';
part 'messages_event.dart';

const String stream = 'chats';
const String requestId = 'messages';
const String action = 'messages';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc({required this.webSocketService}) : super(MessagesState()) {
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

  Future _onGet(_Get event, Emitter<MessagesState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': requestId,
        'chat': event.chat.id,
        'last_message': event.lastMessage?.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<MessagesState> emit) async {
    emit(state.copyWith(status: MessagesStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Message> messages = List.from(
        event.payload['data']['results'].map((e) => Message.fromJson(e)),
      );
      int? lastMessage = event.payload['data']['last_message'];
      emit(
        state.copyWith(
          status: MessagesStatus.success,
          messages:
              lastMessage == null ? messages : [...state.messages, ...messages],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: MessagesStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
