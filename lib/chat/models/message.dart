import 'package:democracy/auth/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
sealed class Message with _$Message {
  const factory Message({
    required final int id,
    required final int room,
    required final User user,
    required final String text,
    @JsonKey(name: 'is_read') required final bool isRead,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);
}
