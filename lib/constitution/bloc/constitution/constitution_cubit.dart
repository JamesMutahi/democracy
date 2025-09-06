import 'package:bloc/bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'constitution_cubit.freezed.dart';
part 'constitution_state.dart';

class ConstitutionCubit extends Cubit<ConstitutionState> {
  ConstitutionCubit() : super(ConstitutionState.initial());

  void loaded({required Map<String, dynamic> payload}) {
    emit(ConstitutionState.loading());
    if (payload['response_status'] == 200) {
      final List<Section> sections = List.from(
        payload['data'].map((e) => Section.fromJson(e)),
      );
      emit(ConstitutionState.loaded(sections: sections));
    } else {
      emit(ConstitutionState.failure(error: payload['errors'][0]));
    }
  }
}
