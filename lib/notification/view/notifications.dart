import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/notification/view/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        switch (state) {
          case NotificationsLoaded(:final notifications):
            return NotificationList(
              key: UniqueKey(),
              notifications: notifications,
            );
          case NotificationsFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.getNotifications(),
                );
              },
            );
          default:
            return BottomLoader();
        }
      },
    );
  }
}

class NotificationList extends StatefulWidget {
  const NotificationList({super.key, required this.notifications});

  final List<n_.Notification> notifications;

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  late final List<n_.Notification> _notifications =
      widget.notifications.toList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationDetailCubit, NotificationDetailState>(
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
      child: Scaffold(
        appBar: AppBar(title: Text('Notifications')),
        body:
            _notifications.isEmpty
                ? NoResults(text: 'No notifications')
                : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    n_.Notification notification = _notifications[index];
                    return NotificationTile(
                      key: ValueKey(notification.id),
                      notification: notification,
                    );
                  },
                  itemCount: _notifications.length,
                ),
      ),
    );
  }
}
