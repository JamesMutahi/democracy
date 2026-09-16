import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/autocomplete/autocomplete_bloc.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/menu_controller/menu_controller_cubit.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/sync/sync_bloc.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/scroll_forwarder.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/bottom_nav_bar.dart';
import 'package:democracy/app/view/widgets/scroll_bar.dart';
import 'package:democracy/app/view/widgets/side_menu.dart';
import 'package:democracy/broadcast/bloc/broadcast_view/broadcast_view_cubit.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/minimized.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/chat/bloc/inbox/inbox_bloc.dart';
import 'package:democracy/chat/bloc/requests/requests_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/post/bloc/draft_detail/draft_detail_bloc.dart';
import 'package:democracy/post/bloc/following_posts/following_posts_bloc.dart';
import 'package:democracy/post/bloc/for_you/for_you_bloc.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/trending_posts/trending_posts_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<NotificationsBloc>().add(NotificationsEvent.get());
        context.read<SyncBloc>().add(SyncEvent.start());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ForYouBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(
          create: (context) => FollowingPostsBloc(
            webSocketService: context.read<WebSocketService>(),
          ),
        ),
        BlocProvider(
          create: (context) => InboxBloc(
            webSocketService: context.read<WebSocketService>(),
            databaseRepository: context.read<DatabaseRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => RequestsBloc(
            webSocketService: context.read<WebSocketService>(),
            databaseRepository: context.read<DatabaseRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => TrendingPostsBloc(
            webSocketService: context.read<WebSocketService>(),
          ),
        ),
      ],
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: _Listeners(
          scaffoldKey: _scaffoldKey,
          child: kIsWeb
              ? _Web(scaffoldKey: _scaffoldKey)
              : _Mobile(scaffoldKey: _scaffoldKey),
        ),
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AutoTabsScaffold(
          scaffoldKey: scaffoldKey,
          drawer: Drawer(child: SideMenu()),
          routes: const [
            HomeRoute(),
            ExploreRoute(),
            HubWrapper(),
            ChatRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavBar(tabsRouter: tabsRouter);
          },
        ),
        BlocBuilder<BroadcastViewCubit, BroadcastViewState>(
          builder: (context, state) {
            if (state.view == BroadcastView.minimized) {
              return Positioned(
                bottom:
                    MediaQuery.of(context).padding.bottom +
                    kBottomNavigationBarHeight,
                left: 16,
                right: 16,
                child: MinimizedBroadcastBar(broadcast: state.broadcast!),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class _Web extends StatelessWidget {
  const _Web({required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    bool showExpandedSideMenu = responsive.largerOrEqualTo(expandSideMenu);

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: responsive.isMobile ? Drawer(child: SideMenu()) : null,
      body: SafeArea(
        child: Stack(
          children: [
            ScreenScrollForwarder(
              getActiveController: () => ActiveScrollController.controller,
              child: NotificationListener<ScrollMetricsNotification>(
                // Catch ScrollMetricsNotification from ANY scrollable in the app
                onNotification: (notification) {
                  ActiveScrollController.notifyMetricsChanged();
                  // Don't consume — let it bubble further if needed
                  return false;
                },
                child: Row(
                  mainAxisAlignment: kIsWeb
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: kIsWeb && !responsive.isMobile,
                      child: Flexible(
                        flex: showExpandedSideMenu ? 3 : 1,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: SideMenu(),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: showExpandedSideMenu ? 6 : 7,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 1000),
                        child: SelectionArea(child: AutoRouter()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (responsive.largerThan(MOBILE))
              Align(
                alignment: Alignment.centerRight,
                child: CustomEdgeScrollbar(
                  width: 12,
                  thumbColor: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.6),
                  trackColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.15),
                  borderRadius: 6,
                ),
              ),
            BlocBuilder<BroadcastViewCubit, BroadcastViewState>(
              builder: (context, state) {
                if (state.view == BroadcastView.minimized) {
                  return Positioned(
                    bottom: 24,
                    left: 16,
                    right: 16,
                    child: MinimizedBroadcastBar(broadcast: state.broadcast!),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Listeners extends StatelessWidget {
  const _Listeners({required this.child, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MenuControllerCubit, MenuControllerState>(
          listener: (context, state) {
            if (state.status == DrawerStatus.leftOpen) {
              scaffoldKey.currentState?.openDrawer();
            } else if (state.status == DrawerStatus.rightOpen) {
              scaffoldKey.currentState?.openEndDrawer();
            } else if (state.status == DrawerStatus.closed) {
              scaffoldKey.currentState?.closeDrawer();
            }
          },
        ),
        BlocListener<NotificationDetailBloc, NotificationDetailState>(
          listener: (context, state) {
            final bloc = context.read<NotificationsBloc>();

            if (state is NotificationCreated) {
              bloc.add(
                NotificationsEvent.add(notification: state.notification),
              );
            } else if (state is NotificationUpdated) {
              bloc.add(
                NotificationsEvent.update(notification: state.notification),
              );
            } else if (state is NotificationDeleted) {
              bloc.add(
                NotificationsEvent.remove(notificationId: state.notificationId),
              );
            }
          },
        ),
        BlocListener<PostDetailBloc, PostDetailState>(
          listener: (context, state) {
            if (state is PostDetailFailure) {
              final snackBar = getSnackBar(
                context: context,
                message: state.error,
                status: SnackBarStatus.failure,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
        BlocListener<PostCreateBloc, PostCreateState>(
          listener: (context, state) {
            if (state.status == PostCreateStatus.success) {
              String message = state.post!.replyTo == null
                  ? 'Posted'
                  : 'Reply sent';
              final snackBar = getSnackBar(
                context: context,
                message: message,
                status: SnackBarStatus.success,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
        BlocListener<DraftDetailBloc, DraftDetailState>(
          listener: (context, state) {
            if (state is DraftSaved) {
              String message = 'Post saved as draft';
              final snackBar = getSnackBar(
                context: context,
                message: message,
                status: SnackBarStatus.success,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
        BlocListener<BroadcastDetailBloc, BroadcastDetailState>(
          listener: (context, state) {
            if (state is BroadcastCreated) {
              String message = state.broadcast.type == BroadcastType.livestream
                  ? 'Starting live stream'
                  : 'Meeting created';
              final snackBar = getSnackBar(
                context: context,
                message: message,
                status: SnackBarStatus.success,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
        BlocListener<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {
            if (state is ConnectivitySuccess) {
              context.read<SyncBloc>().add(SyncEvent.start());
            }
          },
        ),
        BlocListener<PostDetailBloc, PostDetailState>(
          listener: (context, state) {
            if (state is SearchHistoryUpdated) {
              context.read<AutocompleteBloc>().add(AutocompleteEvent.redo());
            }
          },
        ),
      ],
      child: child,
    );
  }
}
