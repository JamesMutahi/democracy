import 'package:democracy/app/auth/bloc/otp_counter/otp_counter_bloc.dart';
import 'package:democracy/app/auth/bloc/password_reset/password_reset_cubit.dart';
import 'package:democracy/app/auth/view/code.dart';
import 'package:democracy/app/auth/view/login.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordResetCubit, PasswordResetState>(
      listener: (context, state) {
        switch (state) {
          case PasswordResetEmailVerified():
            context.read<OTPCounterBloc>().add(const OTPCounterEvent.started());
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder:
                    (context) => CodePage(
                      onVerifyPressed: (code) {
                        context.read<PasswordResetCubit>().verifyCode(
                          code: code,
                        );
                      },
                      onResendCode: () {
                        context.read<PasswordResetCubit>().resendOTP();
                      },
                    ),
              ),
            );

          case PasswordResetFailure(:final error):
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
                          onPressed:
                              () => Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              ),
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
                            'Reset Password',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: BlocBuilder<PasswordResetCubit, PasswordResetState>(
                      builder: (context, state) {
                        switch (state) {
                          case PasswordResetLoading():
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
                                  context
                                      .read<PasswordResetCubit>()
                                      .verifyEmail(
                                        email: _controllerEmail.text,
                                      );
                                }
                              },
                              child: const Center(
                                child: Text(
                                  'Verify',
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
