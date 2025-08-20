import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/chats/chats_cubit.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/chat_detail.dart' show ChatDetail;
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  bool loading = true;
  bool failure = false;
  List<Chat> _chats = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ChatsCubit, ChatsState>(
          listener: (context, state) {
            if (state.status == ChatsStatus.success) {
              setState(() {
                loading = false;
                failure = false;
                _chats = state.chats;
                hasNextPage = state.hasNext;
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              });
            }
            if (state.status == ChatsStatus.failure) {
              if (loading) {
                setState(() {
                  loading = false;
                  failure = true;
                });
              }
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
            }
          },
        ),
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
            if (state is ChatLoaded) {
              if (_chats.any((chat) => chat.id == state.chat.id)) {
                setState(() {
                  int index = _chats.indexWhere(
                    (chat) => chat.id == state.chat.id,
                  );
                  _chats[index] = state.chat;
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
            if (state is DirectMessageSent) {
              setState(() {
                for (Chat chat in state.chats) {
                  if (_chats.any((c) => c.id == chat.id)) {
                    int index = _chats.indexWhere((c) => c.id == chat.id);
                    _chats[index] = chat;
                  } else {
                    _chats.insert(0, chat);
                  }
                }
              });
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
      ],
      child:
          loading
              ? BottomLoader()
              : failure
              ? FailureRetryButton(
                onPressed: () {
                  context.read<WebsocketBloc>().add(WebsocketEvent.getChats());
                },
              )
              : BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  late User currentUser;
                  if (state is Authenticated) {
                    currentUser = state.user;
                  }
                  return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: hasNextPage,
                    header: ClassicHeader(),
                    controller: _refreshController,
                    onRefresh: () {
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.getChats(),
                      );
                    },
                    onLoading: () {
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.getChats(lastChat: _chats.last),
                      );
                    },
                    footer: ClassicFooter(),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        Chat chat = _chats[index];
                        User otherUser = currentUser;
                        if (chat.users.length > 1) {
                          otherUser = chat.users.firstWhere(
                            (u) => u.id != currentUser.id,
                          );
                        }
                        return Visibility(
                          visible: chat.lastMessage != null,
                          child: ChatTile(
                            key: ValueKey(chat.id),
                            chat: chat,
                            currentUser: currentUser,
                            otherUser: otherUser,
                          ),
                        );
                      },
                      itemCount: _chats.length,
                    ),
                  );
                },
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
      title: ProfileName(user: widget.otherUser),
      subtitle: Row(
        children: [
          if (widget.chat.lastMessage!.isRead &&
              widget.chat.lastMessage!.user.id == widget.currentUser.id)
            _ReadIcon(),
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
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.chat.lastMessage != null)
            _ChatTime(widget.chat.lastMessage!),
          if (widget.chat.unreadMessages > 0)
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green,
              child: Text(
                widget.chat.unreadMessages.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
        ],
      ),
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
    return Flexible(
      child: Text(
        text,
        maxLines: 1,
        style: TextStyle(overflow: TextOverflow.ellipsis),
      ),
    );
  }
}

class _ReadIcon extends StatelessWidget {
  const _ReadIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Symbols.done_all,
      size: Theme.of(context).textTheme.bodyMedium?.fontSize,
      color: Colors.lightBlueAccent,
    );
  }
}

class _ChatTime extends StatelessWidget {
  const _ChatTime(this.lastMessage);

  final Message lastMessage;

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd/MM/yyyy');
    String date = dateFormat.format(lastMessage.createdAt);
    String text = date;
    if (dateFormat.format(DateTime.now()) == date) {
      text = 'Today';
    }
    if (dateFormat.format(DateTime.now().subtract(Duration(days: 1))) == date) {
      text = 'Yesterday';
    }
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Text(text, style: TextStyle(color: Theme.of(context).hintColor)),
    );
  }
}
