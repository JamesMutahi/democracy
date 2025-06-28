part of 'message_actions_cubit.dart';

enum MessageActionsStatus {
  initial,
  loading,
  actionButtonsOpened,
  actionButtonsClosed,
}

final class MessageActionsState extends Equatable {
  const MessageActionsState({
    this.status = MessageActionsStatus.initial,
    this.messages = const <Message>{},
  });

  final MessageActionsStatus status;
  final Set<Message> messages;

  MessageActionsState copyWith({
    MessageActionsStatus? status,
    Set<Message>? messages,
  }) {
    return MessageActionsState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
    );
  }

  @override
  String toString() {
    return '''MessageActionsState { status: $status, messages: ${messages.length} }''';
  }

  @override
  List<Object> get props => [status, messages];
}
