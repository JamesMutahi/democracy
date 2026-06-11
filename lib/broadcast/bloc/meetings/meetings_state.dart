part of 'meetings_bloc.dart';

enum MeetingsStatus { initial, loading, success, failure }

final class MeetingsState extends Equatable {
  const MeetingsState({
    this.status = MeetingsStatus.initial,
    this.searchTerm = '',
    this.broadcasts = const [],
    this.hasNext = false,
  });

  final MeetingsStatus status;
  final String searchTerm;
  final List<Broadcast> broadcasts;
  final bool hasNext;

  MeetingsState copyWith({
    MeetingsStatus? status,
    String? searchTerm,
    List<Broadcast>? broadcasts,
    bool? hasNext,
  }) {
    return MeetingsState(
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      broadcasts: broadcasts ?? this.broadcasts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''MeetingsState { status: $status, searchTerm: $searchTerm, broadcasts: ${broadcasts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, broadcasts];
}
