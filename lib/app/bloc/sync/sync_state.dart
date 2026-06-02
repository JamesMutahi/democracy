part of 'sync_bloc.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState.initial() = _Initial;
  const factory SyncState.syncing() = _Syncing;
  const factory SyncState.draftSynced({required DraftPost draft}) = DraftSynced;
  const factory SyncState.messageSynced({required Message message}) =
      MessageSynced;
  const factory SyncState.failure({required String error}) = SyncFailure;
}
