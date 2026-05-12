import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_event.dart';
part 'sync_state.dart';
part 'sync_bloc.freezed.dart';

const String chatsStream = 'chats';
const String messagesRequestId = 'messages';

class SyncStatus {
  static const String pending = 'Pending';
  static const String synced = 'Synced';
  static const String failed = 'Failed';
}

class SyncType {
  static const String post = 'Post';
  static const String assets = 'Upload assets';
  static const String patch = 'Patch';
  static const String delete = 'Delete';
}

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  SyncBloc({required this.databaseRepository, required this.apiRepository})
    : super(const SyncState.initial()) {
    on<_Start>((event, emit) {
      add(_PostDrafts());
      add(_PostMessages());
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

  Future _onPostDrafts(_PostDrafts event, Emitter<SyncState> emit) async {
    emit(_Syncing());
  }

  Future _onPostMessages(_PostMessages event, Emitter<SyncState> emit) async {
    emit(_Syncing());
    final forPost = await databaseRepository.getMessagesToPost();
    for (Message message in forPost) {
      late Message msg;
      late Map data;
      try {
        data = await apiRepository.createMessage(
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
        msg = Message.fromJson(data['message']);
        message.id = msg.id;
        if (msg.assets.isNotEmpty) {
          message.assets = msg.assets;
          message.syncType = SyncType.assets;
          await databaseRepository.updateMessage(message: message);
        } else {
          await _onMessageSuccess(message: message);
        }
        if (msg.assets.isNotEmpty) {
          add(_UploadMessageAssets());
        }
      } catch (e) {
        await _onMessageFailure(
          emit: emit,
          message: message,
          error: e.toString(),
        );
        return;
      }
    }
    emit(MessagesForPostSynced());
  }

  Future _onUploadMessageAssets(
    _UploadMessageAssets event,
    Emitter<SyncState> emit,
  ) async {
    try {
      emit(_Syncing());
      final forUpload = await databaseRepository.getMessagesToUploadAssets();
      for (Message message in forUpload) {
        List<dynamic> data = await apiRepository.generateUploadUrl(
          message: message,
        );
        for (var upload in data) {
          await apiRepository.uploadMessageAsset(
            name: upload['name'],
            url: upload['url'],
            onSendProgress: (_, _) {},
          );
        }
        List<String> assetIdList = await _getAssetIds(data);
        await apiRepository.messageAssetUploadComplete(
          assetIdList: assetIdList,
        );
        await _onMessageSuccess(message: message);
      }
      emit(MessagesForAssetUploadSynced());
    } catch (e) {
      emit(SyncFailure(error: e.toString()));
    }
  }

  Future _onPatchMessages(_PatchMessages event, Emitter<SyncState> emit) async {
    emit(_Syncing());
    final forPatch = await databaseRepository.getMessagesToPatch();
    for (Message message in forPatch) {
      try {
        await apiRepository.patchMessage(message: message);
        await _onMessageSuccess(message: message);
      } catch (e) {
        await _onMessageFailure(
          emit: emit,
          message: message,
          error: e.toString(),
        );
        return;
      }
    }
    emit(MessagesForPatchSynced());
  }

  Future _onDeleteMessages(
    _DeleteMessages event,
    Emitter<SyncState> emit,
  ) async {
    try {
      emit(_Syncing());
      final forDelete = await databaseRepository.getMessagesToDelete();
      for (Message message in forDelete) {
        await apiRepository.deleteMessage(message: message);
        await _onMessageSuccess(message: message);
      }
      emit(MessagesForDeleteSynced());
    } catch (e) {
      emit(SyncFailure(error: e.toString()));
    }
  }

  Future<List<String>> _getAssetIds(List uploads) async {
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

  Future _onMessageSuccess({required Message message}) async {
    message.syncStatus = SyncStatus.synced;
    message.syncType = null;
    await databaseRepository.updateMessage(message: message);
  }

  Future _onMessageFailure({
    required Emitter<SyncState> emit,
    required Message message,
    required String error,
  }) async {
    message.syncStatus = SyncStatus.failed;
    await databaseRepository.updateMessage(message: message);
    emit(SyncFailure(error: error.toString()));
  }

  final DatabaseRepository databaseRepository;
  final APIRepository apiRepository;
}
