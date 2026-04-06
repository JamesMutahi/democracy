import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
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
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<NotificationsBloc>().add(NotificationsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actionsPadding: EdgeInsets.only(right: 10),
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
                  NotificationsEvent.remove(
                    notificationId: state.notificationId,
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            switch (state.status) {
              case NotificationsStatus.success:
                final notifications = state.notifications;
                return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: false,
                  header: ClassicHeader(),
                  controller: _refreshController,
                  onRefresh: () {
                    context.read<NotificationsBloc>().add(
                      NotificationsEvent.get(),
                    );
                  },
                  footer: ClassicFooter(),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (BuildContext context, int index) {
                      n_.Notification notification = notifications[index];
                      return NotificationTile(notification: notification);
                    },
                    itemCount: notifications.length,
                  ),
                );
              case NotificationsStatus.failure:
                return FailureRetryButton(
                  onPressed: () {
                    context.read<NotificationsBloc>().add(
                      NotificationsEvent.get(),
                    );
                  },
                );
              default:
                return BottomLoader();
            }
          },
        ),
      ),
    );
  }
}
