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

    final query = box
        .query(Message_.chat.equals(chatId))  // relation property
        .order(Message_.createdAt, flags: Order.descending) // newest first
        .build();

    final messages = query.find();
    query.close(); // Close queries to prevent memory leaks

    return messages;
  }

  Future<Message> createMessage({
    required int chatId,
    required Message message,
  }) async {
    final box = store.box<Message>();

    Message? existing;
    if (message.id != null && message.id! > 0) {
      existing = box.query(Message_.id.equals(message.id!)).build().findFirst();
    }
    existing ??= box
        .query(Message_.uuid.equals(message.uuid))
        .build()
        .findFirst();

    if (existing != null) {
      _mergeMessage(existing, message);
      // Ensure chat link
      if (existing.chat.targetId == 0) {
        existing.chat.targetId = chatId;
      }
      box.put(existing);
      return existing;
    }

    // New message
    message.chat.targetId = chatId;
    box.put(message);
    return message;
  }

  // Updated saveMessageData (used by list/pagination/WS)
  Future<void> saveMessageData(List<dynamic> jsonData) async {
    final box = store.box<Message>();
    for (var messageData in jsonData) {
      final message = Message.fromJson(messageData);

      Message? existing;
      if (message.id != null && message.id! > 0) {
        existing = box
            .query(Message_.id.equals(message.id!))
            .build()
            .findFirst();
      }
      existing ??= box
          .query(Message_.uuid.equals(message.uuid))
          .build()
          .findFirst();

      if (existing != null) {
        _mergeMessage(existing, message);
        // Ensure chat link
        if (existing.chat.targetId == 0 && messageData['chat'] != null) {
          existing.chat.targetId = messageData['chat'] as int;
        }
        box.put(existing);
      } else {
        if (messageData['chat'] != null) {
          message.chat.targetId = messageData['chat'] as int;
        }
        box.put(message);
      }
    }
  }

  // Helper to merge server/local data
  void _mergeMessage(Message target, Message source) {
    if (source.id != null && source.id! > 0) {
      target.id = source.id;
    }
    target.text = source.text;
    target.createdAt = source.createdAt;
    target.updatedAt = source.updatedAt;
    target.assets = source.assets;
    target.isRead = source.isRead;
    target.isDeleted = source.isDeleted;
    target.isEdited = source.isEdited;
    target.post = source.post;
    target.ballot = source.ballot;
    target.survey = source.survey;
    target.petition = source.petition;
    target.meeting = source.meeting;
  }

  Future<void> updateMessage({required Message message}) async {
    final messageBox = store.box<Message>();
    messageBox.put(message);
  }

  Future<void> deleteMessage({required Message message}) async {
    final box = store.box<Message>();
    box.remove(message.targetId);
  }

  Future<List<Message>> getMessagesToPost() async {
    final box = store.box<Message>();
    List<Message> messages = box
        .query(Message_.syncType.equals(SyncType.post))
        .build()
        .find();
    return messages;
  }

  Future<List<Message>> getMessagesToUploadAssets() async {
    final box = store.box<Message>();
    List<Message> messages = box
        .query(Message_.syncType.equals(SyncType.assets))
        .build()
        .find();
    return messages;
  }

  Future<List<Message>> getMessagesToPatch() async {
    final box = store.box<Message>();
    List<Message> messages = box
        .query(Message_.syncType.equals(SyncType.patch))
        .build()
        .find();
    return messages;
  }

  Future<List<Message>> getMessagesToDelete() async {
    final box = store.box<Message>();
    List<Message> messages = box
        .query(Message_.syncType.equals(SyncType.delete))
        .build()
        .find();
    return messages;
  }

  Future<void> clear() async {
    store.box<DraftPost>().removeAll();
    store.box<Chat>().removeAll();
    store.box<Message>().removeAll();
  }
}
