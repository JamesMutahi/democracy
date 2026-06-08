import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/menu_controller/menu_controller_cubit.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.middle, this.bottom});

  final Widget middle;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [DrawerOpener()];
    widgets.add(middle);
    widgets.add(NotificationButton());
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

class DrawerOpener extends StatelessWidget {
  const DrawerOpener({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user!;

    return Container(
      margin: EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          context.read<MenuControllerCubit>().openDrawer();
        },
        child: ProfileImage(user: user),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.controller,
    required this.hintText,
    this.filterCount = 0,
    this.onTap,
    this.onTapOutside,
    this.onChanged,
    this.onSubmitted,
    this.onFilterTap,
  });

  final TextEditingController? controller;
  final String hintText;
  final int filterCount;
  final VoidCallback? onTap;
  final VoidCallback? onTapOutside;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).disabledColor;
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: SearchBar(
        controller: controller,
        padding: WidgetStateProperty.all(EdgeInsets.only(left: 15)),
        leading: Icon(Symbols.search_rounded, color: color),
        trailing: [
          if (onFilterTap != null)
            Stack(
              children: [
                IconButton(
                  onPressed: onFilterTap,
                  icon: Icon(Icons.tune_rounded, color: color),
                ),
                filterCount == 0
                    ? SizedBox.shrink()
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          filterCount.toString(),
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(color: color),
                        ),
                      ),
              ],
            ),
        ],
        hintText: hintText,
        hintStyle: WidgetStateProperty.all(
          TextStyle(color: Theme.of(context).hintColor),
        ),
        onTapOutside: (event) {
          onTapOutside?.call();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.router.push(Notifications());
          },
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.all(8.5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Icon(
                  Icons.notifications_rounded,
                  color: Theme.of(context).colorScheme.outline,
                  size: 20,
                ),
              ),
              if (state.unreadCount > 0)
                Positioned(
                  right: 10,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Makes it a circle
                    ),
                    constraints: BoxConstraints(minWidth: 18, minHeight: 18),
                    child: Text(
                      state.unreadCount.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
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
        BlocListener<NotificationsBloc, NotificationsState>(
          listener: (context, state) {
            if (state.status == NotificationsStatus.success) {
              setState(() {
                unreadNotifications = state.notifications
                    .where((n) => n.isRead == false)
                    .toList();
              });
            }
          },
        ),
        BlocListener<NotificationDetailBloc, NotificationDetailState>(
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
      child: unreadNotifications.isEmpty
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
