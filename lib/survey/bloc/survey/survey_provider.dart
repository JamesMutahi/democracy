part of 'survey_bloc.dart';

class SurveyProvider {
  SurveyProvider({required this.dio});

  final Dio dio;

  Future<Map<String, dynamic>> getSurveys({
    required String token,
    required String? next,
    required String? searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) async {
    try {
      late Response response;
      var options = Options(
        headers: <String, String>{'Authorization': 'Token $token'},
      );
      if (next == null) {
        response = await dio.get(
          '/api/surveys/',
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
        return Future.error('Unable to get surveys at this time');
      }
    } on DioException {
      return Future.error('Unable to get surveys at this time');
    }
  }

  Future<void> postResponse({
    required String token,
    required Survey survey,
    required DateTime startTime,
    required DateTime endTime,
    required List<TextAnswer> textAnswers,
    required List<ChoiceAnswer> choiceAnswers,
  }) async {
    try {
      List<Map<String, dynamic>> textAnswersAsJson = [];
      List<Map<String, dynamic>> choiceAnswersAsJson = [];
      for (TextAnswer textAnswer in textAnswers) {
        textAnswersAsJson.add({
          'question': textAnswer.question.id,
          'text': textAnswer.text,
        });
      }
      for (ChoiceAnswer choiceAnswer in choiceAnswers) {
        choiceAnswersAsJson.add({
          'question': choiceAnswer.question.id,
          'choice': choiceAnswer.choice.id,
        });
      }
      Response response = await dio.post(
        '/api/response/',
        data: {
          'survey': survey.id,
          'start_time': startTime.toString(),
          'end_time': endTime.toString(),
          'text_answers': textAnswersAsJson,
          'choice_answers': choiceAnswersAsJson,
        },
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode != 201) {
        return Future.error('Unable to post responses at this time');
      }
    } on DioException {
      return Future.error('Unable to post responses at this time');
    }
  }
}
