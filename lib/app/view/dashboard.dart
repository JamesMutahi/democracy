import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/view/pages/index.dart';
import 'package:democracy/app/view/widgets/bottom_nav_bar.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/app/view/widgets/drawer.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final pageController = PageController();
  DateTime? currentBackPressTime;
  bool canPopNow = false;
  int requiredSeconds = 2;
  List<n_.Notification> unreadNotifications = [];

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    ScaffoldFeatureController showSnackBar({required SnackBar snackBar}) {
      ScaffoldMessenger.of(context).clearSnackBars();
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void onPopInvoked(bool didPop) {
      if (_key.currentState!.isDrawerOpen) {
        _key.currentState!.closeDrawer();
        return;
      }
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) >
              Duration(seconds: requiredSeconds)) {
        currentBackPressTime = now;
        final snackBar = getSnackBar(
          context: context,
          message: 'Press back again to close',
          status: SnackBarStatus.info,
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

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User user;
        if (state is Authenticated) {
          user = state.user;
        }
        return Scaffold(
          key: _key,
          resizeToAvoidBottomInset: false,
          drawer: AppDrawer(user: user),
          body: PopScope(
            canPop: canPopNow,
            onPopInvokedWithResult: (didPop, __) {
              onPopInvoked(didPop);
            },
            child: MultiBlocListener(
              listeners: [
                BlocListener<BottomNavBarCubit, BottomNavBarState>(
                  listener: (context, state) {
                    switch (state) {
                      case BottomNavBarPageChanged(:final page):
                        pageController.jumpToPage(page);
                    }
                  },
                ),
                BlocListener<NotificationsCubit, NotificationsState>(
                  listener: (context, state) {
                    if (state is NotificationsLoaded) {
                      setState(() {
                        unreadNotifications =
                            state.notifications
                                .where((n) => n.isRead == false)
                                .toList();
                      });
                    }
                  },
                ),
                BlocListener<NotificationDetailCubit, NotificationDetailState>(
                  listener: (context, state) {
                    if (state is NotificationCreated) {
                      setState(() {
                        unreadNotifications.add(state.notification);
                      });
                    }
                    if (state is NotificationUpdated) {
                      if (unreadNotifications.any(
                        (n) => n.id == state.notification.id,
                      )) {
                        if (state.notification.isRead) {
                          setState(() {
                            unreadNotifications.removeWhere(
                              (n) => n.id == state.notification.id,
                            );
                          });
                        }
                      }
                    }
                    if (state is NotificationDeleted) {
                      if (unreadNotifications.any(
                        (n) => n.id == state.notificationId,
                      )) {
                        setState(() {
                          unreadNotifications.removeWhere(
                            (n) => n.id == state.notificationId,
                          );
                        });
                      }
                    }
                  },
                ),
              ],
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value:
                    isDarkMode
                        ? SystemUiOverlayStyle.dark.copyWith(
                          statusBarColor:
                              Theme.of(context).appBarTheme.backgroundColor,
                          statusBarIconBrightness: Brightness.light,
                          systemNavigationBarColor:
                              Theme.of(context).appBarTheme.backgroundColor,
                          systemNavigationBarIconBrightness: Brightness.light,
                        )
                        : SystemUiOverlayStyle.light.copyWith(
                          statusBarColor:
                              Theme.of(context).appBarTheme.backgroundColor,
                          statusBarIconBrightness: Brightness.dark,
                          systemNavigationBarColor:
                              Theme.of(context).appBarTheme.backgroundColor,
                          systemNavigationBarIconBrightness: Brightness.dark,
                        ),
                child: SafeArea(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: [
                      HomePage(user: user, notifications: unreadNotifications),
                      ExplorePage(
                        user: user,
                        notifications: unreadNotifications,
                      ),
                      PollPage(user: user, notifications: unreadNotifications),
                      SurveyPage(
                        user: user,
                        notifications: unreadNotifications,
                      ),
                      MessagePage(
                        user: user,
                        notifications: unreadNotifications,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
