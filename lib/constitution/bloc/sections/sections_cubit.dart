import 'package:bloc/bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sections_state.dart';
part 'sections_cubit.freezed.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(const SectionsState.initial());

  void loaded({required Map<String, dynamic> payload}) {
    emit(SectionsState.loading());
    if (payload['response_status'] == 200) {
      final List<Section> sections = List.from(
        payload['data'].map((e) => Section.fromJson(e)),
      );
      emit(SectionsState.loaded(sections: sections));
    } else {
      emit(SectionsState.failure());
    }
  }
}
