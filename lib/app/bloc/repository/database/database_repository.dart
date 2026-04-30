import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/objectbox.g.dart';
import 'package:democracy/post/models/draft_post.dart';

class DatabaseRepository {
  final Store store;

  DatabaseRepository({required this.store});

  Future<List<DraftPost>> fetchDrafts() async {
    final box = store.box<DraftPost>();
    return box.getAll();
  }

  Future<int> saveDraft({required DraftPost draft}) async {
    final box = store.box<DraftPost>();
    return box.put(draft);
  }

  Future<DraftPost> getDraft({required int id}) async {
    final box = store.box<DraftPost>();
    final draft = box.get(id);
    if (draft == null) {
      throw Exception("Draft with ID $id not found.");
    }
    return draft;
  }

  Future<void> deleteDraft({required DraftPost draft}) async {
    final box = store.box<DraftPost>();
    box.remove(draft.id);
  }

  Future<List<Chat>> fetchChats() async {
    final box = store.box<Chat>();
    return box.getAll();
  }

  Future saveChatsData(List<dynamic> jsonData) async {
    final boxChat = store.box<Chat>();
    final boxMessage = store.box<Message>();
    for (var chatData in jsonData) {
      final chat = Chat.fromJson(chatData);

      // Handle last_message
      if (chatData['last_message'] != null) {
        final lastMsgJson = chatData['last_message'] as Map<String, dynamic>;
        Message lastMessage = Message.fromJson(lastMsgJson);
        Message? existing = boxMessage
            .query(Message_.id.equals(lastMessage.id!))
            .build()
            .findFirst();
        // Link the message to this chat
        if (existing == null) {
          lastMessage.chat.target = chat;
          final targetId = boxMessage.put(lastMessage);
          chat.lastMessage.targetId = targetId;
        } else {
          chat.lastMessage.targetId = existing.targetId;
        }
      }
      boxChat.put(chat);
    }
  }

  Future<Chat> saveChat(Map<String, dynamic> jsonData) async {
    final boxChat = store.box<Chat>();
    final boxMessage = store.box<Message>();

    final chat = Chat.fromJson(jsonData);

    // Handle last_message
    if (jsonData['last_message'] != null) {
      final lastMsgJson = jsonData['last_message'] as Map<String, dynamic>;
      Message lastMessage = Message.fromJson(lastMsgJson);
      Message? existing = boxMessage
          .query(Message_.id.equals(lastMessage.id!))
          .build()
          .findFirst();
      // Link the message to this chat
      if (existing == null) {
        lastMessage.chat.target = chat;
        final targetId = boxMessage.put(lastMessage);
        chat.lastMessage.targetId = targetId;
      } else {
        chat.lastMessage.targetId = existing.targetId;
      }
    }
    int id = boxChat.put(chat);
    return boxChat.get(id)!;
  }

  Future<void> deleteChat({required int id}) async {
    final chatBox = store.box<Chat>();
    final messageBox = store.box<Message>();
    final chat = chatBox.get(id);
    messageBox.removeMany(chat!.messages.map((m) => m.targetId).toList());
    chatBox.remove(id);
  }

  Future<Message?> getMessage({required int id}) async {
    final box = store.box<Message>();
    final query = box.query(Message_.id.equals(id)).build();
    final message = query.findFirst();
    query.close();
    return message;
  }

  Future<List<Message>> fetchMessages({required int chatId}) async {
    final box = store.box<Message>();
    return box.getAll();
  }

  Future<Message> createMessage({
    required int chatId,
    required Message message,
  }) async {
    final box = store.box<Message>();
    message.chat.targetId = chatId;
    box.put(message);
    return message;
  }

  Future<void> saveMessageData(List<dynamic> jsonData) async {
    final boxMessage = store.box<Message>();
    for (var messageData in jsonData) {
      final message = Message.fromJson(messageData);
      Message? existing = boxMessage
          .query(Message_.id.equals(message.id!))
          .build()
          .findFirst();
      if (existing == null) {
        message.chat.targetId = messageData['chat'];
        boxMessage.put(message);
      } else {
        existing.text = message.text;
        boxMessage.put(existing);
      }
    }
  }

  Future<void> updateMessage({required Message message}) async {
    //   TODO
  }

  Future<void> deleteMessage({required Message message}) async {
    //   TODO
  }

  Future<void> clear() async {
    store.box<DraftPost>().removeAll();
    store.box<Chat>().removeAll();
    store.box<Message>().removeAll();
  }
}
