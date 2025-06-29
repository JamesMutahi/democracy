part of 'chats_cubit.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState.initial() = ChatsInitial;
  const factory ChatsState.loading() = ChatsLoading;
  const factory ChatsState.loaded({required List<Chat> chats}) = ChatsLoaded;
  const factory ChatsState.failure({required String error}) = ChatsFailure;
}
