import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
sealed class Notification with _$Notification {
  const factory Notification({
    required final int id,
    required final String text,
    @JsonKey(name: 'is_read') required final bool isRead,
    required final Post? post,
    required final Poll? poll,
    required final Survey? survey,
    required final Chat? chat,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, Object?> json) =>
      _$NotificationFromJson(json);
}
