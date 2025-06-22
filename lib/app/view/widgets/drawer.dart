import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/widgets/bookmarks.dart';
import 'package:democracy/app/view/widgets/profile_page.dart';
import 'package:democracy/app/view/widgets/settings.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/auth/models/user.dart';
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
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(user.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('${user.firstName} ${user.lastName}'),
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(user: user),
                    ),
                  );
                },
                title: Text('Profile'),
                leading: Icon(Symbols.person_2_rounded),
              ),
              ListTile(
                onTap: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.loadBookmarks(user: user),
                  );
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
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Settings()));
                },
                title: Text('Settings'),
                leading: Icon(Symbols.settings_rounded),
              ),
            ],
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              switch (state) {
                case Authenticated():
                  return ListTile(
                    onTap: () {
                      context.read<LoginCubit>().logout();
                    },
                    title: Text('Logout'),
                    leading: Icon(Symbols.logout),
                  );
                default:
                  return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
