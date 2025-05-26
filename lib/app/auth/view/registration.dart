import 'package:democracy/app/auth/bloc/otp_counter/otp_counter_bloc.dart';
import 'package:democracy/app/auth/bloc/registration/registration_cubit.dart';
import 'package:democracy/app/auth/view/code.dart';
import 'package:democracy/app/auth/view/login.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword1 = TextEditingController();
  final TextEditingController _controllerPassword2 = TextEditingController();

  bool obscurePassword = true;
  bool obscurePassword2 = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        switch (state) {
          case RegistrationUnverified():
            context.read<OTPCounterBloc>().add(const OTPCounterEvent.started());
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder:
                    (context) => CodePage(
                      onVerifyPressed: (code) {
                        context.read<RegistrationCubit>().verify(code: code);
                      },
                      onResendCode: () {
                        context.read<RegistrationCubit>().resendOTP();
                      },
                    ),
              ),
            );
          case RegistrationFailure(:final error):
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
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, obj) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
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
                              'Sign Up',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              label: Text('First name'),
                            ),
                            textInputAction: TextInputAction.next,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            controller: _controllerFirstName,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              label: Text('Last name'),
                            ),
                            textInputAction: TextInputAction.next,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            controller: _controllerLastName,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
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
                      obscureText: obscurePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key_rounded),
                        label: const Text('Password'),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (obscurePassword == true) {
                                obscurePassword = false;
                              } else {
                                obscurePassword = true;
                              }
                            });
                          },
                          icon:
                              obscurePassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.password(
                          minLowercaseCount: 0,
                          minSpecialCharCount: 0,
                          minUppercaseCount: 0,
                          minLength: 5,
                          minNumberCount: 0,
                        ),
                      ]),
                      controller: _controllerPassword1,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      obscureText: obscurePassword2,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key_rounded),
                        label: const Text('Confirm password'),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (obscurePassword2 == true) {
                                obscurePassword2 = false;
                              } else {
                                obscurePassword2 = true;
                              }
                            });
                          },
                          icon:
                              obscurePassword2
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        // FormBuilderValidators.equal(
                        //   _controllerPassword1.text,
                        //   errorText: 'Passwords do not match',
                        // ),
                      ]),
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: _controllerPassword2,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: BlocBuilder<RegistrationCubit, RegistrationState>(
                        builder: (context, state) {
                          switch (state) {
                            case RegistrationLoading():
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
                                    context.read<RegistrationCubit>().register(
                                      firstName: _controllerFirstName.text,
                                      lastName: _controllerLastName.text,
                                      email: _controllerEmail.text,
                                      password: _controllerPassword1.text,
                                      confirmPassword:
                                          _controllerPassword2.text,
                                    );
                                  }
                                },
                                child: const Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
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
      ),
    );
  }
}
