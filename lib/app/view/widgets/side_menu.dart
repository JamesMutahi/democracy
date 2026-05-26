import 'package:democracy/app/bloc/menu_controller/menu_controller_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/logo.dart';
import 'package:democracy/app/view/router/router.dart';
import 'package:democracy/app/view/widgets/bottom_nav_bar.dart'
    show CreationBottomSheet;
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/foundation.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            // Prevents bounce physics from breaking layout constraints
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false, // Allows content to define its own height
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
                              margin: const EdgeInsets.only(left: 11, top: 5),
                              child: const Logo(width: 40, height: 40),
                            )
                          else
                            DrawerHeader(
                              child: ProfileImage(user: user, radius: 65),
                            ),
                          if (kIsWeb) ...[
                            DrawerListTile(
                              onTap: () {
                                menuController.closeDrawer();
                                context.go(const HomeRoute().location);
                              },
                              iconData: Symbols.home_rounded,
                              title: 'Home',
                              selected: currentPath == '/',
                            ),
                            DrawerListTile(
                              onTap: () {
                                menuController.closeDrawer();
                                context.go(const ExploreRoute().location);
                              },
                              iconData: Symbols.search_rounded,
                              title: 'Explore',
                              selected: currentPath == '/explore',
                            ),
                            DrawerListTile(
                              onTap: () {
                                menuController.closeDrawer();
                                context.go(const HubRoute().location);
                              },
                              iconData: Symbols.dashboard_rounded,
                              title: 'Hub',
                              selected: currentPath == '/hub',
                            ),
                            DrawerListTile(
                              onTap: () {
                                menuController.closeDrawer();
                                context.go(const ChatRoute().location);
                              },
                              iconData: Symbols.chat_bubble_rounded,
                              title: 'Chat',
                              selected: currentPath == '/chat',
                            ),
                          ],
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
                          if (kIsWeb)
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
                                        currentPath.contains('/create')
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(
                                                context,
                                              ).colorScheme.outline,
                                      ),
                                      title: Text(
                                        'Create',
                                        style: TextStyle(
                                          color: currentPath.contains('/create')
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(
                                                  context,
                                                ).colorScheme.outline,
                                        ),
                                      ),
                                      tileColor: Theme.of(
                                        context,
                                      ).colorScheme.primaryContainer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                      currentPath: currentPath,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          Dialog(child: SizedBox(width: 250, child: CreationBottomSheet())),
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

    return kIsWeb && responsive.smallerThan(expandSideMenu)
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
        context.push(ProfileRoute(userId: widget.user.id).location);
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

    return responsive.smallerThan(expandSideMenu)
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
