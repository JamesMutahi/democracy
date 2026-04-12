import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_buttons.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    required this.me,
    required this.showProfileButtons,
    required this.selectedUsers,
    this.onTap,
  });

  final User user;
  final User me;
  final bool showProfileButtons;
  final List<User> selectedUsers;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Theme.of(context).highlightColor,
      selected: selectedUsers.contains(user),
      leading: ProfileImage(user: user),
      title: Text(user.name),
      subtitle: Text("@${user.username}"),
      trailing: showProfileButtons
          ? me.id == user.id
                ? SizedBox.shrink()
                : user.isBlocked
                ? BlockedButton(user: user)
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (user.isMuted)
                        Row(
                          children: [
                            MutedButton(user: user),
                            SizedBox(width: 7),
                          ],
                        ),
                      FollowButton(user: user),
                    ],
                  )
          : (selectedUsers.contains(user)
                ? Icon(Symbols.check_rounded)
                : SizedBox.shrink()),
      onTap: onTap,
    );
  }
}
