import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/notification/view/notification_tile.dart';
import 'package:democracy/notification/view/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool loading = true;
  bool failure = false;
  List<n_.Notification> _notifications = [];
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getNotifications());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actionsPadding: EdgeInsets.only(right: 15),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreferencesPage()),
              );
            },
            icon: Icon(Icons.tune_rounded),
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<NotificationsCubit, NotificationsState>(
            listener: (context, state) {
              if (state is NotificationsLoaded) {
                setState(() {
                  _notifications = state.notifications.toList();
                  loading = false;
                  failure = false;
                });
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
              }
              if (state is NotificationsLoaded) {
                if (loading) {
                  setState(() {
                    loading = false;
                    failure = true;
                  });
                }
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
              }
            },
          ),
          BlocListener<NotificationDetailCubit, NotificationDetailState>(
            listener: (context, state) {
              if (state is NotificationCreated) {
                if (!_notifications.any(
                  (notification) => notification.id == state.notification.id,
                )) {
                  setState(() {
                    _notifications.add(state.notification);
                  });
                }
              }
              if (state is NotificationUpdated) {
                if (_notifications.any(
                  (notification) => notification.id == state.notification.id,
                )) {
                  setState(() {
                    int index = _notifications.indexWhere(
                      (notification) =>
                          notification.id == state.notification.id,
                    );
                    _notifications[index] = state.notification;
                  });
                }
              }
              if (state is NotificationDeleted) {
                if (_notifications.any(
                  (notification) => notification.id == state.notificationId,
                )) {
                  setState(() {
                    _notifications.removeWhere(
                      (notification) => notification.id == state.notificationId,
                    );
                  });
                }
              }
            },
          ),
        ],
        child:
            loading
                ? BottomLoader()
                : failure
                ? FailureRetryButton(
                  onPressed: () {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.getNotifications(),
                    );
                  },
                )
                : SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: false,
                  header: ClassicHeader(),
                  controller: _refreshController,
                  onRefresh: () {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.getNotifications(),
                    );
                  },
                  footer: ClassicFooter(),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (BuildContext context, int index) {
                      n_.Notification notification = _notifications[index];
                      return NotificationTile(notification: notification);
                    },
                    itemCount: _notifications.length,
                  ),
                ),
      ),
    );
  }
}
