import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
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
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      switch (state) {
                        case LoginLoading():
                          return FilledButton.tonal(
                            onPressed: null,
                            child: SpinKitThreeBounce(
                              size: 40,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          );
                        default:
                          return FilledButton(
                            onPressed: () {
                              context.read<LoginCubit>().login(
                                email: '${dotenv.env['FAKE_EMAIL']}',
                                password: '${dotenv.env['FAKE_PASSWORD']}',
                              );
                            },
                            child: const Center(
                              child: Text(
                                'Login via eCitizen',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
