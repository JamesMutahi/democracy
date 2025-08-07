import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/notification/view/notification_tile.dart';
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
  bool hasNextPage = false;

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getNotifications());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationsCubit, NotificationsState>(
          listener: (context, state) {
            if (state.status == NotificationsStatus.success) {
              setState(() {
                _notifications = state.notifications.toList();
                loading = false;
                failure = false;
                hasNextPage = state.hasNext;
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              });
            }
            if (state.status == NotificationsStatus.failure) {
              if (loading) {
                setState(() {
                  loading = false;
                  failure = true;
                });
              }
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
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
                    (notification) => notification.id == state.notification.id,
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
      child: Scaffold(
        appBar: AppBar(title: Text('Notifications')),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: hasNextPage,
          header: ClassicHeader(),
          controller: _refreshController,
          onRefresh: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getNotifications(),
            );
          },
          onLoading: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getNotifications(
                lastNotification: _notifications.last,
              ),
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
