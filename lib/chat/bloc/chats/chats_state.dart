part of 'chats_bloc.dart';

enum ChatsStatus { initial, loading, success, failure }

final class ChatsState extends Equatable {
  const ChatsState({
    this.status = ChatsStatus.initial,
    this.chats = const [],
    this.hasNext = false,
  });

  final ChatsStatus status;
  final List<Chat> chats;
  final bool hasNext;

  ChatsState copyWith({ChatsStatus? status, List<Chat>? chats, bool? hasNext}) {
    return ChatsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''ChatsState { status: $status, chats: ${chats.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, chats];
}
