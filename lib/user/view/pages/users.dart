import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/user_listener.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UsersPage extends StatefulWidget {
  const UsersPage({super.key, required this.title, required this.users});

  final String title;
  final List<User> users;

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late List<User> _users = widget.users.toList();

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final me = authBloc.state.user!;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: UserListener(
        users: _users,
        showProfileButtons: true,
        onUsersUpdated: (users) {
          setState(() {
            _users = users;
          });
        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            User user = _users[index];
            return UserTile(
              user: user,
              me: me,
              showProfileButtons: true,
              selectedUsers: [],
              onTap: () {
                context.router.push(ProfileRoute(userId: user.id));
              },
            );
          },
          itemCount: _users.length,
        ),
      ),
    );
  }
}
