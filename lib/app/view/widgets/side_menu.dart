import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/menu_controller/menu_controller_cubit.dart';
import 'package:democracy/app/bloc/route/route_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/logo.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/creation_bottom_sheet.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final menuController = context.read<MenuControllerCubit>();
    final user = context.read<AuthBloc>().state.user!;

    return BlocBuilder<RouteCubit, String>(
      builder: (context, currentRoute) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return CustomScrollView(
                // Prevents bounce physics from breaking layout constraints
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    // Allows content to define its own height
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (kIsWeb)
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 11,
                                    top: 5,
                                  ),
                                  child: const Logo(width: 40, height: 40),
                                )
                              else
                                DrawerHeader(
                                  child: Center(
                                    child: Logo(width: 250, height: 250),
                                  ),
                                ),
                              if (kIsWeb) ...[
                                DrawerListTile(
                                  onTap: () {
                                    menuController.closeDrawer();
                                    context.navigateTo(const HomeRoute());
                                  },
                                  iconData: Symbols.home_rounded,
                                  title: 'Home',
                                  selected: currentRoute == HomeRoute.name,
                                ),
                                DrawerListTile(
                                  onTap: () {
                                    menuController.closeDrawer();
                                    context.navigateTo(const ExploreRoute());
                                  },
                                  iconData: Symbols.search_rounded,
                                  title: 'Explore',
                                  selected: currentRoute == ExploreRoute.name,
                                ),
                                DrawerListTile(
                                  onTap: () {
                                    menuController.closeDrawer();
                                    context.navigateTo(const Hub());
                                  },
                                  iconData: Symbols.dashboard_rounded,
                                  title: 'Hub',
                                  selected: currentRoute == Hub.name,
                                ),
                                DrawerListTile(
                                  onTap: () {
                                    menuController.closeDrawer();
                                    context.navigateTo(const ChatRoute());
                                  },
                                  iconData: Symbols.chat_bubble_rounded,
                                  title: 'Chat',
                                  selected: currentRoute == ChatRoute.name,
                                ),
                              ],
                              DrawerListTile(
                                onTap: () {
                                  menuController.closeDrawer();
                                  if (currentRoute != Notifications.name) {
                                    context.router.push(const Notifications());
                                  }
                                },
                                iconData: Symbols.notifications_rounded,
                                title: 'Notifications',
                                selected: currentRoute == Notifications.name,
                              ),
                              DrawerListTile(
                                onTap: () {
                                  menuController.closeDrawer();
                                  if (currentRoute != Bookmarks.name) {
                                    context.router.push(const Bookmarks());
                                  }
                                },
                                iconData: Symbols.bookmark_rounded,
                                title: 'Bookmarks',
                                selected: currentRoute == Bookmarks.name,
                              ),
                              DrawerListTile(
                                onTap: () {
                                  menuController.closeDrawer();
                                  if (currentRoute != Constitution.name) {
                                    context.router.push(
                                      Constitution(selectionMode: false),
                                    );
                                  }
                                },
                                iconData: Symbols.book_rounded,
                                title: 'Constitution',
                                selected: currentRoute == Constitution.name,
                              ),
                              DrawerListTile(
                                onTap: () {
                                  menuController.closeDrawer();
                                  if (currentRoute != Settings.name) {
                                    context.router.push(const Settings());
                                  }
                                },
                                iconData: Symbols.settings_rounded,
                                title: 'Settings',
                                selected: currentRoute == Settings.name,
                              ),
                              if (kIsWeb)
                                !responsive.isMobile &&
                                        responsive.smallerThan(expandSideMenu)
                                    ? IconButton.filledTonal(
                                        onPressed: () {
                                          _showCreateDialog(context);
                                        },
                                        padding: const EdgeInsets.all(10),
                                        icon: _buildCreateIcon(
                                          context,
                                          Theme.of(context).primaryColor,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0,
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            menuController.closeDrawer();
                                            _showCreateDialog(context);
                                          },
                                          leading: _buildCreateIcon(
                                            context,
                                            currentRoute.toLowerCase().contains(
                                                  'create',
                                                )
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(
                                                    context,
                                                  ).colorScheme.outline,
                                          ),
                                          title: Text(
                                            'Create',
                                            style: TextStyle(
                                              color:
                                                  currentRoute
                                                      .toLowerCase()
                                                      .contains('create')
                                                  ? Theme.of(
                                                      context,
                                                    ).primaryColor
                                                  : Theme.of(
                                                      context,
                                                    ).colorScheme.outline,
                                            ),
                                          ),
                                          tileColor: Theme.of(
                                            context,
                                          ).colorScheme.primaryContainer,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                            ],
                          ),
                        ),
                        // Adds a buffer above the profile button when scrolling kicks in
                        const SizedBox(height: 20),
                        _ProfileButton(
                          menuController: menuController,
                          user: user,
                          currentPath: currentRoute,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          Dialog(child: SizedBox(width: 250, child: CreationButtons())),
    );
  }

  Widget _buildCreateIcon(BuildContext context, Color color) {
    return SvgPicture.asset(
      'assets/icons/pen.svg',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
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
  final _menuController = MenuController();

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
    final responsive = ResponsiveBreakpoints.of(context);

    return kIsWeb &&
            !responsive.isMobile &&
            responsive.smallerThan(expandSideMenu)
        ? MenuAnchor(
            controller: _menuController,
            builder: (context, controller, child) {
              return GestureDetector(
                onTap: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: ProfileImage(user: widget.user),
              );
            },
            menuChildren: [
              _buildProfileButton(
                onTap: () {
                  _menuController.close();
                },
              ),
              _buildLogoutButton(
                onTap: () {
                  _menuController.close();
                },
              ),
            ],
          )
        : Column(
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
                    _buildProfileButton(
                      onTap: () {
                        _dropdownAnimationController.reverse();
                      },
                    ),
                    _buildLogoutButton(
                      onTap: () {
                        _dropdownAnimationController.reverse();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  Widget _buildProfileButton({required VoidCallback onTap}) {
    return ListTile(
      onTap: () {
        onTap();
        if (!kIsWeb) {
          widget.menuController.closeDrawer();
        }
        context.router.push(ProfileRoute(userId: widget.user.id));
      },
      leading: Icon(Symbols.person_2_rounded),
      title: Text('Profile'),
      selected: widget.currentPath.startsWith('/profile'),
    );
  }

  Widget _buildLogoutButton({required VoidCallback onTap}) {
    return ListTile(
      onTap: () {
        onTap();
        if (!kIsWeb) {
          widget.menuController.closeDrawer();
        }
        showDialog(context: context, builder: (context) => LogoutDialog());
      },
      textColor: Colors.red,
      iconColor: Colors.red,
      title: Text('Logout'),
      leading: Icon(Symbols.logout),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.iconData,
    this.selected = false,
  });

  final String title;
  final VoidCallback onTap;
  final IconData iconData;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return kIsWeb &&
            responsive.smallerThan(expandSideMenu) &&
            !responsive.isMobile
        ? Container(
            margin: EdgeInsets.only(bottom: 5),
            child: IconButton(
              onPressed: onTap,
              padding: EdgeInsets.all(10),
              icon: Icon(
                iconData,
                size: 25,
                color: selected ? null : Theme.of(context).colorScheme.outline,
              ),
              tooltip: title,
            ),
          )
        : ListTile(
            onTap: onTap,
            selected: selected,
            selectedTileColor: Theme.of(context).highlightColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: Icon(
              iconData,
              size: 20,
              color: selected ? null : Theme.of(context).colorScheme.outline,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: selected ? null : Theme.of(context).colorScheme.outline,
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
        context.router.popTop();
        context.read<MenuControllerCubit>().closeDrawer();
        context.read<WebsocketBloc>().add(WebsocketEvent.disconnect());
        context.read<LoginCubit>().logout();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        context.router.popTop();
      },
    );
  }
}
