import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

const String stream = 'chats';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({required this.webSocketService}) : super(const ChatState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
        }
      }
    });
    on<_Load>((event, emit) => _onLoad(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
  }

  void _onLoad(_Load event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: ChatStatus.loading, chatId: event.chatId));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: ChatStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.chatId,
        'pk': event.chatId,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: ChatStatus.loading));
    try {
      if (event.payload['response_status'] == 200) {
        final chat = Chat.fromJson(event.payload['data']);
        emit(
          state.copyWith(
            status: ChatStatus.success,
            chat: chat,
            chatId: event.payload['request_id'],
          ),
        );
      } else {
        emit(state.copyWith(status: ChatStatus.failure));
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ChatStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: ChatStatus.loading));
    emit(
      state.copyWith(
        status: ChatStatus.success,
        chat: event.chat,
        chatId: event.chat.id,
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
