import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:democracy/utils/snack_bar_content.dart';
import 'package:democracy/auth/bloc/password_change/password_change_cubit.dart';

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({super.key});

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _controllerOldPassword = TextEditingController();
  final TextEditingController _controllerNewPassword1 = TextEditingController();
  final TextEditingController _controllerNewPassword2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordChangeCubit, PasswordChangeState>(
      listener: (context, state) {
        switch (state) {
          case PasswordChangeFailure(:final error):
            final snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Theme.of(context).cardColor,
              content: SnackBarContent(
                message: error,
                status: SnackBarStatus.error,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

          case PasswordChangeComplete():
            Navigator.of(context).pop();
            final snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Theme.of(context).cardColor,
              content: const SnackBarContent(
                message: 'Password changed',
                status: SnackBarStatus.success,
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
                            'Change Password',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key_rounded),
                      label: Text('Old password'),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    controller: _controllerOldPassword,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key_rounded),
                      label: Text('New password'),
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
                    controller: _controllerNewPassword1,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key_rounded),
                      label: Text('Confirm password'),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      // FormBuilderValidators.equal(
                      //   _controllerNewPassword1.text,
                      //   errorText: 'Passwords do not match',
                      // ),
                    ]),
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    controller: _controllerNewPassword2,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child:
                        BlocBuilder<PasswordChangeCubit, PasswordChangeState>(
                          builder: (context, state) {
                            switch (state) {
                              case PasswordChangeLoading():
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
                                          .read<PasswordChangeCubit>()
                                          .changePassword(
                                            oldPassword:
                                                _controllerOldPassword.text,
                                            newPassword1:
                                                _controllerNewPassword1.text,
                                            newPassword2:
                                                _controllerNewPassword2.text,
                                          );
                                    }
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Change',
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
    );
  }
}
