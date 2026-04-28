import 'dart:io';

import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart';
import 'package:democracy/app/shared/utils/copy.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_create/message_create_bloc.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/edit_message.dart';
import 'package:democracy/chat/view/messages.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    super.key,
    required this.chat,
    required this.me,
    required this.otherUser,
  });

  final Chat chat;
  final User me;
  final User otherUser;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  late Chat _chat = widget.chat;
  late User _otherUser = widget.otherUser;
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _disableSendButton = true;
  bool showMessageActions = false;
  Set<Message> messages = {};
  bool hideChat = true;
  List<File> _media = [];
  File? _document;
  bool _showLoading = false;
  bool _showFailure = false;

  @override
  void initState() {
    context.read<GlobalCubit>().holdChatId(chatId: widget.chat.id);
    _getData();
    super.initState();
  }

  void _getData() {
    context.read<ChatDetailBloc>().add(ChatDetailEvent.get(chat: widget.chat));
    context.read<UserDetailBloc>().add(
      UserDetailEvent.get(userId: _otherUser.id),
    );
    context.read<ChatDetailBloc>().add(
      ChatDetailEvent.markAsRead(chat: widget.chat),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleBlockedStatus(User user) {
    if (user.id == _otherUser.id) {
      setState(() {
        _otherUser = user;
        if (_otherUser.isBlocked) {
          if (hideChat == false) {
            hideChat = true;
          }
        } else {
          hideChat = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MessageCreateBloc, MessageCreateState>(
          listener: (context, state) {
            if (state.status == MessageCreateStatus.success) {
              if (state.message?.chatId == widget.chat.id) {
                reset();
              }
            }
            if (state.status == MessageCreateStatus.loading) {
              setState(() {
                _showLoading = true;
                _showFailure = false;
              });
            }
            if (state.status == MessageCreateStatus.failure) {
              setState(() {
                _showLoading = false;
                _showFailure = true;
              });
            }
          },
        ),
        BlocListener<ChatDetailBloc, ChatDetailState>(
          listener: (context, state) {
            if (state is ChatLoaded) {
              setState(() {
                _chat = state.chat;
              });
            }
          },
        ),
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              _getData();
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
              _handleBlockedStatus(state.user);
            }
            if (state is UserUpdated) {
              _handleBlockedStatus(state.user);
            }
          },
        ),
      ],
      child: PopScope(
        canPop: !showMessageActions,
        onPopInvokedWithResult: (didPop, _) {
          if (showMessageActions) {
            context.read<MessageActionsCubit>().closeActionButtons();
          } else {
            context.read<GlobalCubit>().holdChatId(chatId: null);
            context.read<UserDetailBloc>().add(
              UserDetailEvent.unsubscribe(user: _otherUser),
            );
            context.read<ChatDetailBloc>().add(
              ChatDetailEvent.unsubscribe(chat: _chat),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: showMessageActions
                ? SizedBox.shrink()
                : Row(
                    children: [
                      ProfileImage(user: _otherUser, navigateToProfile: true),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          _otherUser.name,
                          maxLines: 1,
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
            actions: [
              showMessageActions
                  ? _MessageActions(
                      chat: _chat,
                      messages: messages,
                      currentUser: widget.me,
                    )
                  : SizedBox.shrink(),
              ChatPopUpMenu(
                chat: _chat,
                currentUser: widget.me,
                otherUser: _otherUser,
              ),
            ],
          ),
          body: (hideChat && _otherUser.isBlocked)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '@${_otherUser.username} is blocked',
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
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ],
                  ),
                )
              : Messages(chat: _chat, me: widget.me),
          bottomNavigationBar: hideChat
              ? SizedBox.shrink()
              : _otherUser.isBlocked || _otherUser.hasBlocked
              ? _buildBlockedWidget()
              : _buildBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _buildBlockedWidget() {
    return _otherUser.hasBlocked
        ? Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Text('You are blocked', textAlign: TextAlign.center),
          )
        : OutlinedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(vertical: 15),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: () {
              context.read<UserDetailBloc>().add(
                UserDetailEvent.block(user: _otherUser),
              );
            },
            child: Text('Unblock'),
          );
  }

  Widget _buildBottomNavigationBar() {
    return BottomTextFormField(
      focusNode: _focusNode,
      showCursor: true,
      readOnly: false,
      controller: _controller,
      onTap: () {},
      onChanged: (value) {
        if (value.trim().isEmpty) {
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
      onMedia: (media) {
        setState(() {
          _media.addAll(media);
        });
      },
      media: _media,
      onAddMedia: (media) {
        setState(() {
          _media.addAll(media);
        });
      },
      onRemoveMedia: (index) {
        setState(() {
          _media.removeAt(index);
        });
      },
      onDocument: (file) {
        setState(() {
          _document = file;
        });
      },
      document: _document,
      onContentInsertion: (imageFile) {
        context.read<MessageCreateBloc>().add(
          MessageCreateEvent.create(
            chat: _chat,
            text: '',
            filePaths: [imageFile.path],
          ),
        );
      },
      allowedMimeTypes: const <String>['image/png', 'image/gif'],
      onLocation: (point) {
        context.read<MessageCreateBloc>().add(
          MessageCreateEvent.create(chat: _chat, text: '', location: point),
        );
      },
      location: null,
      onRemoveLocation: null,
      onSectionSelection: (section) {
        context.read<MessageCreateBloc>().add(
          MessageCreateEvent.create(chat: _chat, text: '', section: section),
        );
      },
      section: null,
      onRemoveSection: null,
      recipient: widget.otherUser,
      onImageEditingComplete: (image) {
        context.read<MessageCreateBloc>().add(
          MessageCreateEvent.create(
            chat: _chat,
            text: _controller.text,
            filePaths: [image.path],
          ),
        );
        reset();
      },
      onVideoEditingComplete: (videoPath) {
        context.read<MessageCreateBloc>().add(
          MessageCreateEvent.create(
            chat: _chat,
            text: _controller.text,
            filePaths: [videoPath],
          ),
        );
        reset();
      },
      onSend: _disableSendButton && _media.isEmpty && _document == null
          ? null
          : () {
              context.read<MessageCreateBloc>().add(
                MessageCreateEvent.create(
                  chat: _chat,
                  text: _controller.text,
                  filePaths: [
                    ..._media.map((m) => m.path),
                    if (_document != null) _document!.path,
                  ],
                ),
              );
              reset();
            },
      showLoading: _showLoading,
      showFailure: _showFailure,
      onRetry: () {
        context.read<MessageCreateBloc>().add(MessageCreateEvent.retry());
      },
      onCancelRetry: () {
        setState(() {
          _showLoading = false;
          _showFailure = false;
        });
      },
    );
  }

  void reset() {
    _controller.clear();
    setState(() {
      _document = null;
      _media = [];
      _disableSendButton = true;
      _showLoading = false;
      _showFailure = false;
    });
  }
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
    List texts = currentUser.id == otherUser.id
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
      itemBuilder: (BuildContext context) => [
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
          if (!messages.any((message) => message.author.id != currentUser.id))
            if (DateTime.now().difference(messages.first.createdAt) <
                Duration(minutes: 15))
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, _, _) =>
                          EditMessage(chat: chat, message: messages.first),
                    ),
                  );
                },
                icon: Icon(Symbols.edit_rounded),
              ),
        IconButton(
          onPressed: () async {
            context.read<MessageActionsCubit>().closeActionButtons();
            _copy(messages: messages);
          },
          icon: Icon(Symbols.content_copy),
        ),
        (messages.any((message) => message.author.id != currentUser.id))
            ? SizedBox.shrink()
            : IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
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

void _copy({required Set<Message> messages}) async {
  try {
    await Clipboard.setData(
      ClipboardData(
        text: (messages.length == 1)
            ? messages.first.text
            : copyMultiple(forCopy: messages),
      ),
    );
    showSuccessToast('Copied');
  } catch (e) {
    showFailureToast('Failed to copy');
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
        '${message.author.name}: '
        '${message.text} ${(messages.last == message) ? '' : '\n'}';
  }
  return copiedText;
}
