part of 'draft_post_bloc.dart';

class DraftPostRepository {
  final Isar isar;

  DraftPostRepository({required this.isar});

  Future<List<DraftPost>> fetchDrafts() async {
    final drafts = await isar.draftPosts.where().findAll();
    return drafts;
  }

  Future<int> saveDraft({required DraftPost draft}) async {
    return await isar.writeTxn(() async {
      final id = await isar.draftPosts.put(draft);
      return id;
    });
  }

  Future<DraftPost> getDraft({required int id}) async {
    final draft = await isar.draftPosts.get(id);
    if (draft == null) {
      throw Exception("Draft with ID $id not found.");
    }
    return draft;
  }

  Future<void> deleteDraft({required DraftPost draft}) async {
    await isar.writeTxn(() async {
      await isar.draftPosts.delete(draft.id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.draftPosts.clear();
    });
  }
}
