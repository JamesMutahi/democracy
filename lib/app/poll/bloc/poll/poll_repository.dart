part of 'poll_bloc.dart';

class PollRepository {
  PollRepository({required this.pollProvider});

  final PollProvider pollProvider;

  Future<Map<String, dynamic>> getPolls({
    required String? next,
    String? searchTerm,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final data = await pollProvider.getPolls(
      next: next,
      searchTerm: searchTerm,
      startDate: startDate,
      endDate: endDate,
    );
    return data;
  }
}
