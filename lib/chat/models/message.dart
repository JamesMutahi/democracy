import 'package:democracy/user/models/user.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
sealed class Message with _$Message {
  const factory Message({
    required final int id,
    required final int chat,
    required final User user,
    required final String text,
    required final Post? post,
    required final Poll? poll,
    required final Survey? survey,
    @JsonKey(name: 'is_read') required final bool isRead,
    @JsonKey(name: 'is_edited') required final bool isEdited,
    @JsonKey(name: 'is_deleted') required final bool isDeleted,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);
}
