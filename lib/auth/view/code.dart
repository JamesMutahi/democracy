import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:democracy/utils/snack_bar_content.dart';
import 'package:democracy/auth/bloc/otp_counter/otp_counter_bloc.dart';
import 'package:democracy/auth/bloc/password_reset/password_reset_cubit.dart';
import 'package:democracy/auth/bloc/registration/registration_cubit.dart';
import 'package:democracy/auth/view/password_reset.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodePage extends StatefulWidget {
  const CodePage({
    super.key,
    required this.onVerifyPressed,
    required this.onResendCode,
  });

  final Function(String) onVerifyPressed;
  final Function() onResendCode;

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            switch (state) {
              case RegistrationUnverified():
                context.read<OTPCounterBloc>().add(
                  const OTPCounterEvent.started(),
                );
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).cardColor,
                  content: const SnackBarContent(
                    message: 'A code has been sent to your email',
                    status: SnackBarStatus.info,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              case RegistrationVerified():
                context.read<OTPCounterBloc>().add(
                  const OTPCounterEvent.cancel(),
                );
                Navigator.of(context).pop();
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).cardColor,
                  content: const SnackBarContent(
                    message: 'Verification complete',
                    status: SnackBarStatus.success,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              case RegistrationFailure(error: final error):
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).cardColor,
                  content: SnackBarContent(
                    message: error,
                    status: SnackBarStatus.error,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              default: // Do nothing
            }
          },
        ),
        BlocListener<PasswordResetCubit, PasswordResetState>(
          listener: (context, state) {
            switch (state) {
              case PasswordResetEmailVerified(email: final email):
                context.read<OTPCounterBloc>().add(
                  const OTPCounterEvent.started(),
                );
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).cardColor,
                  content: SnackBarContent(
                    message: 'A code has been sent to your email: $email',
                    status: SnackBarStatus.info,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              case PasswordResetCodeVerified():
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const PasswordResetPage(),
                  ),
                );
              case PasswordResetFailure(error: final error):
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
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<OTPCounterBloc>().add(
                            const OTPCounterEvent.cancel(),
                          );
                          Navigator.of(context).pop();
                        },
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
                          'OTP Verification',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: BlocBuilder<OTPCounterBloc, OTPCounterState>(
                    builder: (context, state) {
                      String timeLeft = switch (state) {
                        OTPCounterInitial() => '--:--',
                        OTPCounterRunning(:final time) => _printDuration(time),
                        OTPCounterExpired() => '00:00',
                      };
                      return RichText(
                        text: TextSpan(
                          text:
                              '''Enter code sent to email. This code will expire in ''',
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.copyWith(
                            color: const Color(0XFF87898E),
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(
                              text: timeLeft,
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                PinCodeTextField(
                  appContext: context,
                  // onCompleted: (str) => controller.text = str,
                  length: 4,
                  onChanged: print,
                  blinkWhenObscuring: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    activeColor: const Color(0XFF87898E),
                    inactiveColor: const Color(0XFF87898E),
                    fieldWidth: 50,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  controller: controller,
                ),
                BlocBuilder<OTPCounterBloc, OTPCounterState>(
                  builder: (context, state) {
                    return switch (state) {
                      OTPCounterInitial() => const SizedBox.shrink(),
                      OTPCounterRunning() => const SizedBox.shrink(),
                      OTPCounterExpired() => Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            widget.onResendCode();
                          },
                          child: Text(
                            'Resend OTP',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    };
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
                              if (controller.text.length == 4) {
                                widget.onVerifyPressed(controller.text);
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
    );
  }
}

String _printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return '$twoDigitMinutes:$twoDigitSeconds';
}
