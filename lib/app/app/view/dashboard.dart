import 'package:democracy/app/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/app/view/pages/index.dart';
import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/app/auth/bloc/login/login_cubit.dart';
import 'package:democracy/app/auth/bloc/registration/registration_cubit.dart';
import 'package:democracy/app/utils/view/bottom_nav_bar.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final pageController = PageController();
  DateTime? currentBackPressTime;
  bool canPopNow = false;
  int requiredSeconds = 2;

  @override
  Widget build(BuildContext context) {
    ScaffoldFeatureController showSnackBar({required SnackBar snackBar}) {
      ScaffoldMessenger.of(context).clearSnackBars();
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void onPopInvoked(bool didPop) {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) >
              Duration(seconds: requiredSeconds)) {
        currentBackPressTime = now;
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).cardColor,
          closeIconColor: Theme.of(context).primaryColor,
          content: const SnackBarContent(
            message: 'Press back again to close',
            status: SnackBarStatus.info,
          ),
        );
        ScaffoldFeatureController controller = showSnackBar(snackBar: snackBar);
        Future.delayed(Duration(seconds: requiredSeconds), () {
          // Disable pop invoke and close the snack bar after 2s timeout
          setState(() {
            canPopNow = false;
          });
          controller.close();
        });
        // Ok, let user exit app on the next back press
        setState(() {
          canPopNow = true;
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PopScope(
          canPop: canPopNow,
          onPopInvokedWithResult: (didPop, __) {
            onPopInvoked(didPop);
          },
          child: _Listeners(
            pageController: pageController,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [HomePage(), SocialPage(), ProfilePage()],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class _Listeners extends StatelessWidget {
  const _Listeners({required this.pageController, required this.child});

  final PageController pageController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    void showSnackBar({required SnackBar snackBar}) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {
            switch (state) {
              case ConnectivitySuccess():
                final snackBar = SnackBar(
                  backgroundColor: Theme.of(context).cardColor,
                  behavior: SnackBarBehavior.floating,
                  content: ConnSnackBarContent(
                    text: 'You are online',
                    iconColor: Theme.of(context).primaryColor,
                  ),
                  width: 170.0,
                );
                showSnackBar(snackBar: snackBar);
              case ConnectivityFailure():
                final snackBar = SnackBar(
                  backgroundColor: Theme.of(context).cardColor,
                  behavior: SnackBarBehavior.floating,
                  content: ConnSnackBarContent(
                    text: 'You are offline',
                    iconColor: Theme.of(context).colorScheme.error,
                  ),
                  width: 170.0,
                );
                showSnackBar(snackBar: snackBar);
            }
          },
        ),
        BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            switch (state) {
              case RegistrationUnverified():
                context.read<AuthBloc>().add(const AuthEvent.authenticate());
              case RegistrationVerified():
                context.read<AuthBloc>().add(const AuthEvent.authenticate());
            }
          },
        ),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            switch (state) {
              case LoggedIn():
                context.read<AuthBloc>().add(const AuthEvent.authenticate());

              case LoggedOut():
                context.read<AuthBloc>().add(const AuthEvent.authenticate());
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).cardColor,
                  content: const SnackBarContent(
                    message: 'Logged out',
                    status: SnackBarStatus.info,
                  ),
                );
                showSnackBar(snackBar: snackBar);
            }
          },
        ),
        BlocListener<BottomNavBarCubit, BottomNavBarState>(
          listener: (context, state) {
            switch (state) {
              case BottomNavBarPageChanged(:final page):
                pageController.animateToPage(
                  page,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                );
            }
          },
        ),
      ],
      child: child,
    );
  }
}

class ConnSnackBarContent extends StatelessWidget {
  const ConnSnackBarContent({
    super.key,
    required this.text,
    required this.iconColor,
  });

  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.wifi_outlined, color: iconColor),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
