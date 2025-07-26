part of 'messages_cubit.dart';

enum MessagesStatus { initial, success, failure }

final class MessagesState extends Equatable {
  const MessagesState({
    this.status = MessagesStatus.initial,
    this.messages = const [],
    this.hasReachedMax = false,
  });

  final MessagesStatus status;
  final List<Message> messages;
  final bool hasReachedMax;

  MessagesState copyWith({
    MessagesStatus? status,
    List<Message>? messages,
    bool? hasReachedMax,
  }) {
    return MessagesState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''MessagesState { status: $status, messages: ${messages.length}, 
    hasReachedMax: $hasReachedMax }''';
  }

  @override
  List<Object> get props => [status, messages];
}
