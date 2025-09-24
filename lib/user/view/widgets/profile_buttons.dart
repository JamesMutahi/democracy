import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class BlockedButton extends StatelessWidget {
  const BlockedButton({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.red)),
      onPressed: () {
        context.read<UserDetailBloc>().add(UserDetailEvent.block(user: user));
      },
      child: Text('Blocked', style: TextStyle(color: Colors.red)),
    );
  }
}

class MutedButton extends StatelessWidget {
  const MutedButton({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ProfileButton(
      icon: Icon(Symbols.volume_off_rounded, color: Colors.red),
      onTap: () {
        context.read<UserDetailBloc>().add(UserDetailEvent.mute(user: user));
      },
    );
  }
}

class MessageButton extends StatelessWidget {
  const MessageButton({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ProfileButton(
      icon:
          user.hasBlocked
              ? Icon(
                Symbols.email_rounded,
                color: Theme.of(context).disabledColor,
              )
              : Icon(Symbols.email_rounded),
      onTap:
          user.hasBlocked
              ? () {
                final snackBar = getSnackBar(
                  context: context,
                  message: 'Blocked',
                  status: SnackBarStatus.failure,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              : () {
                context.read<ChatDetailBloc>().add(
                  ChatDetailEvent.create(user: user),
                );
              },
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ProfileButton(
      icon:
          user.isNotifying
              ? Icon(Symbols.notifications_active_rounded)
              : Icon(Symbols.notifications_off_rounded),
      onTap: () {
        context.read<NotificationDetailBloc>().add(
          NotificationDetailEvent.changeStatus(user: user),
        );
      },
    );
  }
}

class FollowButton extends StatelessWidget {
  const FollowButton({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.read<UserDetailBloc>().add(UserDetailEvent.follow(user: user));
      },
      child: Text(user.isFollowed ? 'Unfollow' : 'Follow'),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key, required this.icon, required this.onTap});

  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).colorScheme.outline),
        ),
        child: icon,
      ),
    );
  }
}
