import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({
    super.key,
    required this.users,
    required this.selectedUsers,
    required this.loading,
    required this.failure,
    required this.refreshController,
    this.enablePullDown = false,
    required this.enablePullUp,
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
        : SmartRefresher(
          enablePullDown: enablePullDown,
          enablePullUp: enablePullUp,
          controller: refreshController,
          onRefresh: onRefresh,
          header: ClassicHeader(),
          onLoading: onLoading,
          footer: ClassicFooter(),
          child:
              users.isEmpty
                  ? NoResults(text: 'Nobody here')
                  : ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      User user = users[index];
                      return ListTile(
                        selectedTileColor: Theme.of(context).highlightColor,
                        selected: selectedUsers.contains(user),
                        leading: ProfileImage(user: user),
                        title: Text(user.name),
                        subtitle: Text("@${user.username}"),
                        trailing:
                            selectedUsers.contains(user)
                                ? Icon(Symbols.check_rounded)
                                : SizedBox.shrink(),
                        onTap: () {
                          onUserTap(user);
                        },
                      );
                    },
                    itemCount: users.length,
                  ),
        );
  }
}
