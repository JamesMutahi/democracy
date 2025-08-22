import 'package:bloc/bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:equatable/equatable.dart';

part 'petitions_state.dart';

class PetitionsCubit extends Cubit<PetitionsState> {
  PetitionsCubit() : super(PetitionsState());

  void websocketFailure({required String error}) {
    emit(state.copyWith(status: PetitionsStatus.failure));
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: PetitionsStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Petition> petitions = List.from(
        payload['data']['results'].map((e) => Petition.fromJson(e)),
      );
      int? lastPetition = payload['data']['last_petition'];
      emit(
        state.copyWith(
          status: PetitionsStatus.success,
          petitions:
              lastPetition == null
                  ? petitions
                  : [...state.petitions, ...petitions],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: PetitionsStatus.failure));
    }
  }
}
