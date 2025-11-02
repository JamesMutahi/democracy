import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forms_tab_bar_state.dart';

class FormsTabBarCubit extends Cubit<FormsTabBarState> {
  FormsTabBarCubit() : super(FormsTabBarState());

  void tabChanged({required FormsTabBarStatus status}) {
    emit(state.copyWith(status: status));
  }
}
