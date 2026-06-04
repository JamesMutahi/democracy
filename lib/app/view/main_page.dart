import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/menu_controller/menu_controller_cubit.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/route/route_cubit.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/sync/sync_bloc.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/bottom_nav_bar.dart';
import 'package:democracy/app/view/widgets/side_menu.dart';
import 'package:democracy/app/view/widgets/side_panel.dart';
import 'package:democracy/chat/bloc/chats/chats_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/post/bloc/draft_post/draft_post_bloc.dart';
import 'package:democracy/post/bloc/following_posts/following_posts_bloc.dart';
import 'package:democracy/post/bloc/for_you/for_you_bloc.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/trending_posts/trending_posts_bloc.dart';
import 'package:democracy/user/bloc/follow_recommendations/follow_recommendations_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SyncBloc(
            apiRepository: context.read<APIRepository>(),
            databaseRepository: context.read<DatabaseRepository>(),
          )..add(SyncEvent.start()),
          lazy: false,
        ),
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
          create: (context) => ChatsBloc(
            webSocketService: context.read<WebSocketService>(),
            databaseRepository: context.read<DatabaseRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => TrendingPostsBloc(
            webSocketService: context.read<WebSocketService>(),
          ),
        ),
        BlocProvider(
          create: (context) => FollowRecommendationsBloc(
            webSocketService: context.read<WebSocketService>(),
          ),
        ),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: Drawer(child: SideMenu()),
        body: SafeArea(
          child: MultiBlocListener(
            listeners: [
              BlocListener<MenuControllerCubit, MenuControllerState>(
                listener: (context, state) {
                  if (state.status == DrawerStatus.leftOpen) {
                    _scaffoldKey.currentState?.openDrawer();
                  } else if (state.status == DrawerStatus.rightOpen) {
                    _scaffoldKey.currentState?.openEndDrawer();
                  } else if (state.status == DrawerStatus.closed) {
                    _scaffoldKey.currentState?.closeDrawer();
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
                      NotificationsEvent.update(
                        notification: state.notification,
                      ),
                    );
                  } else if (state is NotificationDeleted) {
                    bloc.add(
                      NotificationsEvent.remove(
                        notificationId: state.notificationId,
                      ),
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
              BlocListener<DraftPostBloc, DraftPostState>(
                listener: (context, state) {
                  if (state is DraftPostSaved) {
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
              BlocListener<MeetingDetailBloc, MeetingDetailState>(
                listener: (context, state) {
                  if (state is MeetingCreated) {
                    String message = state.meeting.isLiveStream
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
            ],
            child: Row(
              mainAxisAlignment: kIsWeb
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                if (kIsWeb)
                  Flexible(
                    flex: responsive.largerOrEqualTo(expandSideMenu) ? 3 : 1,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: SideMenu(),
                    ),
                  ),
                Flexible(
                  flex: responsive.largerOrEqualTo(expandSideMenu) ? 5 : 6,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 600),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: responsive.isMobile
                              ? Colors.transparent
                              : Theme.of(context).colorScheme.outlineVariant,
                        ),
                        right: BorderSide(
                          color: responsive.isMobile
                              ? Colors.transparent
                              : Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: AutoRouter(),
                    ),
                  ),
                ),
                if (responsive.largerOrEqualTo(expandSidePanel))
                  Flexible(flex: 3, child: SidePanel()),
              ],
            ),
          ),
        ),
        bottomNavigationBar: !kIsWeb && responsive.isMobile
            ? BlocBuilder<RouteCubit, String>(
                builder: (context, currentRoute) {
                  List routes = [
                    HomeRoute.name,
                    ExploreRoute.name,
                    CreationBottomSheet.name,
                    Hub.name,
                    ChatRoute.name,
                  ];
                  if (routes.contains(currentRoute)) {
                    return BottomNavBar();
                  } else {
                    return SizedBox.shrink();
                  }
                },
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
