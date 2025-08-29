import 'package:bloc/bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:equatable/equatable.dart';

part 'user_petitions_state.dart';

class UserPetitionsCubit extends Cubit<UserPetitionsState> {
  UserPetitionsCubit() : super(UserPetitionsState());

  void websocketFailure({required String error}) {
    emit(state.copyWith(status: UserPetitionsStatus.failure));
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: UserPetitionsStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Petition> petitions = List.from(
        payload['data']['results'].map((e) => Petition.fromJson(e)),
      );
      int? lastPetition = payload['data']['last_petition'];
      emit(
        state.copyWith(
          status: UserPetitionsStatus.success,
          petitions:
              lastPetition == null
                  ? petitions
                  : [...state.petitions, ...petitions],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UserPetitionsStatus.failure));
    }
  }
}
