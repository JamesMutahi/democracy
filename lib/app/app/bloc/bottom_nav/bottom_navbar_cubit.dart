import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navbar_cubit.freezed.dart';
part 'bottom_navbar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarState.pageChanged(0));

  void changePage(int page) {
    emit(BottomNavBarState.pageChanged(page));
  }
}
