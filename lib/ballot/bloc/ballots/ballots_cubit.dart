import 'package:bloc/bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:equatable/equatable.dart';

part 'ballots_state.dart';

class BallotsCubit extends Cubit<BallotsState> {
  BallotsCubit() : super(const BallotsState());

  void websocketFailure({required String error}) {
    if (state.status == BallotsStatus.initial ||
        state.status == BallotsStatus.loading) {
      emit(state.copyWith(status: BallotsStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: BallotsStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Ballot> ballots = List.from(
        payload['data']['results'].map((e) => Ballot.fromJson(e)),
      );
      int? lastBallot = payload['data']['last_ballot'];
      emit(
        state.copyWith(
          status: BallotsStatus.success,
          ballots:
              lastBallot == null ? ballots : [...state.ballots, ...ballots],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: BallotsStatus.failure));
    }
  }
}
