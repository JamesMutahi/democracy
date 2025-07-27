part of 'chats_cubit.dart';

enum ChatsStatus { initial, loading, success, failure }

final class ChatsState extends Equatable {
  const ChatsState({
    this.status = ChatsStatus.initial,
    this.chats = const [],
    this.currentPage = 1,
    this.hasNext = false,
  });

  final ChatsStatus status;
  final List<Chat> chats;
  final int currentPage;
  final bool hasNext;

  ChatsState copyWith({
    ChatsStatus? status,
    List<Chat>? chats,
    int? currentPage,
    bool? hasNext,
  }) {
    return ChatsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''ChatsState { status: $status, chats: ${chats.length}, 
    currentPage: $currentPage, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, chats];
}
