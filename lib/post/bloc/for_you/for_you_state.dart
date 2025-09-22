part of 'for_you_bloc.dart';

enum ForYouStatus { initial, loading, success, failure }

final class ForYouState extends Equatable {
  const ForYouState({
    this.status = ForYouStatus.initial,
    this.posts = const [],
    this.currentPage = 1,
    this.hasNext = false,
  });

  final ForYouStatus status;
  final List<Post> posts;
  final int currentPage;
  final bool hasNext;

  ForYouState copyWith({
    ForYouStatus? status,
    List<Post>? posts,
    int? currentPage,
    bool? hasNext,
    bool? hasPrevious,
  }) {
    return ForYouState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''ForYouState { status: $status, posts: ${posts.length}, 
    currentPage: $currentPage, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
