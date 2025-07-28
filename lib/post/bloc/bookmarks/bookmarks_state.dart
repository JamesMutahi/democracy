part of 'bookmarks_cubit.dart';

enum BookmarksStatus { initial, loading, success, failure }

final class BookmarksState extends Equatable {
  const BookmarksState({
    this.status = BookmarksStatus.initial,
    this.posts = const [],
    this.hasNext = false,
  });

  final BookmarksStatus status;
  final List<Post> posts;
  final bool hasNext;

  BookmarksState copyWith({
    BookmarksStatus? status,
    List<Post>? posts,
    bool? hasNext,
  }) {
    return BookmarksState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''BookmarksState { status: $status, posts: ${posts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
