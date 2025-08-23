import 'package:bloc/bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petition_detail_cubit.freezed.dart';
part 'petition_detail_state.dart';

class PetitionDetailCubit extends Cubit<PetitionDetailState> {
  PetitionDetailCubit() : super(const PetitionDetailState.initial());

  void created({required Map<String, dynamic> payload}) {
    emit(PetitionDetailLoading());
    if (payload['response_status'] == 201) {
      Petition petition = Petition.fromJson(payload['data']);
      emit(PetitionCreated(petition: petition));
    } else {
      emit(PetitionDetailFailure(error: payload['errors'][0]));
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(PetitionDetailLoading());
    if (payload['response_status'] == 200) {
      final Petition petition = Petition.fromJson(payload['data']);
      emit(PetitionUpdated(petition: petition));
    } else {
      emit(PetitionDetailFailure(error: payload['errors'][0]));
    }
  }

  void deleted({required Map<String, dynamic> payload}) {
    emit(PetitionDetailLoading());
    if (payload['response_status'] == 204) {
      emit(PetitionDeleted(petitionId: payload['pk']));
    } else {
      emit(PetitionDetailFailure(error: payload['errors'][0]));
    }
  }
}
