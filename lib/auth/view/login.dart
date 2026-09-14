import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/app_logo.dart';
import 'package:democracy/app/shared/widgets/dialog_container.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _currentIndex = 0;
  late Timer _timer;

  final texts = ['Skiza Wakenya', 'Linda Mwananchi'];

  List<Widget> _getWidgets(ColorScheme colorScheme) {
    return texts
        .map(
          (text) => Row(
            key: ValueKey<int>(_currentIndex),
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 16,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % texts.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final widgets = _getWidgets(colorScheme);

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoggedIn():
            ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(
                context: context,
                message: 'Logged in successfully',
                status: SnackBarStatus.success,
              ),
            );
          case LoginFailure(:final error):
            ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(
                context: context,
                message: error,
                status: SnackBarStatus.failure,
              ),
            );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -100,
                right: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primaryContainer.withValues(alpha: 0.4),
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                left: -50,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primaryContainer.withValues(alpha: 0.4),
                  ),
                ),
              ),

              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const AppLogo(),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: widgets[_currentIndex],
                        ),
                      ),

                      const SizedBox(height: 30),

                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          final isLoading = state is LoginLoading;
                          return ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 280),
                            child: SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: OutlinedButton(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        context.read<LoginCubit>().login(
                                          username:
                                              const String.fromEnvironment(
                                                'FAKE_USERNAME',
                                              ),
                                          password:
                                              const String.fromEnvironment(
                                                'FAKE_PASSWORD',
                                              ),
                                        );
                                      },
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: isLoading
                                      ? SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                          ),
                                        )
                                      : const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.login_rounded, size: 20),
                                            SizedBox(width: 8),
                                            Text(
                                              'Login via eCitizen',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          kIsWeb
                              ? showDialog(
                                  context: context,
                                  builder: (context) => DialogContainer(
                                    children: [
                                      Expanded(child: _TermsAndConditions()),
                                    ],
                                  ),
                                )
                              : showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  showDragHandle: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (context) =>
                                      const _TermsAndConditions(),
                                );
                        },
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return Text(
                              state.version,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    letterSpacing: 0.5,
                                  ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Terms & Conditions Bottom Sheet
// -----------------------------------------------------------------------------

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms & Conditions',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Please read these terms carefully before using this demonstration application.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TcSection(
                      number: '1',
                      title: 'Acceptance of Terms',
                      content:
                          'By downloading, installing, or accessing this demonstration application, you agree to be bound by these Terms and Conditions. If you do not agree, please do not use it.',
                    ),
                    SizedBox(height: 20),
                    _TcSection(
                      number: '2',
                      title: 'Evaluation Purpose',
                      content:
                          'This application is strictly for evaluation, testing, and demonstration purposes only.',
                    ),
                    SizedBox(height: 20),
                    _TcSection(
                      number: '3',
                      title: 'Data Usage and Disclaimers',
                      content:
                          '• Temporary Storage: Data entered may be deleted, reset, or overwritten at any time without notice.\n• No Production Data: Do not upload or process real-world sensitive, personal, or financial data within this environment.',
                    ),
                    SizedBox(height: 20),
                    _TcSection(
                      number: '4',
                      title: 'Disclaimer of Warranties',
                      content:
                          'The application is provided on an "AS IS" and "AS AVAILABLE" basis. We expressly disclaim all warranties, express or implied, including but not limited to merchantability, fitness for a particular purpose, and non-infringement. We do not warrant that the application will be bug-free, secure, or uninterrupted.',
                      isWarning: true,
                    ),
                    SizedBox(height: 20),
                    _TcSection(
                      number: '5',
                      title: 'Limitation of Liability',
                      content:
                          'To the maximum extent permitted by law, in no event shall we be liable for any direct, indirect, incidental, special, or consequential damages (including loss of data, profits, or goodwill) arising out of your use of the application.',
                      isWarning: true,
                    ),
                    SizedBox(height: 20),
                    _TcSection(
                      number: '6',
                      title: 'Intellectual Property Rights',
                      content:
                          '• Ownership: All rights, titles, and interests in the application remain our exclusive intellectual property.\n• No Transfer: This agreement does not grant you any ownership rights or branding privileges.\n• Feedback: Any suggestions provided may be implemented by us without obligation or compensation.',
                    ),
                    SizedBox(height: 20),
                    _TcSection(
                      number: '7',
                      title: 'Termination',
                      content:
                          'We reserve the right to terminate your access to the application at any time, with or without cause, and without prior notice.',
                    ),
                    SizedBox(
                      height: 32,
                    ), // Extra padding at the bottom for comfortable scrolling
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Helper Widget for T&C Sections
// -----------------------------------------------------------------------------

class _TcSection extends StatelessWidget {
  const _TcSection({
    required this.number,
    required this.title,
    required this.content,
    this.isWarning = false,
  });

  final String number;
  final String title;
  final String content;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Numbered Badge
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: isWarning
                ? colorScheme.errorContainer
                : colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isWarning
                  ? colorScheme.onErrorContainer
                  : colorScheme.onPrimaryContainer,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isWarning
                      ? colorScheme.onErrorContainer
                      : colorScheme.onSurfaceVariant,
                  height: 1.5, // Better line height for readability
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
