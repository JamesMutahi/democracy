import 'package:bloc/bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/poll/bloc/poll/poll_bloc.dart';
import 'package:democracy/poll/models/option.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote_state.dart';
part 'vote_cubit.freezed.dart';

class VoteCubit extends Cubit<VoteState> {
  VoteCubit({required this.authRepository, required this.pollRepository})
    : super(const VoteState.initial());

  void vote({required Option option}) async {
    try {
      emit(const VoteState.loading());
      String? token = await authRepository.getToken();
      Poll poll = await pollRepository.vote(token: token!, option: option);
      emit(VoteState.voted(poll: poll));
    } catch (e) {
      emit(VoteState.failure(error: e.toString()));
    }
  }

  final PollRepository pollRepository;
  final AuthRepository authRepository;
}
