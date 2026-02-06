part of 'for_you_bloc.dart';

enum ForYouStatus { initial, loading, success, failure }

final class ForYouState extends Equatable {
  const ForYouState({
    this.status = ForYouStatus.initial,
    this.posts = const [],
    this.hasNext = false,
  });

  final ForYouStatus status;
  final List<Post> posts;
  final bool hasNext;

  ForYouState copyWith({
    ForYouStatus? status,
    List<Post>? posts,
    bool? hasNext,
    bool? hasPrevious,
  }) {
    return ForYouState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''ForYouState { status: $status, posts: ${posts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
