import 'package:bloc/bloc.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'polls_state.dart';
part 'polls_cubit.freezed.dart';

class PollsCubit extends Cubit<PollsState> {
  PollsCubit() : super(const PollsState.initial());

  void websocketFailure({required String error}) {
    if (state is PollsInitial || state is PollsLoading) {
      emit(PollsFailure(error: error));
    }
  }

  void retryButtonPressed() {
    emit(PollsInitial());
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(PollsLoading());
    if (payload['response_status'] == 200) {
      final List<Poll> polls = List.from(
        payload['data'].map((e) => Poll.fromJson(e)),
      );
      emit(PollsLoaded(polls: polls));
    } else {
      emit(PollsFailure(error: payload['errors'].toString()));
    }
  }
}
