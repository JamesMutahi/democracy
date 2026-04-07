import 'dart:async';

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
  MessagesBloc({required this.webSocketService})
    : super(const MessagesState()) {
    _subscription = webSocketService.messages.listen((message) {
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
    on<_Add>(_onAdd);
    on<_Update>(_onUpdate);
    on<_Remove>(_onRemove);
  }

  Future _onGet(_Get event, Emitter<MessagesState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': requestId,
        'chat_id': event.chat.id,
        'oldest_message': event.oldestMessage?.id,
        'newest_message': event.newestMessage?.id,
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
      int? oldestMessage = event.payload['data']['oldest_message'];
      int? newestMessage = event.payload['data']['newest_message'];
      emit(
        state.copyWith(
          status: MessagesStatus.success,
          messages: oldestMessage != null
              ? [...state.messages, ...messages]
              : newestMessage != null
              ? [...messages, ...state.messages]
              : messages,
          hasNext: event.payload['data']['has_next'],
          chatId: event.payload['data']['chat_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: MessagesStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<MessagesState> emit) {
    final message = event.message;

    // Avoid duplicates
    if (state.messages.any((m) => m.id == message.id)) return;

    emit(
      state.copyWith(
        chatId: message.chatId,
        messages: [message, ...state.messages], // newest on top
        status: MessagesStatus.success,
      ),
    );
  }

  void _onUpdate(_Update event, Emitter<MessagesState> emit) {
    final index = state.messages.indexWhere((m) => m.id == event.message.id);
    if (index == -1) return;

    final updatedMessages = List<Message>.from(state.messages);
    updatedMessages[index] = event.message;

    emit(
      state.copyWith(messages: updatedMessages, status: MessagesStatus.success),
    );
  }

  void _onRemove(_Remove event, Emitter<MessagesState> emit) {
    final updatedMessages = state.messages
        .where((m) => m.id != event.messageId)
        .toList();

    emit(
      state.copyWith(messages: updatedMessages, status: MessagesStatus.success),
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
