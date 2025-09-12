import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/notification/view/notifications.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.user,
    required this.notifications,
    required this.middle,
    this.bottom,
  });

  final User user;
  final int notifications;
  final List<Widget> middle;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Container(
        margin: EdgeInsets.only(left: 15),
        child: ProfileImage(
          user: user,
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    ];
    widgets.addAll(middle);
    widgets.add(NotificationButton(notifications: notifications));
    return SliverAppBar(
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      forceElevated: true,
      flexibleSpace: Builder(
        builder: (context) {
          return SizedBox(
            height: 55,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widgets,
            ),
          );
        },
      ),
      bottom: bottom,
    );
  }
}

class AppBarSearchBar extends StatelessWidget {
  const AppBarSearchBar({
    super.key,
    this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController? controller;
  final String hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        child: SearchBar(
          controller: controller,
          padding: WidgetStateProperty.all(
            EdgeInsets.only(left: 15, right: 10),
          ),
          leading: Icon(Symbols.search_rounded),
          hintText: hintText,
          hintStyle: WidgetStateProperty.all(
            TextStyle(color: Theme.of(context).hintColor),
          ),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key, required this.notifications});

  final int notifications;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Notifications()),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.all(8.5),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Icon(
              Symbols.notifications_rounded,
              color: Theme.of(context).colorScheme.outline,
              size: 20,
            ),
          ),
          if (notifications > 0)
            Positioned(
              top: -1,
              right: 9,
              child: CircleAvatar(
                radius: 10,
                child: Text(
                  notifications.toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
        ],
      ),
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
                top: 0,
                right: 4,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryFixedDim,
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
