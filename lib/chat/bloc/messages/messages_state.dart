part of 'messages_cubit.dart';

enum MessagesStatus { initial, loading, success, failure }

final class MessagesState extends Equatable {
  const MessagesState({
    this.status = MessagesStatus.initial,
    this.messages = const [],
    this.since,
    this.hasNext = false,
  });

  final MessagesStatus status;
  final List<Message> messages;
  final int? since;
  final bool hasNext;

  MessagesState copyWith({
    MessagesStatus? status,
    List<Message>? messages,
    int? since,
    bool? hasNext,
  }) {
    return MessagesState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      since: since ?? this.since,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''MessagesState { status: $status, messages: ${messages.length}, 
     since: $since, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, messages];
}
