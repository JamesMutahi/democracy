part of 'chats_cubit.dart';

enum ChatsStatus { initial, loading, success, failure }

final class ChatsState extends Equatable {
  const ChatsState({
    this.status = ChatsStatus.initial,
    this.chats = const [],
    this.since,
    this.hasNext = false,
  });

  final ChatsStatus status;
  final List<Chat> chats;
  final int? since;
  final bool hasNext;

  ChatsState copyWith({
    ChatsStatus? status,
    List<Chat>? chats,
    int? since,
    bool? hasNext,
  }) {
    return ChatsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      since: since ?? this.since,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''ChatsState { status: $status, chats: ${chats.length}, 
    since: $since, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, chats];
}
