import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_controller_state.dart';

class MenuControllerCubit extends Cubit<MenuControllerState> {
  MenuControllerCubit() : super(MenuControllerState());

  void openDrawer() {
    emit(MenuControllerState(status: DrawerStatus.leftOpen));
  }

  void openEndDrawer() {
    emit(MenuControllerState(status: DrawerStatus.rightOpen));
  }

  void closeDrawer() {
    emit(MenuControllerState(status: DrawerStatus.closed));
  }
}
