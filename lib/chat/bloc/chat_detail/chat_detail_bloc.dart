import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_detail_bloc.freezed.dart';
part 'chat_detail_state.dart';
part 'chat_detail_event.dart';

const String stream = 'chats';
const String requestId = 'chats';

class ChatDetailBloc extends Bloc<ChatDetailEvent, ChatDetailState> {
  ChatDetailBloc({required this.webSocketService})
    : super(const ChatDetailState.initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
          case 'direct_message':
            add(_DirectMessageSent(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) {
      _onCreated(event, emit);
    });
    on<_Loaded>((event, emit) {
      _onLoaded(event, emit);
    });
    on<_Updated>((event, emit) {
      _onUpdated(event, emit);
    });
    on<_Deleted>((event, emit) {
      _onDeleted(event, emit);
    });
    on<_DirectMessageSent>((event, emit) {
      _onDirectMessageSent(event, emit);
    });
    on<_Create>((event, emit) {
      _onCreate(event, emit);
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Subscribe>((event, emit) {
      _onSubscribe(event, emit);
    });
    on<_SendDirectMessage>((event, emit) {
      _onSendDirectMessage(event, emit);
    });
    on<_MarkAsRead>((event, emit) {
      _onMarkAsRead(event, emit);
    });
  }

  Future _onCreated(_Created event, Emitter<ChatDetailState> emit) async {
    emit(ChatDetailLoading());
    if (event.payload['response_status'] == 201) {
      final Chat chat = Chat.fromJson(event.payload['data']);
      emit(ChatCreated(chat: chat, userId: event.payload['request_id']));
    } else {
      emit(ChatDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onLoaded(_Loaded event, Emitter<ChatDetailState> emit) async {
    emit(ChatDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Chat chat = Chat.fromJson(event.payload['data']);
      emit(ChatLoaded(chat: chat));
    } else {
      emit(ChatDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onUpdated(_Updated event, Emitter<ChatDetailState> emit) async {
    emit(ChatDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Chat chat = Chat.fromJson(event.payload['data']);
      emit(ChatUpdated(chat: chat));
    } else {
      emit(ChatDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<ChatDetailState> emit) async {
    emit(ChatDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(ChatDeleted(chatId: event.payload['pk']));
    } else {
      emit(ChatDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onDirectMessageSent(
    _DirectMessageSent event,
    Emitter<ChatDetailState> emit,
  ) async {
    emit(ChatDetailLoading());
    if (event.payload['response_status'] == 200) {
      final List<Chat> chats = List.from(
        event.payload['data'].map((e) => Chat.fromJson(e)),
      );
      emit(DirectMessageSent(chats: chats));
    } else {
      emit(ChatDetailFailure(error: event.payload['errors']));
    }
  }

  Future _onCreate(_Create event, Emitter<ChatDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'create',
        'request_id': event.user.id,
        'data': {'user': event.user.id},
      },
    };
    webSocketService.send(message);
  }

  Future _onGet(_Get event, Emitter<ChatDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': requestId,
        'pk': event.chat.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onSubscribe(_Subscribe event, Emitter<ChatDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'join_chat',
        'request_id': requestId,
        'pk': event.chat.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onSendDirectMessage(
    _SendDirectMessage event,
    Emitter<ChatDetailState> emit,
  ) async {
    List<int> userPks = event.users.map((user) => user.id).toList();
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'direct_message',
        'request_id': requestId,
        'user_pks': userPks,
        'data': {
          'text': event.text,
          'post_id': event.post?.id,
          'ballot_id': event.ballot?.id,
          'survey_id': event.survey?.id,
          'petition_id': event.petition?.id,
        },
      },
    };
    webSocketService.send(message);
  }

  Future _onMarkAsRead(_MarkAsRead event, Emitter<ChatDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'mark_as_read',
        'request_id': requestId,
        'pk': event.chat.id,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
