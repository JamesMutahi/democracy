part of 'post_list_cubit.dart';

enum PostListStatus { initial, loading, success, failure }

final class PostListState extends Equatable {
  const PostListState({
    this.status = PostListStatus.initial,
    this.posts = const [],
    this.currentPage = 1,
    this.hasNext = false,
    this.hasPrevious = false,
  });

  final PostListStatus status;
  final List<Post> posts;
  final int currentPage;
  final bool hasNext;
  final bool hasPrevious;

  PostListState copyWith({
    PostListStatus? status,
    List<Post>? posts,
    int? currentPage,
    bool? hasNext,
    bool? hasPrevious,
  }) {
    return PostListState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
      hasPrevious: hasPrevious ?? this.hasPrevious,
    );
  }

  @override
  String toString() {
    return '''PostListState { status: $status, posts: ${posts.length}, 
    currentPage: $currentPage, hasNext: $hasNext, hasPrevious: $hasPrevious }''';
  }

  @override
  List<Object> get props => [status, posts];
}
