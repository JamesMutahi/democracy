part of 'post_create_bloc.dart';

enum PostCreateStatus {
  initial,
  uploadingPost,
  uploadingAssets,
  verifyingAssets,
  success,
  failure,
}

final class PostCreateState extends Equatable {
  const PostCreateState({
    this.status = PostCreateStatus.initial,
    this.post,
    this.uploads = const [],
    this.progress = '',
    this.error = '',
  });

  final PostCreateStatus status;
  final Post? post;
  final List<Map<String, String>> uploads;
  final String progress;
  final String error;

  PostCreateState copyWith({
    PostCreateStatus? status,
    Post? post,
    List<Map<String, String>>? uploads,
    String? progress,
    String? error,
  }) {
    return PostCreateState(
      status: status ?? this.status,
      post: post ?? this.post,
      uploads: uploads ?? this.uploads,
      progress: progress ?? this.progress,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return '''PostCreateState { status: $status, post: ${post?.id}, uploads: ${uploads.length}, progress: $progress, error: $error }''';
  }

  @override
  List<Object> get props => [status, ?post, uploads, progress];
}
