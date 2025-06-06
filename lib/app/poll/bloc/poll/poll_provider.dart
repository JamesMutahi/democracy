part of 'poll_bloc.dart';

class PollProvider {
  PollProvider({required this.dio});

  final Dio dio;

  Future<Map<String, dynamic>> getPolls({
    required String? next,
    required String? searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) async {
    try {
      late Response response;
      if (next == null) {
        response = await dio.get(
          '/api/polls/',
          queryParameters: {
            'search': searchTerm,
            'date__lte': startDate,
            'date__gte': endDate,
          },
        );
      } else {
        response = await dio.get(next);
      }
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Future.error('Unable to get polls at this time');
      }
    } on DioException {
      return Future.error('Unable to get polls at this time');
    }
  }
}
