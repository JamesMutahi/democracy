import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forms_search_and_filter_state.dart';

class FormsSearchAndFilterCubit extends Cubit<FormsSearchAndFilterState> {
  FormsSearchAndFilterCubit() : super(FormsSearchAndFilterState());

  void tabChanged({required FormsSearchAndFilterStatus status}) {
    emit(state.copyWith(status: status));
  }

  void search({required String searchTerm}) {
    switch (state.status) {
      case FormsSearchAndFilterStatus.onSurveys:
        emit(state.copyWith(surveysSearchTerm: searchTerm));
      case FormsSearchAndFilterStatus.onPetitions:
        emit(state.copyWith(petitionsSearchTerm: searchTerm));
    }
  }
}
