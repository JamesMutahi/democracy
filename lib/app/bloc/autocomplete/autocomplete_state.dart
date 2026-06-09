part of 'autocomplete_bloc.dart';

enum AutocompleteStatus { initial, loading, success, failure }

enum AutocompleteResultType { hashtag, word, user }

final class AutocompleteState extends Equatable {
  const AutocompleteState({
    this.status = AutocompleteStatus.initial,
    this.searchTerm = '',
    this.hashtags = const [],
    this.words = const [],
    this.users = const [],
  });

  final AutocompleteStatus status;
  final String searchTerm; // Used on redo event; also for bloc build when
  final List<String> hashtags;
  final List<String> words;
  final List<AutocompleteUser> users;

  AutocompleteState copyWith({
    AutocompleteStatus? status,
    String? searchTerm,
    List<String>? hashtags,
    List<String>? words,
    List<AutocompleteUser>? users,
    int? postId,
  }) {
    return AutocompleteState(
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      hashtags: hashtags ?? this.hashtags,
      words: words ?? this.words,
      users: users ?? this.users,
    );
  }

  @override
  String toString() {
    return '''AutocompleteState { status: $status, searchTerm: $searchTerm, hashtags: $hashtags, words: $words, users: $users }''';
  }

  @override
  List<Object?> get props => [status, hashtags, words, users];
}
