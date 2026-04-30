import 'dart:convert';

import 'package:democracy/chat/models/message.dart';
import 'package:democracy/user/models/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Chat {
  @Id(assignable: true)
  int id = 0;
  String? usersJson;
  int unreadMessages = 0;
  final lastMessage = ToOne<Message>();

  // One-to-many relationship with all messages
  final messages = ToMany<Message>();

  @Transient()
  List<User> get users => usersJson != null
      ? (jsonDecode(usersJson!) as List<dynamic>)
            .map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList()
      : [];

  @Transient()
  set users(List<User> value) {
    usersJson = jsonEncode(value.map((e) => e.toJson()).toList());
  }

  Chat({required this.id, required this.unreadMessages, List<User>? users}) {
    if (users != null) this.users = users;
  }

  // ==================== JSON SERIALIZATION ====================

  factory Chat.fromJson(Map<String, dynamic> json) {
    final chat = Chat(
      id: json['id'],
      unreadMessages: json['unread_messages'] as int,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    // Note: lastMessage is a relation, so we usually don't restore it here
    return chat;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unread_messages': unreadMessages,
      'users': users.map((user) => user.toJson()).toList(),
      'last_message': lastMessage.target?.toJson(),
    };
  }
}
