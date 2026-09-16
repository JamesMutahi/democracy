part of 'requests_bloc.dart';

enum RequestsStatus { initial, loading, success, failure }

final class RequestsState extends Equatable {
  const RequestsState({
    this.status = RequestsStatus.initial,
    this.chats = const [],
    this.hasNext = false,
    this.searchTerm = '',
  });

  final RequestsStatus status;
  final List<Chat> chats;
  final bool hasNext;
  final String searchTerm;

  RequestsState copyWith({
    RequestsStatus? status,
    List<Chat>? chats,
    bool? hasNext,
    String? searchTerm,
  }) {
    return RequestsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      hasNext: hasNext ?? this.hasNext,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  String toString() {
    return '''RequestsState { status: $status, chats: ${chats.length}, hasNext: $hasNext, searchTerm: $searchTerm }''';
  }

  @override
  List<Object?> get props => [status, chats, searchTerm];
}
