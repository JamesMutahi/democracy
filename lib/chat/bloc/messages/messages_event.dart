part of 'messages_bloc.dart';

@freezed
sealed class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.get({
    required Chat chat,
    Message? oldestMessage,
    Message? newestMessage,
  }) = _Get;
  const factory MessagesEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory MessagesEvent.add({required Message message}) = _Add;
  const factory MessagesEvent.update({required Message message}) = _Update;
  const factory MessagesEvent.remove({required int messageId}) = _Remove;
}
