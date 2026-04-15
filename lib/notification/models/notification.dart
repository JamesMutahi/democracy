import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
sealed class Notification with _$Notification {
  const factory Notification({
    required final int id,
    required final String text,
    required final List<User> users,
    @JsonKey(name: 'is_like') required final bool isLike,
    @JsonKey(name: 'is_follow') required final bool isFollow,
    @JsonKey(name: 'is_support') required final bool isSupport,
    required final Post? post,
    required final Ballot? ballot,
    required final Survey? survey,
    required final Petition? petition,
    required final Meeting? meeting,
    required final Chat? chat,
    @JsonKey(name: 'is_read') required final bool isRead,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, Object?> json) =>
      _$NotificationFromJson(json);
}
