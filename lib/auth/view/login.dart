import 'package:democracy/app/shared/widgets/app_header_logo.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppHeaderLogo(),
              const SizedBox(height: 20),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return SizedBox(
                    width: 200,
                    child: FilledButton.tonal(
                      onPressed: state is LoginLoading
                          ? null
                          : () {
                              context.read<LoginCubit>().login(
                                username: '${dotenv.env['FAKE_USERNAME']}',
                                password: '${dotenv.env['FAKE_PASSWORD']}',
                              );
                            },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: state is LoginLoading
                            ? SpinKitThreeBounce(
                                size: 40,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : Text(
                                'Login via eCitizen',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}


