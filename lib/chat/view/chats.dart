import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/chat/chat_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/chats/chats_bloc.dart';
import 'package:democracy/chat/bloc/direct_message/direct_message_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/view/utils/last_message.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<ChatsBloc>().add(const ChatsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MultiBlocListener(
      listeners: [
        BlocListener<ChatDetailBloc, ChatDetailState>(
          listener: (context, state) {
            if (state is ChatCreated ||
                state is ChatLoaded ||
                state is ChatUpdated ||
                state is ChatDeleted) {
              context.read<ChatsBloc>().add(const ChatsEvent.update());
            } else if (state is ChatDetailFailure) {
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
        BlocListener<DirectMessageBloc, DirectMessageState>(
          listener: (context, state) {
            if (state.status == DirectMessageStatus.success) {
              context.read<ChatsBloc>().add(const ChatsEvent.update());
            }
          },
        ),
        BlocListener<NotificationDetailBloc, NotificationDetailState>(
          listener: (context, state) {
            if (state is NotificationCreated &&
                state.notification.chat != null) {
              final openChatId = context
                  .read<NotificationsBloc>()
                  .state
                  .openChatId;
              if (openChatId != state.notification.chat!.id) {
                context.read<ChatsBloc>().add(const ChatsEvent.update());
              }
            }
          },
        ),
      ],
      child: BlocBuilder<ChatFilterCubit, ChatFilterState>(
        builder: (context, filterState) {
          return BlocBuilder<ChatsBloc, ChatsState>(
            builder: (context, chatsState) {
              final chats = chatsState.chats.toList();

              if (chatsState.status == ChatsStatus.initial ||
                  (chatsState.status == ChatsStatus.loading && chats.isEmpty)) {
                return const Center(child: BottomLoader());
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
                if (chats.isEmpty) {
                  return Center(
                    child: FailureRetryButton(
                      onPressed: () => context.read<ChatsBloc>().add(
                        ChatsEvent.get(searchTerm: filterState.searchTerm),
                      ),
                    ),
                  );
                }
              }

              if (chats.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mark_chat_read_outlined,
                          size: 64,
                          color: colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          filterState.searchTerm.isNotEmpty
                              ? 'No matching chats'
                              : 'No messages yet',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          filterState.searchTerm.isNotEmpty
                              ? 'Try a different search term'
                              : 'Start a conversation to see it here',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }

              final me = context.read<AuthBloc>().state.user!;

              return SmartRefresher(
                enablePullDown: true,
                enablePullUp: chatsState.hasNext,
                header: const ClassicHeader(),
                footer: const ClassicFooter(),
                controller: _refreshController,
                onRefresh: () => context.read<ChatsBloc>().add(
                  ChatsEvent.get(searchTerm: filterState.searchTerm),
                ),
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
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 80,
                  ), // Bottom padding for FAB
                  itemCount: chats.length,
                  separatorBuilder: (_, _) => Divider(
                    height: 1,
                    color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    final otherUser = chat.users.length > 1
                        ? chat.users.firstWhere(
                            (u) => u.id != me.id,
                            orElse: () => me,
                          )
                        : me;

                    return ChatTile(
                      key: ValueKey(chat.id),
                      chat: chat,
                      currentUser: me,
                      otherUser: otherUser,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Chat Tile
// -----------------------------------------------------------------------------

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
    if (lastMessage == null) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    final hasUnread = chat.unreadMessages > 0;
    final isFromMe = lastMessage.author.id == currentUser.id;
    final lastMessagePrefix = isFromMe ? 'You: ' : '';
    final subtitleText = getLastMessageText(lastMessage, lastMessagePrefix);
    final responsive = ResponsiveBreakpoints.of(context);

    return InkWell(
      onTap: () {
        if (kIsWeb && responsive.largerOrEqualTo(expandSidePanel)) {
          context.read<ChatBloc>().add(ChatEvent.load(chatId: chat.id));
        } else {
          context.router.push(ChatDetail(chatId: chat.id));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            ProfileImage(
              userId: otherUser.id,
              username: otherUser.username,
              imageUrl: otherUser.image,
              radius: 28,
            ),
            const SizedBox(width: 12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name & Time Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          otherUser.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: hasUnread
                                    ? FontWeight.bold
                                    : FontWeight.w600,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatChatTime(lastMessage.createdAt),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: hasUnread
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                          fontWeight: hasUnread
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Message & Unread Badge Row
                  Row(
                    children: [
                      if (isFromMe) ...[
                        Icon(
                          lastMessage.isRead
                              ? Icons.done_all_rounded
                              : Icons.done_rounded,
                          size: 16,
                          color: lastMessage.isRead
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
                          subtitleText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: hasUnread
                                    ? colorScheme.onSurface
                                    : colorScheme.onSurfaceVariant,
                                fontWeight: hasUnread
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                        ),
                      ),
                      if (hasUnread) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            chat.unreadMessages > 99
                                ? '99+'
                                : chat.unreadMessages.toString(),
                            style: TextStyle(
                              color: colorScheme.onPrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatChatTime(DateTime createdAt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(
      createdAt.year,
      createdAt.month,
      createdAt.day,
    );
    final yesterday = today.subtract(const Duration(days: 1));

    if (messageDate == today) {
      return DateFormat('h:mm a').format(createdAt); // e.g., "2:30 PM"
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('dd/MM/yyyy').format(createdAt);
    }
  }
}
