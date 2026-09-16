import 'package:collection/collection.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/sync/sync_bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/utils/link_extractor.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/asset_viewer.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/cached_link_preview.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/broadcast/view/widgets/broadcast_tile.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/messages/messages_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Messages extends StatefulWidget {
  const Messages({super.key, required this.chat, required this.me});

  final Chat chat;
  final User me;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final RefreshController _refreshController = RefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MessagesBloc>().add(MessagesEvent.get(chat: widget.chat));

    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    // Clear the registry when leaving
    ActiveScrollController.deactivate(_scrollController);
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return MultiBlocListener(
      listeners: [
        BlocListener<MessagesBloc, MessagesState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == MessagesStatus.success) {
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshCompleted();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadComplete();
              }
            } else if (state.status == MessagesStatus.failure) {
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
            }
          },
        ),
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, websocketState) {
            if (websocketState.status == WebsocketStatus.connected) {
              final state = context.read<MessagesBloc>().state;
              if (state.chatId == widget.chat.id) {
                final syncedMessages = state.messages
                    .where((m) => m.syncStatus == SyncStatus.synced)
                    .toList();

                context.read<MessagesBloc>().add(
                  MessagesEvent.get(
                    chat: widget.chat,
                    newestMessage: syncedMessages.isNotEmpty
                        ? syncedMessages.first
                        : null,
                  ),
                );
              }
            }
          },
        ),
        BlocListener<SyncBloc, SyncState>(
          listener: (context, state) {
            if (state is MessageSynced &&
                state.message.chatId == widget.chat.id) {
              context.read<MessagesBloc>().add(
                MessagesEvent.update(message: state.message),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<MessagesBloc, MessagesState>(
        buildWhen: (previous, current) => current.chatId == widget.chat.id,
        builder: (context, state) {
          if (state.status == MessagesStatus.initial ||
              (state.status == MessagesStatus.loading &&
                  state.messages.isEmpty)) {
            return const Center(child: BottomLoader());
          }

          if (state.status == MessagesStatus.failure &&
              state.messages.isEmpty) {
            return Center(
              child: FailureRetryButton(
                onPressed: () => context.read<MessagesBloc>().add(
                  MessagesEvent.get(chat: widget.chat),
                ),
              ),
            );
          }

          final sortedMessages = List<Message>.from(state.messages)
            ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

          final now = DateTime.now();
          final todayStr = DateFormat.yMMMMd().format(now);
          final yesterdayStr = DateFormat.yMMMMd().format(
            now.subtract(const Duration(days: 1)),
          );

          final groupByDate = groupBy(
            sortedMessages,
            (obj) => DateFormat.yMMMMd().format(obj.createdAt),
          );

          final List<ChatDisplayItem> displayItems = [];
          groupByDate.forEach((date, list) {
            // Add date header *before* the messages for that date (since list is reversed)
            String displayDate = date;
            if (date == todayStr) {
              displayDate = 'Today';
            } else if (date == yesterdayStr) {
              displayDate = 'Yesterday';
            }

            for (final message in list) {
              displayItems.add(ChatDisplayItem.message(message));
            }
            displayItems.add(ChatDisplayItem.date(displayDate));
          });

          return SmartRefresher(
            enablePullDown: false,
            enablePullUp: state.hasNext,
            controller: _refreshController,
            onLoading: () {
              final syncedMessages = sortedMessages
                  .where((m) => m.syncStatus == SyncStatus.synced)
                  .toList();

              context.read<MessagesBloc>().add(
                MessagesEvent.get(
                  chat: widget.chat,
                  oldestMessage: syncedMessages.isNotEmpty
                      ? syncedMessages.last
                      : null,
                ),
              );
            },
            footer: const ClassicFooter(),
            child: ListView.builder(
              reverse: true,
              controller: isWebLayout ? _scrollController : null,
              physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              itemCount: displayItems.length,
              itemBuilder: (context, index) {
                final item = displayItems[index];
                if (item.isDateHeader) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          item.dateText ?? '',
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return _buildMessageContent(
                    item.message!,
                    widget.me,
                    context,
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessageContent(Message message, User me, BuildContext context) {
    final bool isMe = me.id == message.author.id;
    final colorScheme = Theme.of(context).colorScheme;

    // Check if this chat is a pending request AND the message is from someone else
    final bool isPendingRequest = widget.chat.isMessageRequest && !isMe;

    if (message.isDeleted) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.cancel_outlined,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'This message was deleted',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final List<Widget> bubbleContent = [];

    // Attachments & Linked Objects
    void addAttachment(Widget child) {
      if (bubbleContent.isNotEmpty) {
        bubbleContent.add(const SizedBox(height: 8));
      }
      bubbleContent.add(child);
    }

    if (isPendingRequest) {
      final hasMedia =
          message.assets.isNotEmpty ||
          message.location != null ||
          message.post != null ||
          message.ballot != null ||
          message.survey != null ||
          message.petition != null ||
          message.broadcast != null ||
          message.section != null;

      if (hasMedia) {
        addAttachment(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: 18,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'Accept request to view media',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    } else {
      if (message.assets.isNotEmpty) {
        addAttachment(AssetViewer(assets: message.assets));
      }
      if (message.location != null) {
        addAttachment(MapWidget(mapCenter: message.location!));
      }
      if (message.post != null) {
        addAttachment(
          PostWidgetSelector(post: message.post!, isDependency: true),
        );
      }
      if (message.ballot != null) {
        addAttachment(BallotTile(ballot: message.ballot!, isDependency: true));
      }
      if (message.survey != null) {
        addAttachment(SurveyTile(survey: message.survey!, isDependency: true));
      }
      if (message.petition != null) {
        addAttachment(
          PetitionTile(petition: message.petition!, isDependency: true),
        );
      }
      if (message.broadcast != null) {
        addAttachment(
          BroadcastTile(broadcast: message.broadcast!, isDependency: true),
        );
      }
      if (message.section != null) {
        addAttachment(
          SectionTile(section: message.section!, isDependency: true),
        );
      }
    }

    // Text Content (Always visible, even in requests)
    final String text = extractLink(
      text: message.text,
      post: message.post,
      ballot: message.ballot,
      broadcast: message.broadcast,
      survey: message.survey,
      petition: message.petition,
      section: message.section,
    );

    if (text.isNotEmpty) {
      bubbleContent.add(MessageCard(text: text));
    }

    // Link Preview (Hidden if pending request)
    if (message.text.isNotEmpty && !isPendingRequest) {
      bubbleContent.add(
        CachedLinkPreview(
          text: message.text,
          cacheKey: 'message: ${message.id}',
        ),
      );
    }

    return _MessageBubble(
      message: message,
      isMe: isMe,
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: bubbleContent,
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Unified Message Bubble
// -----------------------------------------------------------------------------

class _MessageBubble extends StatefulWidget {
  const _MessageBubble({
    required this.message,
    required this.isMe,
    required this.child,
  });

  final Message message;
  final bool isMe;
  final Widget child;

  @override
  State<_MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<_MessageBubble> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final responsive = ResponsiveBreakpoints.of(context);
    final double maxWidth = responsive.screenWidth < 600
        ? MediaQuery.of(context).size.width * 0.75
        : 450.0;

    return BlocBuilder<MessageActionsCubit, MessageActionsState>(
      builder: (context, state) {
        final isHighlighted =
            state.status == MessageActionsStatus.actionButtonsOpened &&
            state.messages.contains(widget.message);

        final cubit = context.read<MessageActionsCubit>();

        return GestureDetector(
          onTap: widget.message.isDeleted
              ? null
              : () {
                  if (cubit.state.messages.isNotEmpty) {
                    cubit.messageHighlighted(message: widget.message);
                  }
                },
          onLongPress: widget.message.isDeleted
              ? null
              : () {
                  cubit.messageHighlighted(message: widget.message);
                },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            padding: const EdgeInsets.all(
              4.0,
            ), // Padding for the highlight border
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isHighlighted
                  ? colorScheme.primary.withValues(alpha: 0.1)
                  : Colors.transparent,
              border: isHighlighted
                  ? Border.all(color: colorScheme.primary, width: 1.5)
                  : null,
            ),
            child: Align(
              alignment: widget.isMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  crossAxisAlignment: widget.isMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Main Bubble Content
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: widget.isMe
                            ? colorScheme.primaryContainer
                            : colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: Radius.circular(widget.isMe ? 16 : 4),
                          bottomRight: Radius.circular(widget.isMe ? 4 : 16),
                        ),
                      ),
                      child: widget.child,
                    ),
                    const SizedBox(height: 4),
                    // Footer (Time, Read Receipt, Sync Status)
                    _MessageFooter(message: widget.message, isMe: widget.isMe),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// Message Footer
// -----------------------------------------------------------------------------

class _MessageFooter extends StatelessWidget {
  const _MessageFooter({required this.message, required this.isMe});

  final Message message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final timeFormat = DateFormat('h:mm a'); // e.g., 2:30 PM

    return Padding(
      padding: EdgeInsets.only(left: isMe ? 0 : 12.0, right: isMe ? 12.0 : 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (message.isEdited)
            Text(
              'Edited · ',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),

          if (message.syncStatus == SyncStatus.pending)
            SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  colorScheme.onSurfaceVariant,
                ),
              ),
            )
          else if (message.syncStatus == SyncStatus.failed)
            GestureDetector(
              onTap: () =>
                  context.read<SyncBloc>().add(const SyncEvent.start()),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 14,
                    color: colorScheme.error,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Tap to retry',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          else
            Row(
              children: [
                Text(
                  timeFormat.format(message.createdAt),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  Icon(
                    message.isRead
                        ? Icons.done_all_rounded
                        : Icons.done_rounded,
                    size: 14,
                    color: message.isRead
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                  ),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Helper Models & Widgets
// -----------------------------------------------------------------------------

class ChatDisplayItem {
  final bool isDateHeader;
  final String? dateText;
  final Message? message;

  ChatDisplayItem.date(this.dateText) : isDateHeader = true, message = null;
  ChatDisplayItem.message(this.message) : isDateHeader = false, dateText = null;
}

class MessageCard extends StatefulWidget {
  const MessageCard({super.key, required this.text});
  final String text;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  bool _readMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: widget.text,
          style: Theme.of(context).textTheme.bodyMedium!,
          suffix: _readMore ? ' Show less' : '... Show more',
          showAllText: _readMore,
          onSuffixPressed: () {
            setState(() => _readMore = !_readMore);
          },
        ),
      ],
    );
  }
}
