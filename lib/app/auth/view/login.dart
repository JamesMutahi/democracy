import 'package:democracy/app/auth/bloc/login/login_cubit.dart';
import 'package:democracy/app/auth/view/email.dart';
import 'package:democracy/app/auth/view/registration.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoggedIn():
            final snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Theme.of(context).cardColor,
              content: const SnackBarContent(
                message: 'Logged in',
                status: SnackBarStatus.success,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case LoginFailure(:final error):
            final snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Theme.of(context).cardColor,
              content: SnackBarContent(
                message: error,
                status: SnackBarStatus.error,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.arrow_back,
                            weight:
                                Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.fontWeight
                                    ?.value
                                    .toDouble(),
                            size:
                                Theme.of(
                                  context,
                                ).textTheme.headlineMedium?.fontSize,
                          ),
                        ),
                        Align(
                          child: Text(
                            'Sign In',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed:
                            () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const RegistrationPage(),
                              ),
                            ),
                        child: const Text('Create account'),
                      ),
                    ],
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded),
                      label: Text('Email'),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                    controller: _controllerEmail,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    obscureText: obscure,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key_rounded),
                      label: const Text('Password'),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (obscure == true) {
                              obscure = false;
                            } else {
                              obscure = true;
                            }
                          });
                        },
                        icon:
                            obscure
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    controller: _controllerPassword,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed:
                          () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const EmailPage(),
                            ),
                          ),
                      child: const Text('Forgot password?'),
                    ),
                  ),
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
                                color: Colors.green.shade900,
                              ),
                            );
                          default:
                            return FilledButton(
                              onPressed: () {
                                _formKey.currentState?.save();
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.read<LoginCubit>().login(
                                    email: _controllerEmail.text,
                                    password: _controllerPassword.text,
                                  );
                                }
                              },
                              child: const Center(
                                child: Text(
                                  'Login',
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
      ),
    );
  }
}
