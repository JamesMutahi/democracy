part of 'post_bloc.dart';

class PostProvider {
  PostProvider({required this.dio});

  final Dio dio;

  Future<Map<String, dynamic>> getPosts({
    required String? next,
    required String? searchTerm,
  }) async {
    try {
      late Response response;
      if (next == null) {
        response = await dio.get(
          '/api/posts/',
          queryParameters: {'search': searchTerm},
        );
      } else {
        response = await dio.get(next);
      }
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return Future.error('Unable to get posts at this time');
      }
    } on DioException {
      return Future.error('Unable to get posts at this time');
    }
  }
}
