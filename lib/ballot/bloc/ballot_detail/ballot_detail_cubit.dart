import 'package:bloc/bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ballot_detail_cubit.freezed.dart';
part 'ballot_detail_state.dart';

class BallotDetailCubit extends Cubit<BallotDetailState> {
  BallotDetailCubit() : super(const BallotDetailState.initial());

  void created({required Map<String, dynamic> payload}) {
    emit(BallotDetailLoading());
    if (payload['response_status'] == 201) {
      Ballot ballot = Ballot.fromJson(payload['data']);
      emit(BallotCreated(ballot: ballot));
    } else {
      emit(BallotDetailFailure(error: payload['errors'][0]));
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(BallotDetailLoading());
    if (payload['response_status'] == 200) {
      final Ballot ballot = Ballot.fromJson(payload['data']);
      emit(BallotUpdated(ballot: ballot));
    } else {
      emit(BallotDetailFailure(error: payload['errors'][0]));
    }
  }

  void deleted({required Map<String, dynamic> payload}) {
    emit(BallotDetailLoading());
    if (payload['response_status'] == 204) {
      emit(BallotDeleted(ballotId: payload['pk']));
    } else {
      emit(BallotDetailFailure(error: payload['errors'][0]));
    }
  }
}
