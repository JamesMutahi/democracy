import 'package:flutter_bloc/flutter_bloc.dart';

class RouteCubit extends Cubit<String> {
  RouteCubit() : super('HomeRoute');

  void updateRoute(String routeName) {
    if (routeName != state) {
      emit(routeName);
    }
  }
}