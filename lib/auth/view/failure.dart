import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/app_logo.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FailurePage extends StatelessWidget {
  const FailurePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              const AppLogo(),

              const SizedBox(height: 48),

              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Text(
                    state.error,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: FailureRetryButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthEvent.authenticate());
                  },
                ),
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  // TODO: Add contact support or logout logic
                },
                child: Text(
                  'Contact Support',
                  style: TextStyle(color: colorScheme.primary),
                ),
              ),

              const Spacer(flex: 2),

              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Text(
                      state.version,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        letterSpacing: 0.5,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
