import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/no_results.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/user_listener.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({
    super.key,
    required this.users,
    this.selectedUsers = const [],
    required this.loading,
    required this.failure,
    required this.refreshController,
    this.enablePullDown = false,
    required this.enablePullUp,
    this.showProfileButtons = false,
    this.onUsersUpdated,
    required this.onUserTap,
    this.onRefresh,
    required this.onLoading,
    required this.onFailure,
  });

  final List<User> users;
  final List<User> selectedUsers;
  final bool loading;
  final bool failure;
  final RefreshController refreshController;
  final bool enablePullDown;
  final bool enablePullUp;
  final bool showProfileButtons;
  final void Function(List<User>)? onUsersUpdated;
  final void Function(User) onUserTap;
  final VoidCallback? onRefresh;
  final VoidCallback onLoading;
  final VoidCallback onFailure;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(margin: EdgeInsets.only(top: 20), child: BottomLoader())
        : failure
        ? FailureRetryButton(onPressed: onFailure)
        : BlocListener<UserDetailBloc, UserDetailState>(
            listener: (context, state) {
              if (showProfileButtons) {
                if (state is UserUpdated) {
                  if (users.any((user) => user.id == state.user.id)) {
                    int index = users.indexWhere(
                      (user) => user.id == state.user.id,
                    );
                    users[index] = state.user;
                    onUsersUpdated!(users);
                  }
                }
              }
            },
            child: UserListener(
              users: users,
              showProfileButtons: showProfileButtons,
              onUsersUpdated: onUsersUpdated,
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final me = state.user!;

                  return SmartRefresher(
                    enablePullDown: enablePullDown,
                    enablePullUp: enablePullUp,
                    controller: refreshController,
                    onRefresh: onRefresh,
                    header: ClassicHeader(),
                    onLoading: onLoading,
                    footer: ClassicFooter(),
                    child: users.isEmpty
                        ? NoResults(text: 'No results')
                        : ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              User user = users[index];
                              return UserTile(
                                user: user,
                                me: me,
                                showProfileButtons: showProfileButtons,
                                selectedUsers: selectedUsers,
                                onTap: () => onUserTap(user),
                              );
                            },
                            itemCount: users.length,
                          ),
                  );
                },
              ),
            ),
          );
  }
}
