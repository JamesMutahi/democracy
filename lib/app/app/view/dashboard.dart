import 'package:democracy/app/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/app/view/pages/index.dart';
import 'package:democracy/app/utils/view/bottom_nav_bar.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

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
      appBar: AppBar(
        leading: Icon(Icons.person),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              splashColor: Theme.of(context).colorScheme.secondaryFixedDim,
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  // color: Theme.of(context).canvasColor,
                  border: Border.all(color: Theme.of(context).disabledColor),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Icon(
                  Symbols.notifications_rounded,
                  color: Theme.of(context).disabledColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: PopScope(
        canPop: canPopNow,
        onPopInvokedWithResult: (didPop, __) {
          onPopInvoked(didPop);
        },
        child: BlocListener<BottomNavBarCubit, BottomNavBarState>(
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
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              HomePage(),
              ExplorePage(),
              PollPage(),
              MessagePage(),
              ProfilePage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
