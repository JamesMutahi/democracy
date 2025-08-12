part of 'chat_detail_cubit.dart';

@freezed
class ChatDetailState with _$ChatDetailState {
  const factory ChatDetailState.initial() = ChatDetailInitial;
  const factory ChatDetailState.loading() = ChatDetailLoading;
  const factory ChatDetailState.created({
    required Chat chat,
    required int userId,
  }) = ChatCreated;
  const factory ChatDetailState.loaded({required Chat chat}) = ChatLoaded;
  const factory ChatDetailState.updated({required Chat chat}) = ChatUpdated;
  const factory ChatDetailState.deleted({required int chatId}) = ChatDeleted;
  const factory ChatDetailState.directMessageSent({required List<Chat> chats}) =
      DirectMessageSent;
  const factory ChatDetailState.failure({required String error}) =
      ChatDetailFailure;
}
