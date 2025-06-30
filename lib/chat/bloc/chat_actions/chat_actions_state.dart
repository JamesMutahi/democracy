part of 'chat_actions_cubit.dart';

enum ChatActionsStatus { loading, actionButtonsOpened, actionButtonsClosed }

final class ChatActionsState extends Equatable {
  const ChatActionsState({
    this.status = ChatActionsStatus.actionButtonsClosed,
    this.chats = const <Chat>{},
  });

  final ChatActionsStatus status;
  final Set<Chat> chats;

  ChatActionsState copyWith({ChatActionsStatus? status, Set<Chat>? chats}) {
    return ChatActionsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
    );
  }

  @override
  String toString() {
    return '''ChatActionsState { status: $status, chats: ${chats.length} }''';
  }

  @override
  List<Object> get props => [status, chats];
}
