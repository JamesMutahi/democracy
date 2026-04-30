import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_bloc.freezed.dart';
part 'chats_state.dart';
part 'chats_event.dart';

const String stream = 'chats';
const String requestId = 'chats';
const String action = 'list';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc({required this.webSocketService, required this.databaseRepository})
    : super(const ChatsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>(
      (event, emit) async => await _onGet(event, emit),
      transformer: debounce(),
    );
    on<_Received>((event, emit) async => await _onReceived(event, emit));
    on<_Update>((event, emit) async => await _onUpdate(event, emit));
  }

  Future _onGet(_Get event, Emitter<ChatsState> emit) async {
    emit(state.copyWith(status: ChatsStatus.loading));

    final chats = await databaseRepository.fetchChats();
    emit(state.copyWith(chats: chats));

    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: ChatsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'last_chat': event.lastChat?.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<ChatsState> emit) async {
    emit(state.copyWith(status: ChatsStatus.loading));
    if (event.payload['response_status'] == 200) {
      await databaseRepository.saveChatsData(event.payload['data']['results']);
      List<Chat> chats = await databaseRepository.fetchChats();
      emit(
        state.copyWith(
          status: ChatsStatus.success,
          chats: chats,
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: ChatsStatus.failure));
    }
  }

  Future _onUpdate(_Update event, Emitter<ChatsState> emit) async {
    List<Chat> chats = await databaseRepository.fetchChats();
    emit(state.copyWith(chats: chats, status: ChatsStatus.success));
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
