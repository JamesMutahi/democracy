import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/route/route_cubit.dart';
import 'package:flutter/material.dart';

class AppRouteObserver extends AutoRouterObserver {
  final RouteCubit routeCubit;

  AppRouteObserver({required this.routeCubit});

  @override
  void didChangeTop(Route topRoute, Route? previousTopRoute) {
    if (topRoute.settings.name != null) {
      routeCubit.updateRoute(topRoute.settings.name!);
    }

    final currentTopPageName = topRoute.navigator?.context.router.current.name;
    if (currentTopPageName != null) {
      routeCubit.updateRoute(currentTopPageName);
    }
  }
}
