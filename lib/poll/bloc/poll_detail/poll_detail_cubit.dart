import 'package:bloc/bloc.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_detail_state.dart';
part 'poll_detail_cubit.freezed.dart';

class PollDetailCubit extends Cubit<PollDetailState> {
  PollDetailCubit() : super(const PollDetailState.initial());

  void websocketFailure({required String error}) {
    if (state is PollDetailInitial || state is PollDetailLoading) {
      emit(PollDetailFailure());
    }
  }

  void created({required Map<String, dynamic> payload}) {
    emit(PollDetailLoading());
    if (payload['response_status'] == 201) {
      Poll poll = Poll.fromJson(payload['data']);
      emit(PollCreated(poll: poll));
    } else {
      emit(PollDetailFailure());
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(PollDetailLoading());
    if (payload['response_status'] == 200) {
      final Poll poll = Poll.fromJson(payload['data']);
      emit(PollUpdated(poll: poll));
    } else {
      emit(PollDetailFailure());
    }
  }
}
