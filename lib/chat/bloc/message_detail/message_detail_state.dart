part of 'message_detail_cubit.dart';

@freezed
class MessageDetailState with _$MessageDetailState {
  const factory MessageDetailState.initial() = MessageDetailInitial;
  const factory MessageDetailState.loading() = MessageDetailLoading;
  const factory MessageDetailState.created({required Message message}) =
      MessageCreated;
  const factory MessageDetailState.updated({required Message message}) =
      MessageUpdated;
  const factory MessageDetailState.deleted({required int messageId}) =
      MessageDeleted;
  const factory MessageDetailState.failure({required String error}) =
      MessageDetailFailure;
}
