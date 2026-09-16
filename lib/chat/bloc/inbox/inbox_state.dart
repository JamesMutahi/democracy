part of 'inbox_bloc.dart';

enum InboxStatus { initial, loading, success, failure }

final class InboxState extends Equatable {
  const InboxState({
    this.status = InboxStatus.initial,
    this.chats = const [],
    this.hasNext = false,
    this.searchTerm = '',
  });

  final InboxStatus status;
  final List<Chat> chats;
  final bool hasNext;
  final String searchTerm;

  InboxState copyWith({
    InboxStatus? status,
    List<Chat>? chats,
    bool? hasNext,
    String? searchTerm,
  }) {
    return InboxState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      hasNext: hasNext ?? this.hasNext,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  String toString() {
    return '''InboxState { status: $status, chats: ${chats.length}, hasNext: $hasNext, searchTerm: $searchTerm }''';
  }

  @override
  List<Object?> get props => [status, chats, searchTerm];
}
