part of 'message_detail_bloc.dart';

@freezed
class MessageDetailState with _$MessageDetailState {
  const factory MessageDetailState.initial() = MessageDetailInitial;

  const factory MessageDetailState.loading() = MessageDetailLoading;

  const factory MessageDetailState.createdInDB({required Message message}) =
      MessageCreatedInDB;

  const factory MessageDetailState.updatedInDB({required Message message}) =
      MessageUpdatedInDB;

  const factory MessageDetailState.deletedInDB({required Message message}) =
      MessageDeletedInDB;

  const factory MessageDetailState.created({required Message message}) =
      MessageCreated;

  const factory MessageDetailState.updated({required Message message}) =
      MessageUpdated;

  const factory MessageDetailState.deleted({required Message message}) =
      MessageDeleted;

  const factory MessageDetailState.failure({required String error}) =
      MessageDetailFailure;
}
