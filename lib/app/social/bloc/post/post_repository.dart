part of 'post_bloc.dart';

class PostRepository {
  PostRepository({required this.postProvider});

  final PostProvider postProvider;

  Future<Map<String, dynamic>> getPosts({
    required String? next,
    String? searchTerm,
  }) async {
    final data = await postProvider.getPosts(
      next: next,
      searchTerm: searchTerm,
    );
    return data;
  }
}
