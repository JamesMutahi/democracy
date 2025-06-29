import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/models/user.dart';
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
          setState(() {
            _chats.add(state.chat);
          });
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
        if (state is MessageDeleted) {
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
        if (state is MarkedAsRead) {
          if (_chats.any(
            (element) => element.id == state.messages.first.chat,
          )) {
            setState(() {
              int chatIndex = _chats.indexWhere(
                (chat) => chat.id == state.messages.first.chat,
              );
              List<Message> newMessages = _chats[chatIndex].messages.toList();
              for (Message message in state.messages) {
                newMessages.removeWhere((m) => m.id == message.id);
                newMessages.add(message);
                _chats[chatIndex] = _chats[chatIndex].copyWith(
                  messages: newMessages,
                );
                if (message.id == _chats[chatIndex].lastMessage!.id) {
                  _chats[chatIndex] = _chats[chatIndex].copyWith(
                    lastMessage: message,
                  );
                }
              }
            });
          }
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

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.currentUser, required this.chat});

  final User currentUser;
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    User otherUser = chat.users.firstWhere((u) => u.id != currentUser.id);
    String title = '${otherUser.firstName} ${otherUser.lastName}';
    return ListTile(
      leading: ProfileImage(user: currentUser),
      title: Text(title),
      subtitle:
          chat.lastMessage == null
              ? Text('')
              : Text(
                chat.lastMessage!.text,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color:
                      chat.lastMessage!.isDeleted
                          ? Theme.of(context).disabledColor
                          : Theme.of(context).hintColor,
                  fontStyle:
                      chat.lastMessage!.isDeleted
                          ? FontStyle.italic
                          : FontStyle.normal,
                ),
              ),
      trailing:
          chat.lastMessage == null
              ? SizedBox.shrink()
              : chat.lastMessage!.isRead ||
                  currentUser.id == chat.lastMessage!.user.id
              ? SizedBox.shrink()
              : Icon(Icons.circle_rounded, size: 5, color: Colors.greenAccent),
      onTap: () {
        if (chat.lastMessage != null) {
          if (!chat.lastMessage!.isRead &&
              chat.lastMessage!.user.id != currentUser.id) {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.markAsRead(chat: chat),
            );
          }
        }
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => ChatDetail(
                  key: ValueKey(chat.id),
                  title: title,
                  chat: chat,
                  otherUser: otherUser,
                ),
          ),
        );
      },
    );
  }
}
