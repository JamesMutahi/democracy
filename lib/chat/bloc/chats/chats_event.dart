part of 'chats_bloc.dart';

@freezed
sealed class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.get({String? searchTerm, Chat? lastChat}) = _Get;
  const factory ChatsEvent.received({required Map<String, dynamic> payload}) =
      _Received;
  const factory ChatsEvent.update({required Chat chat}) = _Update;
  const factory ChatsEvent.remove({required int chatId}) = _Remove;
  const factory ChatsEvent.updateMultiple({required List<Chat> chats}) =
      _UpdateMultiple;
}
