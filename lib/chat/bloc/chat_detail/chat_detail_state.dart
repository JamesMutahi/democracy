part of 'chat_detail_cubit.dart';

@freezed
class ChatDetailState with _$ChatDetailState {
  const factory ChatDetailState.initial() = ChatDetailInitial;
  const factory ChatDetailState.loading() = ChatDetailLoading;
  const factory ChatDetailState.chatCreated({required Chat chat}) = ChatCreated;
  const factory ChatDetailState.messageCreated({required Message message}) =
      MessageCreated;
  const factory ChatDetailState.messageUpdated({required Message message}) =
      MessageUpdated;
  const factory ChatDetailState.messageDeleted({required Message message}) =
      MessageDeleted;
  const factory ChatDetailState.markedAsRead({
    required List<Message> messages,
  }) = MarkedAsRead;
  const factory ChatDetailState.failure() = ChatDetailFailure;
}
