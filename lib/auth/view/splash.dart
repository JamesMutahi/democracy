import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: LoadingIndicator()));
  }
}
