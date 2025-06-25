import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
sealed class Room with _$Room {
  const factory Room({
    required final int id,
    required final List<User> users,
    @JsonKey(name: 'last_message') required final Message? lastMessage,
  }) = _Room;

  factory Room.fromJson(Map<String, Object?> json) => _$RoomFromJson(json);
}
