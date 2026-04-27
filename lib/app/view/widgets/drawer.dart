import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/view/widgets/bookmarks.dart';
import 'package:democracy/constitution/view/constitution.dart';
import 'package:democracy/app/view/widgets/settings.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/post/bloc/draft_post/draft_post_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(children: [ProfileImage(user: user, radius: 65)]),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  navigateToProfilePage(context: context, user: user);
                },
                title: Text('Profile'),
                leading: Icon(Symbols.person_2_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Bookmarks(user: user),
                    ),
                  );
                },
                title: Text('Bookmarks'),
                leading: Icon(Symbols.bookmarks_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Constitution()),
                  );
                },
                title: Text('Constitution'),
                leading: Icon(Symbols.book_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Settings()));
                },
                title: Text('Settings'),
                leading: Icon(Symbols.settings_rounded),
              ),
            ],
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => LogoutDialog(),
              );
            },
            title: Text('Logout'),
            leading: Icon(Symbols.logout),
          ),
        ],
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
        context.read<WebsocketBloc>().add(WebsocketEvent.disconnect());
        context.read<DraftPostBloc>().add(DraftPostEvent.clear());
        context.read<LoginCubit>().logout();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
      },
    );
  }
}
