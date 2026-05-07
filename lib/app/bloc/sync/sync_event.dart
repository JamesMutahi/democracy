part of 'sync_bloc.dart';

@freezed
class SyncEvent with _$SyncEvent {
  const factory SyncEvent.start() = _Start;
  const factory SyncEvent.postDrafts() = _PostDrafts;
  const factory SyncEvent.postMessages() = _PostMessages;
  const factory SyncEvent.uploadMessageAssets() = _UploadMessageAssets;
  const factory SyncEvent.patchMessages() = _PatchMessages;
  const factory SyncEvent.deleteMessages() = _DeleteMessages;
}
