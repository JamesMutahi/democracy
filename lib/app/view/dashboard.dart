import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/pages/index.dart';
import 'package:democracy/app/view/widgets/bottom_nav_bar.dart';
import 'package:democracy/app/view/widgets/drawer.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/notification/view/notifications.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

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
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: ProfileImage(user: user),
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                ),
                NotificationButton(),
              ],
            ),
          ),
          drawer: AppDrawer(user: user),
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
                  SurveyPage(),
                  MessagePage(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          splashColor: Theme.of(context).colorScheme.secondaryFixedDim,
          onTap: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getNotifications(),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notifications()),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8.5),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).disabledColor),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Icon(
              Symbols.notifications_rounded,
              color: Theme.of(context).colorScheme.outline,
              size: 20,
            ),
          ),
        ),
        NotificationCount(),
      ],
    );
  }
}

class NotificationCount extends StatefulWidget {
  const NotificationCount({super.key});

  @override
  State<NotificationCount> createState() => _NotificationCountState();
}

class _NotificationCountState extends State<NotificationCount> {
  List<n_.Notification> unreadNotifications = [];
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
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
      child:
          unreadNotifications.isEmpty
              ? SizedBox.shrink()
              : Positioned(
                top: -4,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    unreadNotifications.length.toString(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
    );
  }
}
