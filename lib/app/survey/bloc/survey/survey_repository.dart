part of 'survey_bloc.dart';

class SurveyRepository {
  SurveyRepository({required this.surveyProvider});

  final SurveyProvider surveyProvider;

  Future<Map<String, dynamic>> getSurveys({
    required String? next,
    String? searchTerm,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final data = await surveyProvider.getSurveys(
      next: next,
      searchTerm: searchTerm,
      startDate: startDate,
      endDate: endDate,
    );
    return data;
  }
}
