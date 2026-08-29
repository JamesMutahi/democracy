part of 'comments_bloc.dart';

enum CommentsStatus { initial, loading, success, failure }

final class CommentsState extends Equatable {
  const CommentsState({
    this.status = CommentsStatus.initial,
    this.comments = const [],
    this.hasNext = false,
    this.broadcastId,
  });

  final CommentsStatus status;
  final List<Comment> comments;
  final bool hasNext;
  final int? broadcastId;

  CommentsState copyWith({
    CommentsStatus? status,
    List<Comment>? comments,
    bool? hasNext,
    int? broadcastId,
  }) {
    return CommentsState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      hasNext: hasNext ?? this.hasNext,
      broadcastId: broadcastId ?? this.broadcastId,
    );
  }

  @override
  String toString() {
    return '''CommentsState { status: $status, comments: ${comments.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, comments];
}
