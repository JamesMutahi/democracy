part of 'posts_bloc.dart';

enum PostsStatus { initial, loading, success, failure }

final class PostsState extends Equatable {
  const PostsState({
    this.status = PostsStatus.initial,
    this.searchTerm = '',
    this.sortBy = '',
    this.posts = const [],
    this.hasNext = false,
  });

  final PostsStatus status;
  final String searchTerm;
  final String sortBy;
  final List<Post> posts;
  final bool hasNext;

  PostsState copyWith({
    PostsStatus? status,
    String? searchTerm,
    String? sortBy,
    List<Post>? posts,
    bool? hasNext,
  }) {
    return PostsState(
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      sortBy: sortBy ?? this.sortBy,
      posts: posts ?? this.posts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''PostsState { status: $status, searchTerm: $searchTerm, sortBy: $sortBy, posts: ${posts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
