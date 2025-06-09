part of 'poll_bloc.dart';

class PollProvider {
  PollProvider({required this.dio});

  final Dio dio;

  Future<Map<String, dynamic>> getPolls({
    required String? token,
    required String? next,
    required String? searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) async {
    try {
      late Response response;
      var options = Options();
      if (token != null) {
        options = Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        );
      }
      if (next == null) {
        response = await dio.get(
          '/api/polls/',
          queryParameters: {
            'search': searchTerm,
            'date__lte': startDate,
            'date__gte': endDate,
          },
          options: options,
        );
      } else {
        response = await dio.get(next, options: options);
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

  Future<Poll> vote({required String token, required Option option}) async {
    try {
      Response response = await dio.post(
        '/api/vote-poll/',
        data: {'option': option.id},
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 200) {
        return Poll.fromJson(response.data);
      } else {
        return Future.error('Unable to vote at this time');
      }
    } on DioException {
      return Future.error('Unable to vote at this time');
    }
  }
}
