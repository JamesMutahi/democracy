import 'package:auto_route/auto_route.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
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
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<UserDetailBloc>().add(UserDetailEvent.block(user: user));
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
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
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<UserDetailBloc>().add(UserDetailEvent.mute(user: user));
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class PinPostDialog extends StatelessWidget {
  const PinPostDialog({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: post.isPinned
          ? 'Unpin from your profile?'
          : 'Pin to your profile?',
      content: post.isPinned
          ? 'Post will not be pinned at the top of your profile.'
          : 'Post will be pinned at the top of your profile.',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<PostDetailBloc>().add(PostDetailEvent.pin(post: post));
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class MutePostDialog extends StatelessWidget {
  const MutePostDialog({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Mute conversation?',
      content: 'You will not receive notifications from this post.',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<PostDetailBloc>().add(PostDetailEvent.mute(post: post));
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.textButtonText,
    required this.onTextButtonPressed,
    required this.elevatedButtonText,
    required this.onElevatedButtonPressed,
  });

  final String title;
  final String content;
  final String textButtonText;
  final VoidCallback onTextButtonPressed;
  final String elevatedButtonText;
  final VoidCallback onElevatedButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: onTextButtonPressed,
          child: Text(textButtonText, style: TextStyle(color: Colors.red)),
        ),
        ElevatedButton(
          onPressed: onElevatedButtonPressed,
          child: Text(elevatedButtonText),
        ),
      ],
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}
