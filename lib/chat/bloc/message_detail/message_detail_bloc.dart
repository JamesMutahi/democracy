import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_detail_bloc.freezed.dart';
part 'message_detail_state.dart';
part 'message_detail_event.dart';

const String stream = 'chats';
const String requestId = 'messages';

class MessageDetailBloc extends Bloc<MessageDetailEvent, MessageDetailState> {
  MessageDetailBloc({
    required this.webSocketService,
    required this.authRepository,
    required this.apiRepository,
    required this.databaseRepository,
  }) : super(const MessageDetailState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['request_id'] == requestId) {
          switch (message['payload']['action']) {
            case 'create':
              add(_Created(payload: message['payload']));
            case 'update':
              add(_Updated(payload: message['payload']));
            case 'delete':
              add(_Deleted(payload: message['payload']));
          }
        }
      }
    });
    on<_Created>((event, emit) async => await _onCreated(event, emit));
    on<_Updated>((event, emit) async => await _onUpdated(event, emit));
    on<_Deleted>((event, emit) async => await _onDeleted(event, emit));
    on<_Edit>((event, emit) async => await _onEdit(event, emit));
    on<_Delete>((event, emit) async => await _onDelete(event, emit));
  }

  Future _onCreated(_Created event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    if (event.payload['response_status'] == 201) {
      Message message = Message.fromJson(event.payload['data']);
      await databaseRepository.createMessage(
        chatId: event.payload['data']['chat'],
        message: message,
      );
      emit(MessageCreated(message: message));
    } else {
      emit(MessageDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onUpdated(_Updated event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    if (event.payload['response_status'] == 200) {
      Message message = Message.fromJson(event.payload['data']);
      emit(MessageUpdated(message: message));
    } else {
      emit(MessageDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(
        MessageDeleted(
          messageId: event.payload['pk'],
          chatId: event.payload['chat_id'],
        ),
      );
    } else {
      emit(MessageDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onEdit(_Edit event, Emitter<MessageDetailState> emit) async {
    if (!webSocketService.isConnected) {
      emit(MessageDetailFailure(error: serverError));
      return;
    }
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'edit_message',
        'request_id': requestId,
        'pk': event.message.id,
        'data': {'text': event.text},
      },
    };
    webSocketService.send(message);
  }

  Future _onDelete(_Delete event, Emitter<MessageDetailState> emit) async {
    if (!webSocketService.isConnected) {
      emit(MessageDetailFailure(error: serverError));
      return;
    }

    for (Message msg in event.messages) {
      Map<String, dynamic> message = {
        'stream': stream,
        'payload': {
          'action': 'delete_message',
          'request_id': requestId,
          'pk': msg.id,
        },
      };
      webSocketService.send(message);
    }
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
  final DatabaseRepository databaseRepository;
}
