part of 'sync_bloc.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState.initial() = _Initial;
  const factory SyncState.syncing() = _Syncing;
  const factory SyncState.draftsForPostSynced() = DraftsForPostSynced;
  const factory SyncState.messagesForPostSynced() = MessagesForPostSynced;
  const factory SyncState.messagesForAssetUploadSynced() =
      MessagesForAssetUploadSynced;
  const factory SyncState.messagesForPatchSynced() = MessagesForPatchSynced;
  const factory SyncState.messagesForDeleteSynced() = MessagesForDeleteSynced;
  const factory SyncState.failure({required String error}) = SyncFailure;
}
