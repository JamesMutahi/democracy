part of 'broadcast_detail_bloc.dart';

@freezed
class BroadcastDetailState with _$BroadcastDetailState {
  const factory BroadcastDetailState.initial() = BroadcastDetailInitial;

  const factory BroadcastDetailState.loading() = BroadcastDetailLoading;

  const factory BroadcastDetailState.created({required Broadcast broadcast}) =
      BroadcastCreated;

  const factory BroadcastDetailState.joined({required Broadcast broadcast}) =
      BroadcastJoined;

  const factory BroadcastDetailState.loaded({required Broadcast broadcast}) =
      BroadcastLoaded;

  const factory BroadcastDetailState.updated({required Broadcast broadcast}) =
      BroadcastUpdated;

  const factory BroadcastDetailState.deleted({required int broadcastId}) =
      BroadcastDeleted;

  const factory BroadcastDetailState.failure({required String error}) =
      BroadcastDetailFailure;
}
