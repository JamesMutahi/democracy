import 'package:democracy/user/models/user.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
sealed class Chat with _$Chat {
  const factory Chat({
    required final int id,
    required final List<User> users,
    @JsonKey(name: 'last_message') required final Message? lastMessage,
    @JsonKey(name: 'unread_messages') required final int unreadMessages,
  }) = _Chat;

  factory Chat.fromJson(Map<String, Object?> json) => _$ChatFromJson(json);
}
