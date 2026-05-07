part of 'sync_bloc.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState.initial() = _Initial;
  const factory SyncState.syncing() = _Syncing;
  const factory SyncState.draftsSynced() = DraftsSynced;
  const factory SyncState.postMessagesSynced() = PostMessagesSynced;
  const factory SyncState.assetUploadMessagesSynced() =
      AssetUploadMessagesSynced;
  const factory SyncState.patchMessagesSynced() = PatchMessagesSynced;
  const factory SyncState.deleteMessagesSynced() = DeleteMessagesSynced;
  const factory SyncState.failure({required String error}) = SyncFailure;
}
