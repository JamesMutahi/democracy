part of 'quotes_bloc.dart';

enum QuotesStatus { initial, loading, success, failure }

final class QuotesState extends Equatable {
  const QuotesState({
    this.status = QuotesStatus.initial,
    this.posts = const [],
    this.postId,
    this.hasNext = false,
  });

  final QuotesStatus status;
  final List<Post> posts;
  final int? postId;
  final bool hasNext;

  QuotesState copyWith({
    QuotesStatus? status,
    List<Post>? posts,
    int? postId,
    bool? hasNext,
  }) {
    return QuotesState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      postId: postId ?? this.postId,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''QuotesState { status: $status, posts: ${posts.length}, postId: $postId, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
