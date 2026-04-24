part of 'direct_message_bloc.dart';

enum DirectMessageStatus {
  initial,
  uploadingMessages,
  uploadingAssets,
  verifyingAssets,
  success,
  failure,
}

final class DirectMessageState extends Equatable {
  const DirectMessageState({
    this.status = DirectMessageStatus.initial,
    this.chats = const [],
    this.uploads = const [],
    this.progress = '',
    this.error = '',
  });

  final DirectMessageStatus status;
  final List<Chat> chats;
  final List<Map<String, String>> uploads;
  final String progress;
  final String error;

  DirectMessageState copyWith({
    DirectMessageStatus? status,
    List<Chat>? chats,
    List<Map<String, String>>? uploads,
    String? progress,
    String? error,
  }) {
    return DirectMessageState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      uploads: uploads ?? this.uploads,
      progress: progress ?? this.progress,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return '''DirectMessageState { status: $status, chats: ${chats.length}, uploads: ${uploads.length}, progress: $progress, error: $error }''';
  }

  @override
  List<Object> get props => [status, chats, uploads, progress];
}

