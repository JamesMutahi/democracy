import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/app_logo.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FailurePage extends StatelessWidget {
  const FailurePage({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogo(),
              Text(error, textAlign: TextAlign.center),
              const SizedBox(height: 10),
              FailureRetryButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthEvent.authenticate());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
