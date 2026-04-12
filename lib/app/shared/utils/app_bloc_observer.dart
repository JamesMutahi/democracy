import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:flutter/foundation.dart';

class AppBlocObserver extends BlocObserver {
  final _toIgnore = [BottomNavBarCubit];

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      if (!_toIgnore.contains(bloc.runtimeType)) {
        print('onChange(${bloc.runtimeType}, $change)');
      }
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('onError(${bloc.runtimeType}, $error, $stackTrace)');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      print('onEvent(${bloc.runtimeType}, $event)');
    }
    super.onEvent(bloc, event);
  }
}
