part of 'messages_bloc.dart';

enum MessagesStatus { initial, success, failure }

final class MessagesState extends Equatable {
  const MessagesState({
    this.status = MessagesStatus.initial,
    this.messages = const [],
    this.hasNext = false,
    this.chatId,
  });

  final MessagesStatus status;
  final List<Message> messages;
  final bool hasNext;
  final int? chatId;

  MessagesState copyWith({
    MessagesStatus? status,
    List<Message>? messages,
    bool? hasNext,
    int? chatId,
  }) {
    return MessagesState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      hasNext: hasNext ?? this.hasNext,
      chatId: chatId ?? this.chatId,
    );
  }

  @override
  String toString() {
    return '''MessagesState { status: $status, messages: ${messages.length}, hasNext: $hasNext, chatId: $chatId }''';
  }

  @override
  List<Object> get props => [status, messages];
}
