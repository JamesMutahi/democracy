part of 'poll_bloc.dart';

class PollRepository {
  PollRepository({required this.pollProvider});

  final PollProvider pollProvider;

  Future<Map<String, dynamic>> getPolls({
    required String? token,
    required String? next,
    String? searchTerm,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final data = await pollProvider.getPolls(
      token: token,
      next: next,
      searchTerm: searchTerm,
      startDate: startDate,
      endDate: endDate,
    );
    return data;
  }

  Future<Poll> vote({
    required String token,
    required Option option,
  }) async {
    final poll = await pollProvider.vote(
      token: token,
      option: option,
    );
    return poll;
  }
}
