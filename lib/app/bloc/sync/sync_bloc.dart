import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_event.dart';
part 'sync_state.dart';
part 'sync_bloc.freezed.dart';

const String chatsStream = 'chats';
const String messagesRequestId = 'messages';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  SyncBloc({
    required this.webSocketService,
    required this.databaseRepository,
    required this.apiRepository,
  }) : super(const SyncState.initial()) {
    on<_Start>((event, emit) {
      emit(_Syncing());
      add(_PostDrafts());
      add(_PostMessages());
      add(_UploadMessageAssets());
      add(_PatchMessages());
      add(_DeleteMessages());
    });
    on<_PostDrafts>((event, emit) async => await _onPostDrafts(event, emit));
    on<_PostMessages>(
      (event, emit) async => await _onPostMessages(event, emit),
    );
    on<_UploadMessageAssets>(
      (event, emit) async => await _onUploadMessageAssets(event, emit),
    );
    on<_PatchMessages>(
      (event, emit) async => await _onPatchMessages(event, emit),
    );
    on<_DeleteMessages>(
      (event, emit) async => await _onDeleteMessages(event, emit),
    );
  }

  Future _onPostDrafts(_PostDrafts event, Emitter<SyncState> emit) async {}

  Future _onPostMessages(_PostMessages event, Emitter<SyncState> emit) async {
    try {
      final forPost = await databaseRepository.getMessagesToPost();
      for (Message message in forPost) {
        final data = await apiRepository.createMessage(
          uuid: message.uuid,
          chat: message.chat.target!,
          text: message.text,
          post: message.post,
          ballot: message.ballot,
          survey: message.survey,
          petition: message.petition,
          meeting: message.meeting,
          section: message.section,
          filePaths: message.filePaths,
          location: message.location,
        );
        final msg = Message.fromJson(data['message']);
        message.id = msg.id;
        message.assets = msg.assets;
        message.syncType = msg.assets.isNotEmpty ? SyncType.assets : null;
        await databaseRepository.updateMessage(message: message);
        if (message.assets.isNotEmpty) {
          List<String> assetIdList = await getAssetIds(data['uploads']);
          await apiRepository.messageAssetUploadComplete(
            assetIdList: assetIdList,
          );
        }
        message.syncStatus = SyncStatus.synced;
        message.syncType = null;
        await databaseRepository.updateMessage(message: message);
      }
    } catch (e) {
      emit(SyncFailure(error: e.toString()));
    }
  }

  Future _onUploadMessageAssets(
    _UploadMessageAssets event,
    Emitter<SyncState> emit,
  ) async {
    try {
      final forUpload = await databaseRepository.getMessagesToUploadAssets();
      for (Message message in forUpload) {
        List<Map> data = await apiRepository.generateUploadUrl(
          message: message,
        );
        List<String> assetIdList = await getAssetIds(data);
        await apiRepository.messageAssetUploadComplete(
          assetIdList: assetIdList,
        );
        message.syncStatus = SyncStatus.synced;
        await databaseRepository.updateMessage(message: message);
      }
    } catch (e) {
      emit(SyncFailure(error: e.toString()));
    }
  }

  Future _onPatchMessages(_PatchMessages event, Emitter<SyncState> emit) async {
    try {
      final forPatch = await databaseRepository.getMessagesToPatch();
      for (Message message in forPatch) {
        webSocketService.send({
          'stream': chatsStream,
          'payload': {
            'action': 'edit_message',
            'request_id': messagesRequestId,
            'pk': message.id,
            'data': {'text': message.text},
          },
        });
      }
    } catch (e) {
      emit(SyncFailure(error: e.toString()));
    }
  }

  Future _onDeleteMessages(
    _DeleteMessages event,
    Emitter<SyncState> emit,
  ) async {
    try {
      final forDelete = await databaseRepository.getMessagesToDelete();
      for (Message message in forDelete) {
        webSocketService.send({
          'stream': chatsStream,
          'payload': {
            'action': 'delete_message',
            'request_id': messagesRequestId,
            'pk': message.id,
          },
        });
      }
    } catch (e) {
      emit(SyncFailure(error: e.toString()));
    }
  }

  Future<List<String>> getAssetIds(List uploads) async {
    List<String> assetIdList = [];
    for (var upload in uploads) {
      assetIdList.add(upload['asset_id']);
      await apiRepository.uploadMessageAsset(
        name: upload['name']!,
        url: upload['url']!,
        onSendProgress: (int p1, int p2) {},
      );
    }
    return assetIdList;
  }

  final WebSocketService webSocketService;
  final DatabaseRepository databaseRepository;
  final APIRepository apiRepository;
}
