import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockDialog extends StatelessWidget {
  const BlockDialog({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Block @${user.username}?',
      content:
          'They will no longer be able to engage with your posts '
          'or message you. You will also not receive '
          'notifications from them.',
      button1Text: 'Yes',
      onButton1Pressed: () {
        context.read<UserDetailBloc>().add(UserDetailEvent.block(user: user));
        Navigator.pop(context);
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class MuteDialog extends StatelessWidget {
  const MuteDialog({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Mute @${user.username}?',
      content:
          'You will not see their posts on your timeline. '
          'You will continue receiving notifications. '
          'They will not know they have been muted.',
      button1Text: 'Yes',
      onButton1Pressed: () {
        context.read<UserDetailBloc>().add(UserDetailEvent.mute(user: user));
        Navigator.pop(context);
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.button1Text,
    required this.onButton1Pressed,
    required this.button2Text,
    required this.onButton2Pressed,
  });

  final String title;
  final String content;
  final String button1Text;
  final VoidCallback onButton1Pressed;
  final String button2Text;
  final VoidCallback onButton2Pressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title)),
      content: Text(content, textAlign: TextAlign.center),
      actions: <Widget>[
        OutlinedButton(onPressed: onButton1Pressed, child: Text(button1Text)),
        OutlinedButton(onPressed: onButton2Pressed, child: Text(button2Text)),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}
