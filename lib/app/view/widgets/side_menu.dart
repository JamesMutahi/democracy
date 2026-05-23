import 'package:democracy/app/bloc/menu_controller/menu_controller_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/logo.dart';
import 'package:democracy/app/view/router/router.dart';
import 'package:democracy/app/view/widgets/bottom_nav_bar.dart'
    show CreationBottomSheet;
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final menuController = context.read<MenuControllerCubit>();
    final user = context.read<AuthBloc>().state.user!;
    final String currentPath = GoRouterState.of(context).uri.toString();

    return Drawer(
      elevation: 0.5,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (responsive.largerThan(TABLET))
                  Logo(width: 60, height: 60)
                else
                  DrawerHeader(child: ProfileImage(user: user, radius: 65)),
                if (responsive.largerThan(TABLET))
                  DrawerListTile(
                    onTap: () {
                      menuController.closeDrawer();
                      context.go(const HomeRoute().location);
                    },
                    iconData: Symbols.home_rounded,
                    title: 'Home',
                    selected: currentPath == '/',
                  ),
                if (responsive.largerThan(TABLET))
                  DrawerListTile(
                    onTap: () {
                      menuController.closeDrawer();
                      context.go(const ExploreRoute().location);
                    },
                    iconData: Symbols.search_rounded,
                    title: 'Explore',
                    selected: currentPath == '/explore',
                  ),
                if (responsive.largerThan(TABLET))
                  DrawerListTile(
                    onTap: () {
                      menuController.closeDrawer();
                      context.go(const HubRoute().location);
                    },
                    iconData: Symbols.dashboard_rounded,
                    title: 'Hub',
                    selected: currentPath == '/hub',
                  ),
                if (responsive.largerThan(TABLET))
                  DrawerListTile(
                    onTap: () {
                      menuController.closeDrawer();
                      context.go(const ChatRoute().location);
                    },
                    iconData: Symbols.chat_bubble_rounded,
                    title: 'Chat',
                    selected: currentPath == '/chat',
                  ),
                DrawerListTile(
                  onTap: () {
                    menuController.closeDrawer();
                    context.push(const NotificationsRoute().location);
                  },
                  iconData: Symbols.notifications_rounded,
                  title: 'Notifications',
                  selected: currentPath.startsWith('/notifications'),
                ),
                DrawerListTile(
                  onTap: () {
                    menuController.closeDrawer();
                    context.push(const BookmarksRoute().location);
                  },
                  iconData: Symbols.bookmark_rounded,
                  title: 'Bookmarks',
                  selected: currentPath.startsWith('/bookmarks'),
                ),
                DrawerListTile(
                  onTap: () {
                    menuController.closeDrawer();
                    context.push(const ConstitutionRoute().location);
                  },
                  iconData: Symbols.book_rounded,
                  title: 'Constitution',
                  selected: currentPath.startsWith('/constitution'),
                ),
                DrawerListTile(
                  onTap: () {
                    menuController.closeDrawer();
                    context.push(const SettingsRoute().location);
                  },
                  iconData: Symbols.settings_rounded,
                  title: 'Settings',
                  selected: currentPath.startsWith('/settings'),
                ),
                if (responsive.largerThan(TABLET))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ListTile(
                      onTap: () {
                        menuController.closeDrawer();
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SizedBox(
                              width: 250,
                              child: CreationBottomSheet(),
                            ),
                          ),
                        );
                      },
                      leading: SvgPicture.asset(
                        'assets/icons/pen.svg',
                        colorFilter: ColorFilter.mode(
                          currentPath.contains('/create')
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).colorScheme.outline,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: Text(
                        'Create',
                        style: TextStyle(
                          color: currentPath.contains('/create')
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      tileColor: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          _ProfileButton(
            menuController: menuController,
            user: user,
            currentPath: currentPath,
          ),
        ],
      ),
    );
  }
}

class _ProfileButton extends StatefulWidget {
  const _ProfileButton({
    required this.menuController,
    required this.user,
    required this.currentPath,
  });

  final MenuControllerCubit menuController;
  final User user;
  final String currentPath;

  @override
  State<_ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<_ProfileButton>
    with TickerProviderStateMixin {
  late final AnimationController _dropdownAnimationController;
  late final CurvedAnimation _dropdownAnimation;

  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _dropdownAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _dropdownAnimation = CurvedAnimation(
      parent: _dropdownAnimationController,
      curve: Curves.easeInCubic,
    );
  }

  @override
  void dispose() {
    _dropdownAnimationController.dispose();
    _dropdownAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              _selected = !_selected;
            });
            if (_dropdownAnimationController.value == 1) {
              _dropdownAnimationController.reverse();
            } else {
              _dropdownAnimationController.forward();
            }
          },
          leading: ProfileImage(user: widget.user),
          title: Text(widget.user.name, overflow: TextOverflow.ellipsis),
          subtitle: Text(
            '@${widget.user.username}',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
          trailing: AnimatedRotation(
            turns: _selected ? 0.5 : 0.0,
            duration: Duration(milliseconds: 300),
            child: Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _dropdownAnimation,
          child: Column(
            children: [
              DrawerListTile(
                onTap: () {
                  widget.menuController.closeDrawer();
                  context.push(ProfileRoute(userId: widget.user.id).location);
                },
                iconData: Symbols.person_2_rounded,
                title: 'Profile',
                selected: widget.currentPath.startsWith('/profile'),
              ),
              ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => LogoutDialog(),
                  );
                },
                textColor: Colors.red,
                iconColor: Colors.red,
                title: Text('Logout'),
                leading: Icon(Symbols.logout),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    this.onTap,
    this.iconData,
    this.selected = false,
  });

  final String title;
  final VoidCallback? onTap;
  final IconData? iconData;
  final bool selected;

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      selected: widget.selected,
      selectedTileColor: Theme.of(context).highlightColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: widget.iconData == null
          ? SizedBox.shrink()
          : Icon(
              widget.iconData,
              size: 20,
              color: widget.selected
                  ? null
                  : Theme.of(context).colorScheme.outline,
            ),
      title: Text(
        widget.title,
        style: TextStyle(
          color: widget.selected ? null : Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Log out',
      content: 'Are you sure you want to log out?',
      button1Text: 'Yes',
      onButton1Pressed: () {
        Navigator.pop(context);
        context.read<MenuControllerCubit>().closeDrawer();
        context.read<WebsocketBloc>().add(WebsocketEvent.disconnect());
        context.read<LoginCubit>().logout();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
      },
    );
  }
}
