import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/notification/view/notifications.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key, required this.user, required this.extras});

  final User user;
  final List<Widget> extras;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      InkWell(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: ProfileImage(user: user),
      ),
    ];
    widgets.addAll(extras);
    widgets.add(NotificationButton());
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgets,
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
