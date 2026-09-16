import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/route/route_cubit.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus, WebSocketService;
import 'package:democracy/app/bloc/sync/sync_bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart';
import 'package:democracy/app/shared/utils/copy.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/chat/chat_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/bloc/inbox/inbox_bloc.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_bloc.dart';
import 'package:democracy/chat/bloc/messages/messages_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/messages.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class ChatDetail extends StatelessWidget {
  const ChatDetail({super.key, @PathParam('id') required this.chatId});

  final int chatId;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: BlocProvider(
        create: (context) =>
            ChatBloc(webSocketService: context.read<WebSocketService>())
              ..add(ChatEvent.load(chatId: chatId)),
        child: BlocBuilder<ChatBloc, ChatState>(
          buildWhen: (previous, current) => current.chatId == chatId,
          builder: (context, state) {
            if (state.status == ChatStatus.initial ||
                (state.status == ChatStatus.loading && state.chat == null)) {
              return Scaffold(
                appBar: AppBar(leading: const AutoLeadingButton()),
                body: Center(child: BottomLoader()),
              );
            }
            if (state.status == ChatStatus.failure && state.chat == null) {
              return Scaffold(
                appBar: AppBar(leading: const AutoLeadingButton()),
                body: Center(
                  child: FailureRetryButton(
                    onPressed: () {
                      context.read<ChatBloc>().add(
                        ChatEvent.load(chatId: chatId),
                      );
                    },
                  ),
                ),
              );
            }

            final me = context.read<AuthBloc>().state.user!;
            final otherUser = state.chat!.users.length > 1
                ? state.chat!.users.firstWhere((u) => u.id != me.id)
                : me;

            return ChatDetailView(
              chat: state.chat!,
              me: me,
              otherUser: otherUser,
            );
          },
        ),
      ),
    );
  }
}

class ChatDetailView extends StatefulWidget {
  const ChatDetailView({
    super.key,
    required this.chat,
    required this.me,
    required this.otherUser,
  });

  final Chat chat;
  final User me;
  final User otherUser;

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  late User _otherUser = widget.otherUser;
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _disableSendButton = true;
  bool showMessageActions = false;
  Set<Message> messages = {};
  bool hideChat = false;
  List<File> _media = [];
  File? _document;

  @override
  void initState() {
    context.read<NotificationsBloc>().add(
      NotificationsEvent.openedChat(chatId: widget.chat.id),
    );
    _getData();
    super.initState();
  }

