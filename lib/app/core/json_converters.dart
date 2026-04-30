import 'package:democracy/chat/models/chat.dart';
import 'package:json_annotation/json_annotation.dart';

class ChatConverter implements JsonConverter<Chat?, Map<String, dynamic>?> {
  const ChatConverter();

  @override
  Chat? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return Chat.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(Chat? chat) {
    return chat?.toJson();
  }
}