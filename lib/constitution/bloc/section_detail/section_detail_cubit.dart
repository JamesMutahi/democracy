import 'package:bloc/bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_detail_state.dart';
part 'section_detail_cubit.freezed.dart';

class SectionDetailCubit extends Cubit<SectionDetailState> {
  SectionDetailCubit() : super(const SectionDetailState.initial());

  void loaded({required Map<String, dynamic> payload}) {
    emit(_Loading());
    if (payload['response_status'] == 200) {
      Section section = Section.fromJson(payload['data']);
      emit(SectionLoaded(section: section));
    } else {
      emit(SectionDetailFailure(error: payload['errors'][0]));
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(_Loading());
    if (payload['response_status'] == 200) {
      Section section = Section.fromJson(payload['data']);
      emit(SectionUpdated(section: section));
    } else {
      emit(SectionDetailFailure(error: payload['errors'][0]));
    }
  }
}
