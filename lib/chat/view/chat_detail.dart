import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_text_form_field.dart';
import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/edit_message.dart';
import 'package:democracy/chat/view/messages.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class ChatDetail extends StatelessWidget {
  const ChatDetail({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User currentUser;
        if (state is Authenticated) {
          currentUser = state.user;
        }
        User otherUser = currentUser;
        if (chat.users.length > 1) {
          otherUser = chat.users.firstWhere((u) => u.id != currentUser.id);
        }
        return ChatScaffold(
          chat: chat,
          currentUser: currentUser,
          otherUser: otherUser,
        );
      },
    );
  }
}

class ChatScaffold extends StatefulWidget {
  const ChatScaffold({
    super.key,
    required this.chat,
    required this.currentUser,
    required this.otherUser,
  });

  final Chat chat;
  final User currentUser;
  final User otherUser;

  @override
  State<ChatScaffold> createState() => _ChatScaffoldState();
}

class _ChatScaffoldState extends State<ChatScaffold> {
  late User otherUser = widget.otherUser;
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _disableSendButton = true;
  bool showMessageActions = false;
  Set<Message> messages = {};
  bool hideChat = true;

  @override
  void initState() {
    context.read<UserDetailBloc>().add(
      UserDetailEvent.get(user: widget.otherUser),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<UsersBloc>().add(
                UsersEvent.resubscribe(users: [otherUser]),
              );
            }
          },
        ),
        BlocListener<MessageActionsCubit, MessageActionsState>(
          listener: (context, state) {
            if (state.status == MessageActionsStatus.actionButtonsOpened) {
              setState(() {
                showMessageActions = true;
                messages = state.messages;
              });
            }
            if (state.status == MessageActionsStatus.actionButtonsClosed) {
              setState(() {
                showMessageActions = false;
                messages = {};
              });
            }
          },
        ),
        BlocListener<UserDetailBloc, UserDetailState>(
          listener: (context, state) {
            if (state is UserLoaded) {
              if (otherUser.id == state.user.id) {
                setState(() {
                  otherUser = state.user;
                  if (state.user.isBlocked) {
                    if (hideChat == false) {
                      hideChat = true;
                    }
                  } else {
                    hideChat = false;
                  }
                });
              }
            }
            if (state is UserUpdated) {
              if (otherUser.id == state.user.id) {
                setState(() {
                  otherUser = state.user;
                  if (state.user.isBlocked) {
                    if (hideChat == false) {
                      hideChat = true;
                    }
                  } else {
                    hideChat = false;
                  }
                });
              }
            }
          },
        ),
      ],
      child: PopScope(
        canPop: !showMessageActions,
        onPopInvokedWithResult: (didPop, __) {
          if (showMessageActions) {
            context.read<MessageActionsCubit>().closeActionButtons();
          }
          context.read<UsersBloc>().add(
            UsersEvent.unsubscribe(users: [otherUser]),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title:
                showMessageActions
                    ? SizedBox.shrink()
                    : Row(
                      children: [
                        ProfileImage(user: otherUser, navigateToProfile: true),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            otherUser.name,
                            maxLines: 1,
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
            actions: [
              showMessageActions
                  ? _MessageActions(
                    chat: widget.chat,
                    messages: messages,
                    currentUser: widget.currentUser,
                  )
                  : SizedBox.shrink(),
              ChatPopUpMenu(
                chat: widget.chat,
                currentUser: widget.currentUser,
                otherUser: otherUser,
              ),
            ],
          ),
          body:
              (hideChat && otherUser.isBlocked)
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '@${otherUser.username} is blocked',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 10),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              hideChat = false;
                            });
                          },
                          child: Text('View messages'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Will not unblock them',
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  )
                  : Messages(
                    chat: widget.chat,
                    currentUser: widget.currentUser,
                  ),
          bottomNavigationBar:
              otherUser.isBlocked && hideChat
                  ? SizedBox.shrink()
                  : otherUser.isBlocked && !hideChat
                  ? otherUser.hasBlocked
                      ? Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'You have been blocked',
                          textAlign: TextAlign.center,
                        ),
                      )
                      : OutlinedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15),
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                        ),
                        onPressed: () {
                          context.read<UserDetailBloc>().add(
                            UserDetailEvent.block(user: otherUser),
                          );
                        },
                        child: Text('Unblock'),
                      )
                  : BottomTextFormField(
                    focusNode: _focusNode,
                    showCursor: true,
                    readOnly: false,
                    controller: _controller,
                    onTap: () {},
                    onChanged: (value) {
                      if (value == '') {
                        setState(() {
                          _disableSendButton = true;
                        });
                      } else {
                        setState(() {
                          _disableSendButton = false;
                        });
                      }
                    },
                    hintText: 'Message',
                    prefixIcon: null,
                    onSend:
                        _disableSendButton
                            ? null
                            : () {
                              context.read<MessageDetailBloc>().add(
                                MessageDetailEvent.create(
                                  chat: widget.chat,
                                  text: _controller.text,
                                ),
                              );
                              _controller.clear();
                              setState(() {
                                _disableSendButton = true;
                              });
                            },
                  ),
        ),
      ),
    );
  }
}

