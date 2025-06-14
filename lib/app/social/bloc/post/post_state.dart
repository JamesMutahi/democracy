part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

final class PostState extends Equatable {
  const PostState({this.status = PostStatus.initial, this.message = const {}});

  final PostStatus status;
  final Map<String, dynamic> message;

  PostState copyWith({PostStatus? status, Map<String, dynamic>? message}) {
    return PostState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, message: $message }''';
  }

  @override
  List<Object> get props => [status, message];
}
