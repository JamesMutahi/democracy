import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/chat_actions/chat_actions_cubit.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/chat_detail.dart';
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
    return BlocListener<ChatDetailCubit, ChatDetailState>(
      listener: (context, state) {
        if (state is ChatCreated) {
          if (!_chats.any((chat) => chat.id == state.chat.id)) {
            setState(() {
              _chats.add(state.chat);
            });
          }
        }
        if (state is ChatUpdated) {
          if (_chats.any((chat) => chat.id == state.chat.id)) {
            setState(() {
              int index = _chats.indexWhere((chat) => chat.id == state.chat.id);
              _chats[index] = state.chat;
            });
          }
        }
        if (state is MessageCreated) {
          if (_chats.any((element) => element.id == state.message.chat)) {
            setState(() {
              int index = _chats.indexWhere(
                (chat) => chat.id == state.message.chat,
              );
              _chats[index] = _chats[index].copyWith(
                lastMessage: state.message,
              );
              List<Message> newMessages = _chats[index].messages.toList();
              newMessages.add(state.message);
              _chats[index] = _chats[index].copyWith(messages: newMessages);
            });
          }
        }
        if (state is MessageUpdated) {
          if (_chats.any((element) => element.id == state.message.chat)) {
            setState(() {
              int chatIndex = _chats.indexWhere(
                (chat) => chat.id == state.message.chat,
              );
              List<Message> newMessages = _chats[chatIndex].messages.toList();
              newMessages.removeWhere((m) => m.id == state.message.id);
              newMessages.add(state.message);
              _chats[chatIndex] = _chats[chatIndex].copyWith(
                messages: newMessages,
              );
              if (state.message.id == _chats[chatIndex].lastMessage!.id) {
                _chats[chatIndex] = _chats[chatIndex].copyWith(
                  lastMessage: state.message,
                );
              }
            });
          }
        }
        if (state is ChatDetailFailure) {
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).cardColor,
            content: SnackBarContent(
              message: state.error,
              status: SnackBarStatus.failure,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Chat chat = _chats[index];
          return ChatTile(
            key: ValueKey(chat.id),
            currentUser: widget.currentUser,
            chat: _chats[index],
          );
        },
        itemCount: _chats.length,
      ),
    );
  }
}

class ChatTile extends StatefulWidget {
  const ChatTile({super.key, required this.currentUser, required this.chat});

  final User currentUser;
  final Chat chat;

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  bool selected = false;
  bool canTap = false;

  @override
  Widget build(BuildContext context) {
    User otherUser = widget.chat.users.firstWhere(
      (u) => u.id != widget.currentUser.id,
    );
    String title = otherUser.displayName;
    return BlocListener<ChatActionsCubit, ChatActionsState>(
      listener: (context, state) {
        if (state.status == ChatActionsStatus.actionButtonsOpened) {
          if (state.chats.any((chat) => chat.id == widget.chat.id)) {
            setState(() {
              selected = true;
            });
          } else {
            if (selected != false) {
              setState(() {
                selected = false;
              });
            }
          }
          canTap = true;
        }
        if (state.status == ChatActionsStatus.actionButtonsClosed) {
          setState(() {
            selected = false;
            canTap = false;
          });
        }
      },
      child: ListTile(
        selected: selected,
        selectedTileColor: Theme.of(context).highlightColor,
        leading: ProfileImage(user: widget.currentUser),
        title: Text(title),
        subtitle:
            widget.chat.lastMessage == null
                ? Text('')
                : Text(
                  widget.chat.lastMessage!.text,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color:
                        widget.chat.lastMessage!.isDeleted
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).hintColor,
                    fontStyle:
                        widget.chat.lastMessage!.isDeleted
                            ? FontStyle.italic
                            : FontStyle.normal,
                  ),
                ),
        trailing:
            widget.chat.lastMessage == null
                ? SizedBox.shrink()
                : widget.chat.lastMessage!.isRead ||
                    widget.currentUser.id == widget.chat.lastMessage!.user.id
                ? SizedBox.shrink()
                : Icon(
                  Icons.circle_rounded,
                  size: 10,
                  color: Colors.greenAccent,
                ),
        onTap: () {
          if (canTap) {
            context.read<ChatActionsCubit>().chatHighlighted(chat: widget.chat);
          } else {
            if (widget.chat.lastMessage != null) {
              if (!widget.chat.lastMessage!.isRead &&
                  widget.chat.lastMessage!.user.id != widget.currentUser.id) {
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.markAsRead(chat: widget.chat),
                );
              }
            }
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => ChatDetail(
                      key: ValueKey(widget.chat.id),
                      chat: widget.chat,
                      currentUser: widget.currentUser,
                      otherUser: otherUser,
                    ),
              ),
            );
          }
        },
        onLongPress: () {
          context.read<ChatActionsCubit>().chatHighlighted(chat: widget.chat);
        },
      ),
    );
  }
}
