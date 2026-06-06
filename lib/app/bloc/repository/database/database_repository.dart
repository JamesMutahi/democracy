import 'package:democracy/app/bloc/sync/sync_bloc.dart' show SyncType;
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';

import 'package:democracy/post/models/draft_post.dart';
import 'package:hive_ce/hive_ce.dart';

class DatabaseRepository {
  DatabaseRepository();

  // ==================== HELPERS ====================

  Future<Box<DraftPost>> get _draftBox => Hive.openBox<DraftPost>('drafts');
  Future<Box<Chat>> get _chatBox => Hive.openBox<Chat>('chats');
  Future<Box<Message>> get _messageBox => Hive.openBox<Message>('messages');

  // ==================== DRAFT POSTS ====================

  Future<List<DraftPost>> fetchDrafts() async {
    final box = await _draftBox;
    return box.values.toList();
  }

  Future<int> createDraft({required DraftPost draft}) async {
    final box = await _draftBox;
    return await box.add(draft);
  }

  Future<void> updateDraft({required DraftPost draft}) async {
    final box = await _draftBox;
    await box.put(draft.key, draft);
  }

  Future<DraftPost?> getDraft({required int id}) async {
    final box = await _draftBox;
    final draft = box.get(id);
    return draft;
  }

  Future<List<DraftPost>> getDraftsToPost() async {
    final box = await _draftBox;
    return box.values
        .where((draft) => draft.syncType == SyncType.post)
        .toList();
  }

  Future<List<DraftPost>> getDraftsToUploadAssets() async {
    final box = await _draftBox;
    return box.values
        .where((draft) => draft.syncType == SyncType.assets)
        .toList();
  }

  Future<void> deleteDraft({required DraftPost draft}) async {
    final box = await _draftBox;
    await box.delete(draft.key);
  }

  // ==================== CHATS ====================

  Future<List<Chat>> fetchChats() async {
    final box = await _chatBox;
    return box.values.toList();
  }

  Future<Chat> saveChat({required Map<String, dynamic> data}) async {
    final box = await _chatBox;

    final chat = Chat.fromJson(data);

    if (data['last_message'] != null) {
      await saveMessageData(data: data['last_message']);
      final lastMessage = await getMessage(id: data['last_message']['id']);
      chat.lastMessage = lastMessage;
    }

    Chat? existing = box.values.firstWhereOrNull((m) => m.id == chat.id);

    if (existing != null) {
      _mergeChat(existing, chat);
      await box.put(existing.key, existing);
      return existing;
    }

    await box.add(chat);
    return chat;
  }

  void _mergeChat(Chat target, Chat source) {
    target.unreadMessages = source.unreadMessages;
    target.lastMessage = source.lastMessage;
  }

  Future<void> deleteChat({required int id}) async {
    final chatBox = await _chatBox;
    final messageBox = await _messageBox;

    // Delete all messages belonging to this chat
    final messagesToDelete = messageBox.values
        .where((msg) => msg.chatId == id)
        .map((msg) => msg.id)
        .toList();

    await messageBox.deleteAll(messagesToDelete);
    await chatBox.delete(id);
  }

  // ==================== MESSAGES ====================

  Future<Message?> getMessage({required int id}) async {
    final box = await _messageBox;
    return box.values.firstWhereOrNull((m) => m.id == id);
  }

  Future<List<Message>> fetchMessages({required int chatId}) async {
    final box = await _messageBox;
    final messages = box.values.where((msg) => msg.chatId == chatId).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt)); // newest first
    return messages;
  }

  Future<Message> createMessage({required Message message}) async {
    final box = await _messageBox;

    // Check for existing message
    Message? existing = box.values.firstWhereOrNull(
      (m) => m.id == message.id || m.uuid == message.uuid,
    );

    if (existing != null) {
      _mergeMessage(existing, message);
      await box.put(existing.key, existing);
      return existing;
    }

    // New message
    if (message.id == 0) {
      message.id = DateTime.now().millisecondsSinceEpoch;
    }
    await box.add(message);
    return message;
  }

  Future<void> saveMessageData({required Map<String, dynamic> data}) async {
    final box = await _messageBox;

    final message = Message.fromJson(data);

    Message? existing = box.values.firstWhereOrNull(
      (m) => m.id == message.id || m.uuid == message.uuid,
    );

    if (existing != null) {
      _mergeMessage(existing, message);
      await box.put(existing.key, existing);
    } else {
      if (message.id == 0) {
        message.id = DateTime.now().millisecondsSinceEpoch;
      }
      await box.add(message);
    }
  }

  void _mergeMessage(Message target, Message source) {
    target.id = source.id;
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
    // Keep original chatId
  }

  Future<void> updateMessage({required Message message}) async {
    final box = await _messageBox;
    await box.put(message.key, message);
  }

  Future<void> deleteMessage({required Message message}) async {
    final box = await _messageBox;
    await box.delete(message.key);
  }

  Future<List<Message>> getMessagesToPost() async {
    final box = await _messageBox;
    return box.values.where((m) => m.syncType == SyncType.post).toList();
  }

  Future<List<Message>> getMessagesToUploadAssets() async {
    final box = await _messageBox;
    return box.values.where((m) => m.syncType == SyncType.assets).toList();
  }

  Future<List<Message>> getMessagesToPatch() async {
    final box = await _messageBox;
    return box.values.where((m) => m.syncType == SyncType.patch).toList();
  }

  Future<List<Message>> getMessagesToDelete() async {
    final box = await _messageBox;
    return box.values.where((m) => m.syncType == SyncType.delete).toList();
  }

  // ==================== UTILITY ====================

  Future<void> clear() async {
    await (await _draftBox).clear();
    await (await _chatBox).clear();
    await (await _messageBox).clear();
  }
}

// Extension to help with firstWhereOrNull (since Hive doesn't have built-in query like ObjectBox)
extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
