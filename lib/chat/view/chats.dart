import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/chats/chats_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/utils/chat_navigator.dart';
import 'package:democracy/chat/view/utils/link_extractor.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
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
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<ChatsBloc>().add(ChatsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatDetailBloc, ChatDetailState>(
      listener: (context, state) {
        final chatsBloc = context.read<ChatsBloc>();

        if (state is ChatCreated) {
          chatsBloc.add(ChatsEvent.add(chat: state.chat));
        } else if (state is ChatLoaded) {
          chatsBloc.add(ChatsEvent.update(chat: state.chat));
        } else if (state is ChatUpdated) {
          chatsBloc.add(ChatsEvent.update(chat: state.chat));
        } else if (state is ChatDeleted) {
          chatsBloc.add(ChatsEvent.remove(chatId: state.chatId));
        } else if (state is DirectMessageSent) {
          chatsBloc.add(ChatsEvent.updateMultiple(chats: state.chats));
        } else if (state is ChatDetailFailure) {
          final snackBar = getSnackBar(
            context: context,
            message: state.error,
            status: SnackBarStatus.failure,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          late User currentUser;
          if (state is Authenticated) {
            currentUser = state.user;
          }
          return BlocBuilder<ChatFilterCubit, ChatFilterState>(
            builder: (context, filterState) {
              return BlocBuilder<ChatsBloc, ChatsState>(
                builder: (context, chatsState) {
                  final chats = chatsState.chats.toList();

                  if (chatsState.status == ChatsStatus.initial ||
                      (chatsState.status == ChatsStatus.loading &&
                          chats.isEmpty)) {
                    return const BottomLoader();
                  }

                  if (chatsState.status == ChatsStatus.success) {
                    if (_refreshController.headerStatus ==
                        RefreshStatus.refreshing) {
                      _refreshController.refreshCompleted();
                    }
                    if (_refreshController.footerStatus == LoadStatus.loading) {
                      _refreshController.loadComplete();
                    }
                  }

                  if (chatsState.status == ChatsStatus.failure) {
                    if (_refreshController.headerStatus ==
                        RefreshStatus.refreshing) {
                      _refreshController.refreshFailed();
                    }
                    if (_refreshController.footerStatus == LoadStatus.loading) {
                      _refreshController.loadFailed();
                    }
                    if (chatsState.chats.isEmpty) {
                      return FailureRetryButton(
                        onPressed: () => context.read<ChatsBloc>().add(
                          ChatsEvent.get(searchTerm: filterState.searchTerm),
                        ),
                      );
                    }
                  }

                  return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: chatsState.hasNext,
                    header: ClassicHeader(),
                    controller: _refreshController,
                    onRefresh: () {
                      context.read<ChatsBloc>().add(
                        ChatsEvent.get(searchTerm: filterState.searchTerm),
                      );
                    },
                    onLoading: () {
                      if (chats.isNotEmpty) {
                        context.read<ChatsBloc>().add(
                          ChatsEvent.get(
                            lastChat: chats.last,
                            searchTerm: filterState.searchTerm,
                          ),
                        );
                      }
                    },
                    footer: ClassicFooter(),
                    child: chats.isEmpty
                        ? const Center(
                            child: Text(
                              'No chats yet',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : ListView.builder(
                            itemCount: chats.length,
                            itemBuilder: (context, index) {
                              final chat = chats[index];
                              final otherUser = chat.users.length > 1
                                  ? chat.users.firstWhere(
                                      (u) => u.id != currentUser.id,
                                      orElse: () => currentUser,
                                    )
                                  : currentUser;

                              return ChatTile(
                                key: ValueKey(chat.id),
                                chat: chat,
                                currentUser: currentUser,
                                otherUser: otherUser,
                              );
                            },
                          ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final lastMessage = chat.lastMessage;
    if (lastMessage == null) {
      return const SizedBox.shrink(); // Hide chats without last message
    }

    final isFromMe = lastMessage.user.id == currentUser.id;
    final lastMessagePrefix = isFromMe ? 'You: ' : '';

    final subtitleText = _getLastMessageText(lastMessage, lastMessagePrefix);

    return ListTile(
      leading: ProfileImage(user: otherUser, navigateToProfile: true),
      title: ProfileName(user: otherUser),
      subtitle: Row(
        children: [
          if (isFromMe && lastMessage.isRead) const _ReadIcon(),
          Expanded(child: _LastMessageText(text: subtitleText)),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ChatTime(lastMessage),
          if (chat.unreadMessages > 0)
            Badge(
              label: Text(
                chat.unreadMessages.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              backgroundColor: Colors.green,
            ),
        ],
      ),
      onTap: () {
        if (chat.unreadMessages > 0) {
          context.read<ChatDetailBloc>().add(
            ChatDetailEvent.markAsRead(chat: chat),
          );
        }
        navigateToChatDetail(context: context, chat: chat);
      },
      onLongPress: () {
        // TODO: Implement long press actions (delete, mute, block, etc.)
      },
    );
  }

  String _getLastMessageText(Message message, String prefix) {
    final text = extractLinkFromMessage(message);

    if (text.isNotEmpty) {
      return '$prefix${message.text}';
    }

    if (message.post != null) return '${prefix}Shared a post';
    if (message.ballot != null) return '${prefix}Shared a ballot';
    if (message.survey != null) return '${prefix}Shared a survey';
    if (message.petition != null) return '${prefix}Shared a petition';
    if (message.section != null) return '${prefix}Shared the constitution';
    if (message.image1Url != null) return '${prefix}Shared an image';
    if (message.fileUrl != null) return '${prefix}Shared a file';
    if (message.location != null) return '${prefix}Shared a location';
    if (message.videoUrl != null) return '${prefix}Shared a video';

    return '${prefix}Shared something';
  }
}

class _LastMessageText extends StatelessWidget {
  const _LastMessageText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class _ReadIcon extends StatelessWidget {
  const _ReadIcon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Icon(
        Symbols.done_all,
        size: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 16,
        color: Colors.lightBlueAccent,
      ),
    );
  }
}

class _ChatTime extends StatelessWidget {
  const _ChatTime(this.message);

  final Message message;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final dateStr = dateFormat.format(message.createdAt);

    String displayText = dateStr;

    if (dateFormat.format(DateTime.now()) == dateStr) {
      displayText = 'Today';
    } else if (dateFormat.format(
          DateTime.now().subtract(const Duration(days: 1)),
        ) ==
        dateStr) {
      displayText = 'Yesterday';
    }

    return Text(
      displayText,
      style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12),
    );
  }
}
