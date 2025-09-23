part of 'messages_bloc.dart';

@freezed
sealed class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.get({required Chat chat, Message? lastMessage}) =
      _Get;
  const factory MessagesEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
