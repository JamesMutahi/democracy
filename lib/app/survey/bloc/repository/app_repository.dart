import 'package:dio/dio.dart';

part 'app_provider.dart';

class AppRepository {
  AppRepository({required this.appProvider});
  final AppProvider appProvider;

  Future<Map<String, dynamic>> getSurveys({
    required String? next,
    String? searchTerm,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final data = await appProvider.getSurveys(
      next: next,
      searchTerm: searchTerm,
      startDate: startDate,
      endDate: endDate,
    );
    return data;
  }
}
