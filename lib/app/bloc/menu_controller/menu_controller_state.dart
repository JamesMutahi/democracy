part of 'menu_controller_cubit.dart';

enum DrawerStatus { closed, leftOpen, rightOpen }

class MenuControllerState {
  final DrawerStatus status;

  MenuControllerState({this.status = DrawerStatus.closed});
}
