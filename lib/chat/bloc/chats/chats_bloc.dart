import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/utils/transformers.dart';
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
  ChatsBloc({required this.webSocketService}) : super(const ChatsState()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit), transformer: debounce());
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
    on<_UpdateMultiple>((event, emit) => _onUpdateMultiple(event, emit));
  }

  Future _onGet(_Get event, Emitter<ChatsState> emit) async {
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
      final List<Chat> chats = List.from(
        event.payload['data']['results'].map((e) => Chat.fromJson(e)),
      );
      int? lastChat = event.payload['data']['last_chat'];
      emit(
        state.copyWith(
          status: ChatsStatus.success,
          chats: lastChat == null ? chats : [...state.chats, ...chats],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: ChatsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<ChatsState> emit) {
    final exists = state.chats.any((c) => c.id == event.chat.id);

    if (!exists) {
      emit(
        state.copyWith(
          chats: [event.chat, ...state.chats],
          status: ChatsStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<ChatsState> emit) {
    final index = state.chats.indexWhere((c) => c.id == event.chat.id);
    if (index == -1) return;

    final updatedChats = List<Chat>.from(state.chats);
    updatedChats[index] = event.chat;

    emit(state.copyWith(chats: updatedChats, status: ChatsStatus.success));
  }

  void _onRemove(_Remove event, Emitter<ChatsState> emit) {
    final updatedChats = state.chats
        .where((c) => c.id != event.chatId)
        .toList();

    emit(state.copyWith(chats: updatedChats, status: ChatsStatus.success));
  }

  void _onUpdateMultiple(_UpdateMultiple event, Emitter<ChatsState> emit) {
    if (event.chats.isEmpty) return;

    var currentChats = List<Chat>.from(state.chats);

    for (final newChat in event.chats) {
      final index = currentChats.indexWhere((c) => c.id == newChat.id);
      if (index != -1) {
        currentChats[index] = newChat;
      } else {
        currentChats.insert(0, newChat);
      }
    }

    emit(state.copyWith(chats: currentChats, status: ChatsStatus.success));
  }

  final WebSocketService webSocketService;
}
