part of 'chat_detail_cubit.dart';

@freezed
class ChatDetailState with _$ChatDetailState {
  const factory ChatDetailState.initial() = ChatDetailInitial;
  const factory ChatDetailState.loading() = ChatDetailLoading;
  const factory ChatDetailState.created({required Chat chat}) = ChatCreated;
  const factory ChatDetailState.updated({required Chat chat}) = ChatUpdated;
  const factory ChatDetailState.directMessageSent() = DirectMessageSent;
  const factory ChatDetailState.failure({required String error}) =
      ChatDetailFailure;
}
