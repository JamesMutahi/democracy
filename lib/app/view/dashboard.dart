import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/pages/index.dart';
import 'package:democracy/app/view/widgets/bottom_nav_bar.dart';
import 'package:democracy/app/view/widgets/drawer.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();

  DateTime? _lastBackPressTime;
  bool _canPopNow = false;
  final int _backPressTimeout = 2; // seconds

  List<n_.Notification> _unreadNotifications = [];

  @override
  void initState() {
    super.initState();
    context.read<NotificationsBloc>().add(NotificationsEvent.get());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Handle double back press to exit
  void _onPopInvoked(bool didPop) {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.closeDrawer();
      return;
    }

    final now = DateTime.now();
    final isDoublePress =
        _lastBackPressTime != null &&
        now.difference(_lastBackPressTime!) <
            Duration(seconds: _backPressTimeout);

    if (isDoublePress) {
      // Allow app to exit
      setState(() => _canPopNow = true);
    } else {
      _lastBackPressTime = now;
      setState(() => _canPopNow = true);

      final snackBar = getSnackBar(
        context: context,
        message: 'Press back again to close',
        status: SnackBarStatus.info,
      );

      final controller = ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(snackBar);

      // Auto-dismiss snackbar and reset after timeout
      Future.delayed(Duration(seconds: _backPressTimeout), () {
        if (mounted) {
          controller.clearSnackBars();
          setState(() => _canPopNow = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState is Authenticated ? authState.user : null;

        return Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          drawer: AppDrawer(user: user!),
          body: SafeArea(
            child: PopScope(
              canPop: _canPopNow,
              onPopInvokedWithResult: (didPop, _) => _onPopInvoked(didPop),
              child: MultiBlocListener(
                listeners: [
                  // Bottom Navigation
                  BlocListener<BottomNavBarCubit, BottomNavBarState>(
                    listener: (context, state) {
                      if (state is BottomNavBarPageChanged) {
                        _pageController.jumpToPage(state.page);
                      }
                    },
                  ),

                  // Notifications list updates
                  BlocListener<NotificationsBloc, NotificationsState>(
                    listener: (context, state) {
                      if (state.status == NotificationsStatus.success) {
                        setState(() {
                          _unreadNotifications = state.notifications
                              .where((n) => !n.isRead)
                              .toList();
                        });
                      }
                    },
                  ),

                  // Real-time notification changes
                  BlocListener<NotificationDetailBloc, NotificationDetailState>(
                    listener: (context, state) {
                      setState(() {
                        _handleNotificationUpdate(state);
                      });
                    },
                  ),
                ],
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    HomePage(
                      user: user,
                      notifications: _unreadNotifications.length,
                    ),
                    ExplorePage(
                      user: user,
                      notifications: _unreadNotifications.length,
                    ),
                    MeetingsPage(
                      user: user,
                      notifications: _unreadNotifications.length,
                    ),
                    BallotPage(
                      user: user,
                      notifications: _unreadNotifications.length,
                    ),
                    FormsPage(
                      user: user,
                      notifications: _unreadNotifications.length,
                    ),
                    MessagePage(
                      user: user,
                      notifications: _unreadNotifications.length,
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

  void _handleNotificationUpdate(NotificationDetailState state) {
    if (state is NotificationCreated) {
      _unreadNotifications.add(state.notification);
    } else if (state is NotificationUpdated) {
      final index = _unreadNotifications.indexWhere(
        (n) => n.id == state.notification.id,
      );

      if (index != -1) {
        if (state.notification.isRead) {
          _unreadNotifications.removeAt(index);
        } else {
          _unreadNotifications[index] = state.notification;
        }
      }
    } else if (state is NotificationDeleted) {
      _unreadNotifications.removeWhere((n) => n.id == state.notificationId);
    }
  }
}
