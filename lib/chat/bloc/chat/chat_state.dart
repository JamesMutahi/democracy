part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, failure }

final class ChatState extends Equatable {
  const ChatState({this.status = ChatStatus.initial, this.chat, this.chatId});

  final ChatStatus status;
  final Chat? chat;
  final int? chatId;

  ChatState copyWith({ChatStatus? status, Chat? chat, int? chatId}) {
    return ChatState(
      status: status ?? this.status,
      chat: chat ?? this.chat,
      chatId: chatId ?? this.chatId,
    );
  }

  @override
  String toString() {
    return '''ChatState { status: $status, chat: $chat, chatId: $chatId }''';
  }

  @override
  List<Object?> get props => [status, chat, chatId];
}
