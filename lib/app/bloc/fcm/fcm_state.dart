part of 'fcm_bloc.dart';

enum FcmStatus {
  initial,
  permissionDenied,
  noToken,
  ready,
  failure,
  notificationTapped,
}

final class FcmState extends Equatable {
  const FcmState({
    this.status = FcmStatus.initial,
    this.token,
    this.lastMessage,
    this.lastTappedMessage,
  });

  final FcmStatus status;
  final String? token;
  final RemoteMessage? lastMessage;
  final RemoteMessage? lastTappedMessage;

  FcmState copyWith({
    FcmStatus? status,
    String? token,
    RemoteMessage? lastMessage,
    RemoteMessage? lastTappedMessage,
  }) {
    return FcmState(
      status: status ?? this.status,
      token: token ?? this.token,
      lastMessage: lastMessage ?? this.lastMessage,
      lastTappedMessage: lastTappedMessage ?? this.lastTappedMessage,
    );
  }

  @override
  String toString() {
    return '''FcmState { status: $status, token: $token, lastMessage: $lastMessage, lastTappedMessage: $lastTappedMessage }''';
  }

  @override
  List<Object?> get props => [status, token, lastMessage, lastTappedMessage];
}