  void _getData() {
    context.read<UserDetailBloc>().add(
      UserDetailEvent.subscribe(userId: _otherUser.id),
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
        hideChat = _otherUser.isBlocked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final responsive = ResponsiveBreakpoints.of(context);
    String currentRoute = context.read<RouteCubit>().state;
    bool hideLeading =
        kIsWeb &&
        responsive.largerOrEqualTo(expandSidePanel) &&
        currentRoute == ChatRoute.name;

    return BlocProvider(
      create: (context) => MessagesBloc(
        webSocketService: context.read<WebSocketService>(),
        databaseRepository: context.read<DatabaseRepository>(),
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<ChatDetailBloc, ChatDetailState>(
            listener: (context, state) {
              if (state is ChatLoaded) {
                if (state.chat.id == widget.chat.id) {
                  context.read<ChatBloc>().add(
                    ChatEvent.updated(chat: state.chat),
                  );
                }
              }
              if (state is ChatUpdated) {
                if (state.chat.id == widget.chat.id) {
                  context.read<ChatBloc>().add(
                    ChatEvent.updated(chat: state.chat),
                  );
                }
              }
            },
          ),
          BlocListener<MessageDetailBloc, MessageDetailState>(
            listener: (context, state) {
              if (state is MessageCreated &&
                  state.message.chatId == widget.chat.id) {
                context.read<MessagesBloc>().add(
                  MessagesEvent.update(message: state.message),
                );
                context.read<InboxBloc>().add(const InboxEvent.update());
                if (widget.me.id != state.message.author.id) {
                  context.read<ChatDetailBloc>().add(
                    ChatDetailEvent.markAsRead(chat: widget.chat),
                  );
                }
              }
              if (state is MessageUpdated &&
                  state.message.chatId == widget.chat.id) {
                context.read<MessagesBloc>().add(
                  MessagesEvent.update(message: state.message),
                );
              }
              if (state is MessageDeleted &&
                  state.message.chatId == widget.chat.id) {
                context.read<MessagesBloc>().add(
                  MessagesEvent.update(message: state.message),
                );
              }
              if (state is MessageCreatedInDB &&
                  state.message.chatId == widget.chat.id) {
                reset();
                context.read<MessagesBloc>().add(
                  MessagesEvent.update(message: state.message),
                );
                context.read<SyncBloc>().add(const SyncEvent.postMessages());
              }
              if (state is MessageUpdatedInDB &&
                  state.message.chatId == widget.chat.id) {
                context.read<MessagesBloc>().add(
                  MessagesEvent.update(message: state.message),
                );
                context.read<SyncBloc>().add(const SyncEvent.patchMessages());
              }
              if (state is MessageDeletedInDB &&
                  state.message.chatId == widget.chat.id) {
                context.read<MessagesBloc>().add(
                  MessagesEvent.update(message: state.message),
                );
                context.read<SyncBloc>().add(const SyncEvent.deleteMessages());
                context.read<MessageActionsCubit>().closeActionButtons();
              }
              if (state is MessageDetailFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  getSnackBar(
                    context: context,
                    message: state.error,
                    status: SnackBarStatus.failure,
                  ),
                );
              }
            },
          ),
          BlocListener<WebsocketBloc, WebsocketState>(
            listener: (context, state) {
              if (state.status == WebsocketStatus.connected) {
                context.read<ChatDetailBloc>().add(
                  ChatDetailEvent.get(chat: widget.chat),
                );
                _getData();
              }
            },
          ),
          BlocListener<MessageActionsCubit, MessageActionsState>(
            listener: (context, state) {
              setState(() {
                if (state.status == MessageActionsStatus.actionButtonsOpened) {
                  showMessageActions = true;
                  messages = state.messages;
                } else {
                  showMessageActions = false;
                  messages = {};
                }
              });
            },
          ),
          BlocListener<UserDetailBloc, UserDetailState>(
            listener: (context, state) {
              if (state is UserSubscribed) {
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
              context.read<NotificationsBloc>().add(
                NotificationsEvent.openedChat(chatId: null),
              );
              context.read<UserDetailBloc>().add(
                UserDetailEvent.unsubscribe(user: _otherUser),
              );
              context.read<ChatDetailBloc>().add(
                ChatDetailEvent.unsubscribe(chat: widget.chat),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: hideLeading ? null : const AutoLeadingButton(),
              titleSpacing: hideLeading ? null : 0,
              title: showMessageActions
                  ? Text(
                      '${messages.length} selected',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProfileImage(
                          userId: _otherUser.id,
                          username: _otherUser.username,
                          imageUrl: _otherUser.image,
                          radius: 20,
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _otherUser.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              if (widget.chat.isMessageRequest)
                                Text(
                                  'Message Request',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(color: colorScheme.primary),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
              actions: [
                if (showMessageActions)
                  _MessageActions(
                    chat: widget.chat,
                    messages: messages,
                    currentUser: widget.me,
                  )
                else
                  ChatPopUpMenu(
                    chat: widget.chat,
                    currentUser: widget.me,
                    otherUser: _otherUser,
                  ),
                const SizedBox(width: 8),
              ],
            ),
            body: Column(
              children: [
                if (widget.chat.isMessageRequest) _buildMessageRequestBanner(),
                Expanded(
                  child: (hideChat && _otherUser.isBlocked)
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: colorScheme.errorContainer,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.block_rounded,
                                    size: 48,
                                    color: colorScheme.onErrorContainer,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'Chat is hidden',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'You have blocked @${_otherUser.username}. '
                                  '\nYou will not receive messages from them.',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 32),
                                FilledButton.tonal(
                                  onPressed: () =>
                                      setState(() => hideChat = false),
                                  child: const Text('View Messages'),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Messages(chat: widget.chat, me: widget.me),
                ),
              ],
            ),
            bottomNavigationBar: hideChat
                ? const SizedBox.shrink()
                : widget.chat.isMessageRequest
                ? _buildLockedBottomBar()
                : (_otherUser.isBlocked || _otherUser.hasBlocked
                      ? _buildBlockedWidget()
                      : _buildBottomNavigationBar()),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageRequestBanner() {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: colorScheme.surfaceContainerHighest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.mark_email_unread_rounded,
                color: colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Message Request',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Messages from @${_otherUser.username} are hidden until you accept.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: 'Accept',
                        content: 'Are you sure you want to accept?',
                        textButtonText: 'No',
                        onTextButtonPressed: () {
                          Navigator.pop(context);
                        },
                        elevatedButtonText: 'Yes',
                        onElevatedButtonPressed: () {
                          Navigator.pop(context);
                          context.read<ChatDetailBloc>().add(
                            ChatDetailEvent.acceptRequest(chat: widget.chat),
                          );
                        },
                      ),
                    );
                  },
                  child: const Text('Accept'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.tonal(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: 'Decline',
                        content: 'Are you sure you want to decline?',
                        textButtonText: 'No',
                        onTextButtonPressed: () {
                          Navigator.pop(context);
                        },
                        elevatedButtonText: 'Yes',
                        onElevatedButtonPressed: () {
                          Navigator.pop(context);
                          context.read<ChatDetailBloc>().add(
                            ChatDetailEvent.declineRequest(chat: widget.chat),
                          );
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.errorContainer,
                  ),
                  child: const Text('Decline'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLockedBottomBar() {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.lock_outline_rounded,
            size: 20,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Accept the request to send messages',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlockedWidget() {
    final colorScheme = Theme.of(context).colorScheme;

    if (_otherUser.hasBlocked) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colorScheme.errorContainer.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.lock_outline_rounded,
              color: colorScheme.onErrorContainer,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'You cannot send messages because this account has blocked you.',
                style: TextStyle(color: colorScheme.onErrorContainer),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'You have blocked this account. Unblock them to send messages.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(width: 12),
          FilledButton.tonal(
            onPressed: () {
              context.read<UserDetailBloc>().add(
                UserDetailEvent.block(user: _otherUser),
              );
            },
            child: const Text('Unblock'),
          ),
        ],
      ),
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
        setState(() => _disableSendButton = value.trim().isEmpty);
      },
      hintText: 'Message',
      prefixIcon: null,
      onMedia: (media) => setState(() => _media.addAll(media)),
      media: _media,
      onAddMedia: (media) => setState(() => _media.addAll(media)),
      onRemoveMedia: (index) => setState(() => _media.removeAt(index)),
      onDocument: (file) => setState(() => _document = file),
      document: _document,
      onContentInsertion: (imageFile) {
        context.read<MessageDetailBloc>().add(
          MessageDetailEvent.create(
            author: widget.me,
            chat: widget.chat,
            text: '',
            filePaths: [imageFile.path],
          ),
        );
      },
      allowedMimeTypes: const <String>['image/png', 'image/gif'],
      onLocation: (point) {
        context.read<MessageDetailBloc>().add(
          MessageDetailEvent.create(
            author: widget.me,
            chat: widget.chat,
            text: '',
            location: point,
          ),
        );
      },
      location: null,
      onRemoveLocation: null,
      onSectionSelection: (section) {
        context.read<MessageDetailBloc>().add(
          MessageDetailEvent.create(
            author: widget.me,
            chat: widget.chat,
            text: '',
            section: section,
          ),
        );
      },
      section: null,
      onRemoveSection: null,
      recipient: widget.otherUser,
      onImageEditingComplete: (image) {
        context.read<MessageDetailBloc>().add(
          MessageDetailEvent.create(
            author: widget.me,
            chat: widget.chat,
            text: _controller.text,
            filePaths: [image.path],
          ),
        );
        reset();
      },
      onVideoEditingComplete: (videoPath) {
        context.read<MessageDetailBloc>().add(
          MessageDetailEvent.create(
            author: widget.me,
            chat: widget.chat,
            text: _controller.text,
            filePaths: [videoPath],
          ),
        );
        reset();
      },
      onSend: _disableSendButton && _media.isEmpty && _document == null
          ? null
          : () {
              context.read<MessageDetailBloc>().add(
                MessageDetailEvent.create(
                  author: widget.me,
                  chat: widget.chat,
                  text: _controller.text,
                  filePaths: [
                    ..._media.map((m) => m.path),
                    if (_document != null) _document!.path,
                  ],
                ),
              );
              reset();
            },
    );
  }

  void reset() {
    _controller.clear();
    setState(() {
      _document = null;
      _media = [];
      _disableSendButton = true;
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
    final texts = currentUser.id == otherUser.id
        ? []
        : [otherUser.isBlocked ? 'Unblock' : 'Block'];
    final colorScheme = Theme.of(context).colorScheme;

    final MenuController menuController = MenuController();

    return MenuAnchor(
      controller: menuController, // Pass it here
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.all(
          colorScheme.surfaceContainerHigh,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert_rounded),
        );
      },
      menuChildren: [
        ...texts.map((text) {
          return MenuItemButton(
            leadingIcon: Icon(
              otherUser.isBlocked ? Icons.block : Icons.block_rounded,
              color: Colors.red,
            ),
            onPressed: () {
              menuController.close();
              context.read<UserDetailBloc>().add(
                UserDetailEvent.block(user: otherUser),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                bottom: 12.0,
                right: 10.0,
              ),
              child: Text(
                otherUser.isBlocked ? 'Unblock' : 'Block',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }),
      ],
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
    final colorScheme = Theme.of(context).colorScheme;
    final canEdit =
        messages.length == 1 &&
        !messages.any((message) => message.author.id != currentUser.id) &&
        DateTime.now().difference(messages.first.createdAt) <
            const Duration(minutes: 15);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (canEdit)
          IconButton(
            onPressed: () {
              context.router.push(
                EditMessage(chat: chat, message: messages.first),
              );
              context.read<MessageActionsCubit>().closeActionButtons();
            },
            icon: const Icon(Icons.edit_rounded),
            tooltip: 'Edit',
          ),
        IconButton(
          onPressed: () {
            context.read<MessageActionsCubit>().closeActionButtons();
            _copy(
              navigatorKey: context.router.navigatorKey,
              messages: messages,
            );
          },
          icon: const Icon(Icons.content_copy_rounded),
          tooltip: 'Copy',
        ),
        if (!messages.any((message) => message.author.id != currentUser.id))
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  title: 'Delete message?',
                  content:
                      'This message will be permanently deleted for everyone.',
                  elevatedButtonText: 'Delete',
                  onElevatedButtonPressed: () {
                    context.router.popTop();
                    context.read<MessageDetailBloc>().add(
                      MessageDetailEvent.delete(messages: messages.toList()),
                    );
                    context.read<MessageActionsCubit>().closeActionButtons();
                  },
                  textButtonText: 'Cancel',
                  onTextButtonPressed: () => context.router.popTop(),
                ),
              );
            },
            icon: const Icon(Icons.delete_rounded),
            tooltip: 'Delete',
            color:
                colorScheme.error, // The icon itself is red to indicate danger
          ),
      ],
    );
  }
}

void _copy({
  required GlobalKey<NavigatorState> navigatorKey,
  required Set<Message> messages,
}) async {
  try {
    await Clipboard.setData(
      ClipboardData(
        text: messages.length == 1
            ? messages.first.text
            : copyMultiple(forCopy: messages),
      ),
    );
    showSuccessToast(navigatorKey: navigatorKey, text: 'Copied to clipboard');
  } catch (e) {
    showFailureToast(navigatorKey: navigatorKey, text: 'Failed to copy');
  }
}

String copyMultiple({required Set<Message> forCopy}) {
  final messages = forCopy.toList()
    ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  final dateFormat = DateFormat('dd/MM/yyyy hh:mm a');

  return messages
      .map((message) {
        return '[${dateFormat.format(message.createdAt)}] ${message.author.name}: ${message.text}';
      })
      .join('\n');
}
