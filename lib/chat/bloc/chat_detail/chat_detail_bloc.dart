import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_detail_bloc.freezed.dart';
part 'chat_detail_state.dart';
part 'chat_detail_event.dart';

const String stream = 'chats';
const String requestId = 'chats';

class ChatDetailBloc extends Bloc<ChatDetailEvent, ChatDetailState> {
  ChatDetailBloc({
    required this.webSocketService,
    required this.authRepository,
    required this.apiRepository,
  }) : super(const ChatDetailState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['request_id'] != 'messages') {
          switch (message['payload']['action']) {
            case 'create':
              add(_Created(payload: message['payload']));
            case 'retrieve':
              add(_Loaded(payload: message['payload']));
            case 'update':
              add(_Updated(payload: message['payload']));
            case 'delete':
              add(_Deleted(payload: message['payload']));
          }
        }
      }
    });
    on<_Created>((event, emit) => _onCreated(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
    on<_Deleted>((event, emit) => _onDeleted(event, emit));
    on<_Create>((event, emit) => _onCreate(event, emit));
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_MarkAsRead>((event, emit) => _onMarkAsRead(event, emit));
    on<_Unsubscribe>((event, emit) => _onUnsubscribe(event, emit));
  }

  void _onCreated(_Created event, Emitter<ChatDetailState> emit) {
    emit(ChatDetailLoading());
    if (event.payload['response_status'] == 201) {
      final Chat chat = Chat.fromJson(event.payload['data']);
      emit(ChatCreated(chat: chat, userId: event.payload['request_id']));
    } else {
      emit(ChatDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onLoaded(_Loaded event, Emitter<ChatDetailState> emit) {
    emit(ChatDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Chat chat = Chat.fromJson(event.payload['data']);
      emit(ChatLoaded(chat: chat));
    } else {
      emit(ChatDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onUpdated(_Updated event, Emitter<ChatDetailState> emit) {
    emit(ChatDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Chat chat = Chat.fromJson(event.payload['data']);
      emit(ChatUpdated(chat: chat));
    } else {
      emit(ChatDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onDeleted(_Deleted event, Emitter<ChatDetailState> emit) {
    emit(ChatDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(ChatDeleted(chatId: event.payload['pk']));
    } else {
      emit(ChatDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onCreate(_Create event, Emitter<ChatDetailState> emit) {
    emit(ChatDetailLoading());
    if (!webSocketService.isConnected) {
      emit(ChatDetailFailure(error: serverError));
      return;
    }

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

  void _onGet(_Get event, Emitter<ChatDetailState> emit) {
    emit(ChatDetailLoading());
    if (!webSocketService.isConnected) {
      emit(ChatDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.chat.id,
        'pk': event.chat.id,
      },
    };
    webSocketService.send(message);
  }

  void _onMarkAsRead(_MarkAsRead event, Emitter<ChatDetailState> emit) {
    emit(ChatDetailLoading());
    if (!webSocketService.isConnected) {
      emit(ChatDetailFailure(error: serverError));
      return;
    }

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

  void _onUnsubscribe(_Unsubscribe event, Emitter<ChatDetailState> emit) {
    emit(ChatDetailLoading());
    if (!webSocketService.isConnected) {
      emit(ChatDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'unsubscribe',
        'request_id': event.chat.id,
        'pk': event.chat.id,
      },
    };
    webSocketService.send(message);
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
  final AuthRepository authRepository;
  final APIRepository apiRepository;
}
