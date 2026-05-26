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
    on<_Update>((event, emit) async => await _onUpdate(event, emit));
    on<_Reload>((event, emit) async => await _onReload(event, emit));
  }

  Future _onGet(_Get event, Emitter<MessagesState> emit) async {
    emit(state.copyWith(status: MessagesStatus.loading, chatId: event.chat.id));
    if (event.oldestMessage == null && event.newestMessage == null) {
      final messages = await databaseRepository.fetchMessages(
        chatId: event.chat.id,
      );
      emit(state.copyWith(messages: messages));
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
        'oldest_message': event.oldestMessage?.id, // get old messages
        'newest_message': event.newestMessage?.id, // get new messages
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

  Future _onUpdate(_Update event, Emitter<MessagesState> emit) async {
    final messages = await databaseRepository.fetchMessages(
      chatId: event.message.chatId,
    );
    emit(
      state.copyWith(
        chatId: event.message.chatId,
        messages: messages,
        status: MessagesStatus.success,
      ),
    );
  }

  Future _onReload(_Reload event, Emitter<MessagesState> emit) async {
    final messages = await databaseRepository.fetchMessages(
      chatId: state.chatId!,
    );
    emit(
      state.copyWith(
        chatId: state.chatId,
        messages: messages,
        status: MessagesStatus.success,
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
  final DatabaseRepository databaseRepository;
}
