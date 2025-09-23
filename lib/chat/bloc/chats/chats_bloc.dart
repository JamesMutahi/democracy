import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
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
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_Resubscribe>((event, emit) {
      _onResubscribe(event, emit);
    });
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

  Future _onResubscribe(_Resubscribe event, Emitter<ChatsState> emit) async {
    List<int> chatIds = event.chats.map((chat) => chat.id).toList();
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'resubscribe',
        'request_id': requestId,
        'pks': chatIds,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
