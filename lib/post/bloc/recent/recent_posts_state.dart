part of 'recent_posts_bloc.dart';

enum RecentPostsStatus { initial, loading, success, failure }

final class RecentPostsState extends Equatable {
  const RecentPostsState({
    this.status = RecentPostsStatus.initial,
    this.searchTerm = '',
    this.posts = const [],
    this.hasNext = false,
  });

  final RecentPostsStatus status;
  final String searchTerm;
  final List<Post> posts;
  final bool hasNext;

  RecentPostsState copyWith({
    RecentPostsStatus? status,
    String? searchTerm,
    List<Post>? posts,
    bool? hasNext,
  }) {
    return RecentPostsState(
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      posts: posts ?? this.posts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''RecentPostsState { status: $status, searchTerm: $searchTerm, posts: ${posts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}

