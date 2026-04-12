import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListener extends StatelessWidget {
  const UserListener({
    super.key,
    required this.users,
    required this.showProfileButtons,
    this.onUsersUpdated,
    required this.child,
  });

  final List<User> users;
  final bool showProfileButtons;
  final void Function(List<User>)? onUsersUpdated;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDetailBloc, UserDetailState>(
      listener: (context, state) {
        if (showProfileButtons) {
          if (state is UserUpdated) {
            if (users.any((user) => user.id == state.user.id)) {
              int index = users.indexWhere((user) => user.id == state.user.id);
              users[index] = state.user;
              onUsersUpdated?.call(users);
            }
          }
        }
      },
      child: child,
    );
  }
}
