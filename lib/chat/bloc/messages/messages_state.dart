part of 'messages_cubit.dart';

enum MessagesStatus { initial, loading, success, failure }

final class MessagesState extends Equatable {
  const MessagesState({
    this.status = MessagesStatus.initial,
    this.messages = const [],
    this.currentPage = 1,
    this.hasNext = false,
  });

  final MessagesStatus status;
  final List<Message> messages;
  final int currentPage;
  final bool hasNext;

  MessagesState copyWith({
    MessagesStatus? status,
    List<Message>? messages,
    int? currentPage,
    bool? hasNext,
  }) {
    return MessagesState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''MessagesState { status: $status, messages: ${messages.length}, 
     currentPage: $currentPage, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, messages];
}
