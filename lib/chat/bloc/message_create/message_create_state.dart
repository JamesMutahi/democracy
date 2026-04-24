part of 'message_create_bloc.dart';

enum MessageCreateStatus { initial, loading, success, failure }

final class MessageCreateState extends Equatable {
  const MessageCreateState({
    this.status = MessageCreateStatus.initial,
    this.message,
    this.uploads = const [],
    this.progress = '',
    this.error = '',
  });

  final MessageCreateStatus status;
  final Message? message;
  final List<Map<String, String>> uploads;
  final String progress;
  final String error;

  MessageCreateState copyWith({
    MessageCreateStatus? status,
    Message? message,
    List<Map<String, String>>? uploads,
    String? progress,
    String? error,
  }) {
    return MessageCreateState(
      status: status ?? this.status,
      message: message ?? this.message,
      uploads: uploads ?? this.uploads,
      progress: progress ?? this.progress,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return '''MessageCreateState { status: $status, message: ${message?.id}, uploads: ${uploads.length}, progress: $progress, error: $error }''';
  }

  @override
  List<Object> get props => [status, ?message, uploads, progress];
}
