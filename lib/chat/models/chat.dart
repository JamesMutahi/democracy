import 'dart:convert';

import 'package:democracy/chat/models/message.dart';
import 'package:democracy/user/models/user.dart';
import 'package:hive_ce/hive_ce.dart';

part 'chat.g.dart';

@HiveType(typeId: 60)
class Chat extends HiveObject {
  @HiveField(0)
  int id = 0;

  @HiveField(1)
  String? usersJson;

  @HiveField(2)
  int unreadMessages = 0;

  @HiveField(3)
  Message? lastMessage;

  // ==================== COMPUTED PROPERTIES ====================

  List<User> get users => usersJson != null
      ? (jsonDecode(usersJson!) as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList()
      : [];

  set users(List<User> value) {
    usersJson = jsonEncode(value.map((e) => e.toJson()).toList());
  }

  Chat({
    required this.id,
    required this.unreadMessages,
    List<User>? users,
    Message? lastMessage,
  }) {
    if (users != null) this.users = users;
    if (lastMessage != null) this.lastMessage = lastMessage;
  }

  // ==================== JSON SERIALIZATION ====================

  factory Chat.fromJson(Map<String, dynamic> json) {
    final chat = Chat(
      id: json['id'],
      unreadMessages: json['unread_messages'] ?? 0,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return chat;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unread_messages': unreadMessages,
      'users': users.map((user) => user.toJson()).toList(),
      'last_message': lastMessage?.toJson(),
    };
  }
}