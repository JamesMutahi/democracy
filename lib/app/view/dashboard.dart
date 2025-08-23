import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/app/view/pages/index.dart';
import 'package:democracy/app/view/widgets/bottom_nav_bar.dart';
import 'package:democracy/app/view/widgets/drawer.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
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
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getNotifications());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          body: SafeArea(
            child: PopScope(
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
                  BlocListener<
                    NotificationDetailCubit,
                    NotificationDetailState
                  >(
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
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    HomePage(
                      user: user,
                      notifications: unreadNotifications.length,
                    ),
                    ExplorePage(
                      user: user,
                      notifications: unreadNotifications.length,
                    ),
                    BallotPage(
                      user: user,
                      notifications: unreadNotifications.length,
                    ),
                    FormsPage(
                      user: user,
                      notifications: unreadNotifications.length,
                    ),
                    MessagePage(
                      user: user,
                      notifications: unreadNotifications.length,
                    ),
                  ],
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
