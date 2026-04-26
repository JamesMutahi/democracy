part of 'draft_posts_bloc.dart';

enum DraftPostsStatus { initial, loading, success, failure }

final class DraftPostsState extends Equatable {
  const DraftPostsState({
    this.status = DraftPostsStatus.initial,
    this.drafts = const [],
  });

  final DraftPostsStatus status;
  final List<DraftPost> drafts;

  DraftPostsState copyWith({
    DraftPostsStatus? status,
    List<DraftPost>? drafts,
  }) {
    return DraftPostsState(
      status: status ?? this.status,
      drafts: drafts ?? this.drafts,
    );
  }

  @override
  String toString() {
    return '''PostsState { status: $status, drafts: ${drafts.length} }''';
  }

  @override
  List<Object> get props => [status, drafts];
}