String copyMultiple({required Set<Message> forCopy}) {
  List<Message> messages = forCopy.toList();
  messages.sort((a, b) => a.id.compareTo(b.id));
  var dateFormat = DateFormat('dd/MM/yyyy hh:mm');
  String copiedText = '';
  for (var message in messages) {
    copiedText +=
        '[${dateFormat.format(message.createdAt)}] '
        '${message.user.name}: '
        '${message.text} ${(messages.last == message) ? '' : '\n'}';
  }
  return copiedText;
}

class ChatPopUpMenu extends StatelessWidget {
  const ChatPopUpMenu({
    super.key,
    required this.chat,
    required this.currentUser,
    required this.otherUser,
  });

  final Chat chat;
  final User currentUser;
  final User otherUser;

  @override
  Widget build(BuildContext context) {
    List texts =
        currentUser.id == otherUser.id
            ? []
            : [otherUser.isBlocked ? 'Unblock' : 'Block'];
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      onSelected: (selected) {
        switch (selected) {
          case 'Block':
            context.read<UserDetailBloc>().add(
              UserDetailEvent.block(user: otherUser),
            );
          case 'Unblock':
            context.read<UserDetailBloc>().add(
              UserDetailEvent.block(user: otherUser),
            );
        }
      },
      itemBuilder:
          (BuildContext context) => [
            ...texts.map((text) {
              return PopupMenuItem<String>(
                value: text,
                child: Text(text, textAlign: TextAlign.center),
              );
            }),
          ],
      icon: Icon(
        Symbols.more_vert_rounded,
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }
}

class _MessageActions extends StatelessWidget {
  const _MessageActions({
    required this.chat,
    required this.currentUser,
    required this.messages,
  });

  final Chat chat;
  final User currentUser;
  final Set<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (messages.length == 1)
          if (!messages.any((message) => message.user.id != currentUser.id))
            if (DateTime.now().difference(messages.first.createdAt) <
                Duration(minutes: 15))
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder:
                          (_, __, ___) =>
                              EditMessage(chat: chat, message: messages.first),
                    ),
                  );
                },
                icon: Icon(Symbols.edit_rounded),
              ),
        IconButton(
          onPressed: () async {
            context.read<MessageActionsCubit>().closeActionButtons();
            await Clipboard.setData(
              ClipboardData(
                text:
                    (messages.length == 1)
                        ? messages.first.text
                        : copyMultiple(forCopy: messages),
              ),
            );
          },
          icon: Icon(Symbols.content_copy),
        ),
        (messages.any((message) => message.user.id != currentUser.id))
            ? SizedBox.shrink()
            : IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => CustomDialog(
                        title: 'Delete message',
                        content:
                            'Are you sure you want to delete this? \n'
                            'The message will be permanently deleted',
                        button1Text: 'Yes',
                        onButton1Pressed: () {
                          Navigator.pop(context);
                          context.read<MessageDetailBloc>().add(
                            MessageDetailEvent.delete(
                              messages: messages.toList(),
                            ),
                          );
                          context
                              .read<MessageActionsCubit>()
                              .closeActionButtons();
                        },
                        button2Text: 'No',
                        onButton2Pressed: () {
                          Navigator.pop(context);
                        },
                      ),
                );
              },
              icon: Icon(Symbols.delete_rounded),
            ),
      ],
    );
  }
}
