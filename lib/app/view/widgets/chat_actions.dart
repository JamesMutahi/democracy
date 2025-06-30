import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/chat_actions/chat_actions_cubit.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class ChatActions extends StatelessWidget {
  const ChatActions({
    super.key,
    required this.chats,
    required this.currentUser,
  });

  final List<Chat> chats;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackButton(
          onPressed: () {
            context.read<ChatActionsCubit>().closeActionButtons();
          },
        ),
        Row(
          children: [
            (chats.length == 1)
                ? chats.first.blocker == null ||
                        chats.first.blocker?.id == currentUser.id
                    ? IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => BlockDialog(
                                title:
                                    chats.first.blocker == null
                                        ? 'Block user'
                                        : 'Unblock user',
                                subtitle:
                                    chats.first.blocker == null
                                        ? 'Are you sure you want to block this user'
                                        : 'Are you sure you want to unblock this user',
                                onYesPressed: () {
                                  context.read<WebsocketBloc>().add(
                                    WebsocketEvent.userBlocked(
                                      user: chats.first.users.firstWhere(
                                        (user) => user.id != currentUser.id,
                                      ),
                                    ),
                                  );
                                  context
                                      .read<ChatActionsCubit>()
                                      .closeActionButtons();
                                  Navigator.pop(context);
                                },
                              ),
                        );
                      },
                      icon:
                          chats.first.blocker == null
                              ? Icon(Symbols.block)
                              : Icon(
                                Symbols.block,
                                color: Theme.of(context).colorScheme.error,
                              ),
                    )
                    : SizedBox.shrink()
                : SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}

class BlockDialog extends StatelessWidget {
  const BlockDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onYesPressed,
  });

  final String title;
  final String subtitle;
  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.warning_amber_rounded, size: 40),
      iconColor: Colors.amber,
      title: Text(title),
      content: Text(subtitle, textAlign: TextAlign.center),
      actions: <Widget>[
        OutlinedButton(onPressed: onYesPressed, child: const Text('Yes')),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}
