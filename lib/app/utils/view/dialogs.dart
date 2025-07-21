import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
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
      onYesPressed: () {
        context.read<WebsocketBloc>().add(WebsocketEvent.blockUser(user: user));
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
      onYesPressed: () {
        context.read<WebsocketBloc>().add(WebsocketEvent.muteUser(user: user));
      },
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onYesPressed,
  });

  final String title;
  final String content;
  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title)),
      content: Text(content, textAlign: TextAlign.center),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            onYesPressed();
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}
