part of 'hashtags_bloc.dart';

enum HashtagsStatus { initial, loading, success, failure }

final class HashtagsState extends Equatable {
  const HashtagsState({
    this.status = HashtagsStatus.initial,
    this.hashtags = const [],
    this.searchTerm = '',
  });

  final HashtagsStatus status;
  final List<String> hashtags;
  final String searchTerm;

  HashtagsState copyWith({
    HashtagsStatus? status,
    List<String>? hashtags,
    String? searchTerm,
  }) {
    return HashtagsState(
      status: status ?? this.status,
      hashtags: hashtags ?? this.hashtags,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  String toString() {
    return '''HashtagsState { status: $status, hashtags: $hashtags, searchTerm: $searchTerm }''';
  }

  @override
  List<Object> get props => [status, hashtags, searchTerm];
}
