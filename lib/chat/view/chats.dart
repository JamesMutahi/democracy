import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_cubit.dart';
import 'package:democracy/chat/view/chat_detail.dart' show ChatDetail;
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chats extends StatefulWidget {
  const Chats({super.key, required this.chats, required this.currentUser});

  final List<Chat> chats;
  final User currentUser;

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  late final List<Chat> _chats = widget.chats.toList();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationDetailCubit, NotificationDetailState>(
          listener: (context, state) {
            if (state is NotificationCreated) {
              if (!_chats.any(
                (chat) => chat.id == state.notification.chat?.id,
              )) {
                setState(() {
                  _chats.insert(0, state.notification.chat!);
                });
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.subscribeChat(chat: state.notification.chat!),
                );
              }
            }
          },
        ),
        BlocListener<ChatDetailCubit, ChatDetailState>(
          listener: (context, state) {
            if (state is ChatCreated) {
              if (!_chats.any((chat) => chat.id == state.chat.id)) {
                setState(() {
                  _chats.insert(0, state.chat);
                });
              }
            }
            if (state is ChatUpdated) {
              if (_chats.any((chat) => chat.id == state.chat.id)) {
                setState(() {
                  int index = _chats.indexWhere(
                    (chat) => chat.id == state.chat.id,
                  );
                  _chats[index] = state.chat;
                });
              }
            }
            if (state is ChatDeleted) {
              if (_chats.any((element) => element.id == state.chatId)) {
                setState(() {
                  _chats.removeWhere((element) => element.id == state.chatId);
                });
              }
            }
            if (state is ChatDetailFailure) {
              final snackBar = getSnackBar(
                context: context,
                message: state.error,
                status: SnackBarStatus.failure,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
        BlocListener<MessageDetailCubit, MessageDetailState>(
          listener: (context, state) {
            if (state is MessageCreated) {
              if (_chats.any((element) => element.id == state.message.chat)) {
                setState(() {
                  int index = _chats.indexWhere(
                    (chat) => chat.id == state.message.chat,
                  );
                  _chats[index] = _chats[index].copyWith(
                    lastMessage: state.message,
                  );
                });
              }
            }
            if (state is MessageUpdated) {
              if (_chats.any((element) => element.id == state.message.chat)) {
                setState(() {
                  int chatIndex = _chats.indexWhere(
                    (chat) => chat.id == state.message.chat,
                  );
                  if (state.message.id == _chats[chatIndex].lastMessage!.id) {
                    _chats[chatIndex] = _chats[chatIndex].copyWith(
                      lastMessage: state.message,
                    );
                  }
                });
              }
            }
            if (state is MessageDetailFailure) {
              final snackBar = getSnackBar(
                context: context,
                message: state.error,
                status: SnackBarStatus.failure,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ],
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Chat chat = _chats[index];
          User otherUser = widget.currentUser;
          if (chat.users.length > 1) {
            otherUser = chat.users.firstWhere(
              (u) => u.id != widget.currentUser.id,
            );
          }
          return ChatTile(
            key: ValueKey(chat.id),
            chat: chat,
            currentUser: widget.currentUser,
            otherUser: otherUser,
          );
        },
        itemCount: _chats.length,
      ),
    );
  }
}

class ChatTile extends StatefulWidget {
  const ChatTile({
    super.key,
    required this.chat,
    required this.currentUser,
    required this.otherUser,
  });

  final Chat chat;
  final User currentUser;
  final User otherUser;

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    String lastMessagePrefix =
        widget.chat.lastMessage?.user.id == widget.currentUser.id
            ? 'You: '
            : '';
    return ListTile(
      leading: ProfileImage(user: widget.otherUser),
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: widget.otherUser.name,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
            TextSpan(
              text: ' @${widget.otherUser.username}',
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
      subtitle:
          widget.chat.lastMessage == null
              ? Text('')
              : widget.chat.lastMessage!.text.isNotEmpty
              ? _LastMessageText(
                text: '$lastMessagePrefix${widget.chat.lastMessage!.text}',
              )
              : widget.chat.lastMessage!.post != null
              ? _LastMessageText(text: '${lastMessagePrefix}Shared a post')
              : widget.chat.lastMessage!.poll != null
              ? _LastMessageText(text: '${lastMessagePrefix}Shared a poll')
              : widget.chat.lastMessage!.survey != null
              ? _LastMessageText(text: '${lastMessagePrefix}Shared a survey')
              : Text(''),
      trailing:
          widget.chat.lastMessage == null
              ? SizedBox.shrink()
              : widget.chat.lastMessage!.isRead ||
                  widget.currentUser.id == widget.chat.lastMessage!.user.id
              ? SizedBox.shrink()
              : Icon(Icons.circle_rounded, size: 10, color: Colors.greenAccent),
      onTap: () {
        if (widget.chat.lastMessage != null) {
          if (!widget.chat.lastMessage!.isRead &&
              widget.chat.lastMessage!.user.id != widget.currentUser.id) {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.markChatAsRead(chat: widget.chat),
            );
          }
        }
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => ChatDetail(
                  key: ValueKey(widget.chat.id),
                  chat: widget.chat,
                ),
          ),
        );
      },
      onLongPress: () {
        //   TODO: Show dialog for chat actions - block/delete
      },
    );
  }
}

class _LastMessageText extends StatelessWidget {
  const _LastMessageText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: Theme.of(context).disabledColor,
      ),
    );
  }
}
