part of 'community_notes_bloc.dart';

enum CommunityNotesStatus { initial, loading, success, failure }

final class CommunityNotesState extends Equatable {
  const CommunityNotesState({
    this.status = CommunityNotesStatus.initial,
    this.communityNotes = const [],
    this.postId,
    this.hasNext = false,
  });

  final CommunityNotesStatus status;
  final List<Post> communityNotes;
  final int? postId;
  final bool hasNext;

  CommunityNotesState copyWith({
    CommunityNotesStatus? status,
    List<Post>? communityNotes,
    int? postId,
    bool? hasNext,
  }) {
    return CommunityNotesState(
      status: status ?? this.status,
      communityNotes: communityNotes ?? this.communityNotes,
      postId: postId ?? this.postId,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''CommunityNotesState { status: $status, communityNotes: ${communityNotes.length}, postId: $postId, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, communityNotes];
}
