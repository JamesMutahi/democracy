import 'package:collection/collection.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/sync/sync_bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/utils/link_extractor.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<MessagesBloc>().add(MessagesEvent.get(chat: widget.chat));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            return const BottomLoader();
          }

          if (state.status == MessagesStatus.failure &&
              state.messages.isEmpty) {
            return FailureRetryButton(
              onPressed: () => context.read<MessagesBloc>().add(
                MessagesEvent.get(chat: widget.chat),
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
            for (final message in list) {
              displayItems.add(ChatDisplayItem.message(message));
            }

            String displayDate = date;
            if (date == todayStr) {
              displayDate = 'Today';
            } else if (date == yesterdayStr) {
              displayDate = 'Yesterday';
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
              itemCount: displayItems.length,
              itemBuilder: (context, index) {
                final item = displayItems[index];
                if (item.isDateHeader) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8.0,
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          item.dateText ?? '',
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
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
    final bool alignedRight = me.id == message.author.id;

    if (message.isDeleted) {
      return AlignmentContainer(
        message: message,
        alignedRight: alignedRight,
        verticalPadding: 7,
        horizontalPadding: 14,
        child: Text(
          'Message was deleted',
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
      );
    }

    final List<Widget> contentWidgets = [];

    // Text & Link Preview
    final String text = extractLink(
      text: message.text,
      post: message.post,
      ballot: message.ballot,
      broadcast: message.broadcast,
      survey: message.survey,
      petition: message.petition,
      section: message.section,
    );

    // Helper to add attachments with proper spacing
    void addAttachment(Widget child, String typeKey) {
      if (text.isNotEmpty) {
        contentWidgets.add(const SizedBox(height: 10.0));
      }
      contentWidgets.add(
        AlignmentContainer(
          key: ValueKey('${message.id}_$typeKey'),
          message: message,
          alignedRight: alignedRight,
          child: child,
        ),
      );
    }

    if (message.assets.isNotEmpty) {
      addAttachment(AssetViewer(assets: message.assets), 'assets');
    }
    if (message.location != null) {
      addAttachment(MapWidget(mapCenter: message.location!), 'location');
    }
    if (message.post != null) {
      addAttachment(
        PostWidgetSelector(post: message.post!, isDependency: true),
        'post',
      );
    }
    if (message.ballot != null) {
      addAttachment(
        BallotTile(ballot: message.ballot!, isDependency: true),
        'ballot',
      );
    }
    if (message.survey != null) {
      addAttachment(
        SurveyTile(survey: message.survey!, isDependency: true),
        'survey',
      );
    }
    if (message.petition != null) {
      addAttachment(
        PetitionTile(petition: message.petition!, isDependency: true),
        'petition',
      );
    }
    if (message.broadcast != null) {
      addAttachment(
        BroadcastTile(broadcast: message.broadcast!, isDependency: true),
        'broadcast',
      );
    }
    if (message.section != null) {
      addAttachment(
        SectionTile(section: message.section!, isDependency: true),
        'section',
      );
    }

    if (text.isNotEmpty) {
      contentWidgets.add(
        AlignmentContainer(
          key: ValueKey('${message.id}_text'),
          message: message,
          alignedRight: alignedRight,
          verticalPadding: 7,
          horizontalPadding: 14,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MessageCard(text: text),
              CachedLinkPreview(
                text: message.text,
                cacheKey: 'message: ${message.id}',
              ),
            ],
          ),
        ),
      );
    }

    // Time
    contentWidgets.add(
      MessageTime(message: message, alignedRight: alignedRight),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignedRight
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: contentWidgets,
    );
  }
}

// --- Helper Model for ListView.builder Performance ---
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
  String suffix = '...Show more';
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: widget.text,
          style: Theme.of(context).textTheme.bodyMedium!,
          suffix: suffix,
          showAllText: readMore,
          onSuffixPressed: () {
            setState(() {
              if (readMore) {
                suffix = '...Show more';
                readMore = false;
              } else {
                suffix = '\nShow less';
                readMore = true;
              }
            });
          },
        ),
      ],
    );
  }
}

class MessageTime extends StatelessWidget {
  const MessageTime({
    super.key,
    required this.message,
    required this.alignedRight,
  });

  final Message message;
  final bool alignedRight;

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('hh:mm a');
    return Align(
      alignment: alignedRight ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: alignedRight ? 0 : 10,
          right: alignedRight ? 10 : 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (message.isEdited)
              Text(
                'Edited ',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
            if (message.syncStatus == SyncStatus.pending)
              SpinKitThreeInOut(
                color: Theme.of(context).disabledColor,
                size: Theme.of(context).textTheme.labelSmall!.fontSize!,
              )
            else if (message.syncStatus == SyncStatus.failed)
              Text(
                'Not Delivered',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              )
            else
              Text(
                timeFormat.format(message.createdAt).toLowerCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AlignmentContainer extends StatefulWidget {
  const AlignmentContainer({
    super.key,
    required this.alignedRight,
    required this.child,
    required this.message,
    this.verticalPadding = 5,
    this.horizontalPadding = 5,
  });

  final bool alignedRight;
  final Message message;
  final Widget child;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  State<AlignmentContainer> createState() => _AlignmentContainerState();
}

class _AlignmentContainerState extends State<AlignmentContainer> {
  Color highlightColor = Colors.transparent;
  bool canTap = false;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final double messageWidth = responsive.screenWidth < 600
        ? MediaQuery.of(context).size.width / 1.5
        : 400.0;

    return BlocListener<MessageActionsCubit, MessageActionsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == MessageActionsStatus.actionButtonsOpened) {
          final isHighlighted = state.messages.contains(widget.message);
          if (isHighlighted && highlightColor == Colors.transparent) {
            setState(() => highlightColor = Theme.of(context).highlightColor);
          } else if (!isHighlighted && highlightColor != Colors.transparent) {
            setState(() => highlightColor = Colors.transparent);
          }
          canTap = true;
        } else if (state.status == MessageActionsStatus.actionButtonsClosed) {
          if (highlightColor != Colors.transparent) {
            setState(() => highlightColor = Colors.transparent);
          }
          canTap = false;
        }
      },
      child: GestureDetector(
        onTap: widget.message.isDeleted || !canTap
            ? null
            : () => context.read<MessageActionsCubit>().messageHighlighted(
                message: widget.message,
              ),
        onLongPress: widget.message.isDeleted
            ? null
            : () => context.read<MessageActionsCubit>().messageHighlighted(
                message: widget.message,
              ),
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          color: highlightColor,
          child: Align(
            alignment: widget.alignedRight
                ? Alignment.topRight
                : Alignment.topLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: messageWidth),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: widget.verticalPadding,
                        horizontal: widget.horizontalPadding,
                      ),
                      margin: EdgeInsets.only(
                        left: widget.alignedRight ? 0 : 10.0,
                        right: widget.alignedRight ? 10.0 : 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(15),
                          topRight: const Radius.circular(15),
                          bottomLeft: Radius.circular(
                            widget.alignedRight ? 15 : 0,
                          ),
                          bottomRight: Radius.circular(
                            widget.alignedRight ? 0 : 15,
                          ),
                        ),
                        color: widget.alignedRight
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: widget.child,
                    ),
                  ),
                  if (widget.message.syncStatus == SyncStatus.failed)
                    GestureDetector(
                      onTap: () =>
                          context.read<SyncBloc>().add(SyncEvent.start()),
                      child: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.error_rounded,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
