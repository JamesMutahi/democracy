import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/sync/sync_bloc.dart'
    show SyncStatus, SyncType;
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:uuid/uuid.dart';

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
        switch (message['payload']['action']) {
          case 'message_create':
            add(_Created(payload: message['payload']));
          case 'message_update':
            add(_Updated(payload: message['payload']));
          case 'message_delete':
            add(_Deleted(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) async => await _onCreated(event, emit));
    on<_Updated>((event, emit) async => await _onUpdated(event, emit));
    on<_Deleted>((event, emit) async => await _onDeleted(event, emit));
    on<_Create>((event, emit) async => await _onCreate(event, emit));
    on<_Edit>((event, emit) async => await _onEdit(event, emit));
    on<_Delete>((event, emit) async => await _onDelete(event, emit));
  }

  Future _onCreated(_Created event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    if (event.payload['response_status'] == 201) {
      Message newMessage = Message.fromJson(event.payload['data']);
      final message = await databaseRepository.createMessage(
        chatId: event.payload['data']['chat'],
        message: newMessage,
      );
      emit(MessageCreated(message: message));
    } else {
      emit(MessageDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onUpdated(_Updated event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    if (event.payload['response_status'] == 200) {
      Message newMessage = Message.fromJson(event.payload['data']);
      final message = await databaseRepository.createMessage(
        chatId: event.payload['data']['chat'],
        message: newMessage,
      );
      emit(MessageUpdated(message: message));
    } else {
      emit(MessageDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    if (event.payload['response_status'] == 204) {
      int id = event.payload['data']['pk'];
      final message = await databaseRepository.getMessage(id: id);
      await databaseRepository.deleteMessage(message: message!);
      emit(MessageDeleted(message: message));
    } else {
      emit(MessageDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onCreate(_Create event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    try {
      final newMessage = Message(
        author: event.author,
        text: event.text,
        post: event.post,
        ballot: event.ballot,
        survey: event.survey,
        petition: event.petition,
        meeting: event.meeting,
        section: event.section,
        filePaths: event.filePaths,
        location: event.location,
        syncStatus: SyncStatus.pending,
        syncType: SyncType.post,
        uuid: Uuid().v4(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      final message = await databaseRepository.createMessage(
        chatId: event.chat.id,
        message: newMessage,
      );
      emit(MessageCreatedInDB(message: message));
    } catch (e) {
      emit(MessageDetailFailure(error: e.toString()));
    }
  }

  Future _onEdit(_Edit event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    try {
      Message message = event.message;
      message.text = event.text;
      message.isEdited = true;
      if (message.syncStatus == SyncStatus.synced) {
        message.syncStatus = SyncStatus.pending;
        message.syncType = SyncType.patch;
      }
      await databaseRepository.updateMessage(message: event.message);
      emit(MessageUpdatedInDB(message: message));
    } catch (e) {
      emit(MessageDetailFailure(error: e.toString()));
    }
  }

  Future _onDelete(_Delete event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    try {
      for (Message message in event.messages) {
        message.isDeleted = true;
        if (message.syncStatus == SyncStatus.synced) {
          message.syncStatus = SyncStatus.pending;
          message.syncType = SyncType.delete;
        }
        await databaseRepository.updateMessage(message: message);
        emit(MessageDeletedInDB(message: message));
      }
    } catch (e) {
      emit(MessageDetailFailure(error: e.toString()));
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
