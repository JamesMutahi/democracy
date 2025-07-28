import 'package:bloc/bloc.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:equatable/equatable.dart';

part 'polls_state.dart';

class PollsCubit extends Cubit<PollsState> {
  PollsCubit() : super(const PollsState());

  void websocketFailure({required String error}) {
    if (state.status == PollsStatus.initial ||
        state.status == PollsStatus.loading) {
      emit(state.copyWith(status: PollsStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: PollsStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Poll> polls = List.from(
        payload['data']['results'].map((e) => Poll.fromJson(e)),
      );
      int? lastPoll = payload['data']['last_poll'];
      emit(
        state.copyWith(
          status: PollsStatus.success,
          polls: lastPoll == null ?  polls : [...state.polls, ...polls],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: PollsStatus.failure));
    }
  }
}
