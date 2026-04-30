import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
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
  MessagesBloc({
    required this.webSocketService,
    required this.databaseRepository,
  }) : super(const MessagesState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) async => await _onGet(event, emit));
    on<_Received>((event, emit) async => await _onReceived(event, emit));
    on<_Add>((event, emit) async => await _onAdd(event, emit));
    on<_Update>((event, emit) async => await _onUpdate(event, emit));
    on<_Remove>((event, emit) async => await _onRemove(event, emit));
  }

  Future _onGet(_Get event, Emitter<MessagesState> emit) async {
    emit(state.copyWith(status: MessagesStatus.loading, chatId: event.chat.id));
    if (event.oldestMessage == null && event.newestMessage == null) {
      emit(state.copyWith(messages: event.chat.messages.toList()));
    }
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: MessagesStatus.failure));
      return;
    }

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
      int chatId = event.payload['data']['chat_id'];
      await databaseRepository.saveMessageData(
        event.payload['data']['results'],
      );
      final messages = await databaseRepository.fetchMessages(chatId: chatId);
      emit(
        state.copyWith(
          status: MessagesStatus.success,
          messages: messages,
          hasNext: event.payload['data']['has_next'],
          chatId: chatId,
        ),
      );
    } else {
      emit(state.copyWith(status: MessagesStatus.failure));
    }
  }

  Future _onAdd(_Add event, Emitter<MessagesState> emit) async {
    final message = event.message;

    // Avoid duplicates
    if (state.messages.any((m) => m.id == message.id)) return;

    emit(state.copyWith(status: MessagesStatus.loading));
    emit(
      state.copyWith(
        chatId: message.chat.targetId,
        messages: [message, ...state.messages], // newest on top
        status: MessagesStatus.success,
      ),
    );
  }

  Future _onUpdate(_Update event, Emitter<MessagesState> emit) async {
    final index = state.messages.indexWhere((m) => m.id == event.message.id);
    if (index == -1) return;
    emit(state.copyWith(status: MessagesStatus.loading));
    final updatedMessages = List<Message>.from(state.messages);
    updatedMessages[index] = event.message;

    emit(
      state.copyWith(messages: updatedMessages, status: MessagesStatus.success),
    );
  }

  Future _onRemove(_Remove event, Emitter<MessagesState> emit) async {
    emit(state.copyWith(status: MessagesStatus.loading));
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
  final DatabaseRepository databaseRepository;
}
