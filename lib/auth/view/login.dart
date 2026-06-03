import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/app_logo.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoggedIn():
            final snackBar = getSnackBar(
              context: context,
              message: 'Logged in',
              status: SnackBarStatus.success,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case LoginFailure(:final error):
            final snackBar = getSnackBar(
              context: context,
              message: error,
              status: SnackBarStatus.failure,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return FilledButton.tonal(
                          onPressed: state is LoginLoading
                              ? null
                              : () {
                                  context.read<LoginCubit>().login(
                                    username: const String.fromEnvironment(
                                      'FAKE_USERNAME',
                                    ),
                                    password: const String.fromEnvironment(
                                      'FAKE_PASSWORD',
                                    ),
                                  );
                                },
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: state is LoginLoading
                                ? SpinKitThreeBounce(
                                    size: 40,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  )
                                : Text(
                                    'Login via eCitizen',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Digital and direct democracy',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                  ), // Distance from screen bottom
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        showDragHandle: true,
                        shape: const BeveledRectangleBorder(),
                        useSafeArea: true,
                        builder: (context) {
                          return _TermsAndConditions();
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        bottom: 4.0,
                      ), // Exact space between text and border line
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms & Conditions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '1. Acceptance of Terms',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 5),
              Text(
                'By downloading, installing, or accessing this demonstration application, you agree to be bound by these Terms and Conditions. If you do not agree, do not use it.',
              ),
              SizedBox(height: 10),
              Text(
                '2. Evaluation',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 5),
              Text(
                'This application is strictly for evaluation, testing, and demonstration purposes',
              ),
              SizedBox(height: 10),
              Text(
                '3. Data Usage and Disclaimers',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Temporary Storage: Data entered into the application may be deleted, reset, or overwritten at any time without prior notice. \n'
                'No Production Data: You agree not to upload or process real-world sensitive, personal, or financial data within this environment.',
              ),
              SizedBox(height: 10),
              Text(
                '4. Disclaimer of Warranties',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 5),
              Text(
                'THE APPLICATION IS PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS. WE EXPRESSLY DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. WE DO NOT WARRANT THAT THE APPLICATION WILL BE BUG-FREE, SECURE, OR UNINTERRUPTED.',
              ),
              SizedBox(height: 10),
              Text(
                '5. Limitation of Liability',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 5),
              Text(
                'TO THE MAXIMUM EXTENT PERMITTED BY LAW, IN NO EVENT SHALL WE BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES (INCLUDING LOSS OF DATA, PROFITS, OR GOODWILL) ARISING OUT OF YOUR USE OF THE APPLICATION, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.',
              ),
              SizedBox(height: 10),
              Text(
                '6. Intellectual Property Rights',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Ownership: All rights, titles, and interests in the application remain our exclusive intellectual property.',
              ),
              Text(
                'No Transfer: This agreement does not grant you any ownership rights or branding privileges.',
              ),
              Text(
                'Feedback: Any suggestions or feedback you provide may be implemented by us without obligation or compensation to you.',
              ),
              SizedBox(height: 10),
              Text(
                '7. Termination',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 5),
              Text(
                'We reserve the right to terminate your access to the application at any time, with or without cause, and without prior notice.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
