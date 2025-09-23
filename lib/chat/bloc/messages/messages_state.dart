part of 'messages_bloc.dart';

enum MessagesStatus { initial, loading, success, failure }

final class MessagesState extends Equatable {
  const MessagesState({
    this.status = MessagesStatus.initial,
    this.messages = const [],
    this.hasNext = false,
  });

  final MessagesStatus status;
  final List<Message> messages;
  final bool hasNext;

  MessagesState copyWith({
    MessagesStatus? status,
    List<Message>? messages,
    bool? hasNext,
  }) {
    return MessagesState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''MessagesState { status: $status, messages: ${messages.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, messages];
}
