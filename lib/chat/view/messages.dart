import 'package:collection/collection.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/sync/sync_bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/asset_viewer.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/messages/messages_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/utils/link_extractor.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/meeting/view/widgets/meeting_tile.dart';
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
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      buildWhen: (previous, current) {
        return current.chatId == widget.chat.id;
      },
      builder: (context, state) {
        if (state.status == MessagesStatus.initial ||
            state.status == MessagesStatus.loading && state.messages.isEmpty) {
          return const BottomLoader();
        }

        if (state.status == MessagesStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == MessagesStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }

          if (state.messages.isEmpty) {
            return FailureRetryButton(
              onPressed: () => context.read<MessagesBloc>().add(
                MessagesEvent.get(chat: widget.chat),
              ),
            );
          }
        }

        List<Message> messages = state.messages.toList();

        messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        double messageMargin = 10;

        var groupByDate = groupBy(
          messages,
          (obj) => DateFormat.yMMMMd().format(obj.createdAt),
        );

        List<Widget> widgets = [];
        groupByDate.forEach((date, list) {
          // ListView is in reverse so objects are set in reverse order as well
          for (Message message in list) {
            bool alignedRight = widget.me.id == message.author.id;
            String text = extractLinkFromMessage(message);
            widgets.add(SizedBox(height: messageMargin));
            if (message.isDeleted) {
              widgets.add(
                AlignmentContainer(
                  message: message,
                  alignedRight: alignedRight,
                  verticalPadding: 7,
                  horizontalPadding: 14,
                  child: Text(
                    'Message was deleted',
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                ),
              );
            } else {
              widgets.add(
                MessageTime(message: message, alignedRight: alignedRight),
              );
              if (text.isNotEmpty) {
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
                    verticalPadding: 7,
                    horizontalPadding: 14,
                    child: MessageCard(key: ValueKey(message.id), text: text),
                  ),
                );
              }
              if (message.assets.isNotEmpty) {
                if (text.isNotEmpty) {
                  widgets.add(SizedBox(height: messageMargin));
                }
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
                    child: AssetViewer(
                      key: ValueKey(message.id),
                      assets: message.assets,
                    ),
                  ),
                );
              }
              if (message.location != null) {
                if (text.isNotEmpty) {
                  widgets.add(SizedBox(height: messageMargin));
                }
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
                    child: MapWidget(
                      key: ValueKey(message.id),
                      mapCenter: message.location!,
                    ),
                  ),
                );
              }
              if (message.post != null) {
                if (text.isNotEmpty) {
                  widgets.add(SizedBox(height: messageMargin));
                }
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
                    child: PostWidgetSelector(
                      key: ValueKey(message.id),
                      post: message.post!,
                      isDependency: true,
                    ),
                  ),
                );
              }
              if (message.ballot != null) {
                if (text.isNotEmpty) {
                  widgets.add(SizedBox(height: messageMargin));
                }
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
                    child: BallotTile(
                      key: ValueKey(message.id),
                      ballot: message.ballot!,
                      isDependency: true,
                    ),
                  ),
                );
              }
              if (message.survey != null) {
                if (text.isNotEmpty) {
                  widgets.add(SizedBox(height: messageMargin));
                }
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
                    child: SurveyTile(
                      key: ValueKey(message.id),
                      survey: message.survey!,
                      isDependency: true,
                    ),
                  ),
                );
              }
              if (message.petition != null) {
                if (text.isNotEmpty) {
                  widgets.add(SizedBox(height: messageMargin));
                }
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
                    child: PetitionTile(
                      key: ValueKey(message.id),
                      petition: message.petition!,
                      isDependency: true,
                    ),
                  ),
                );
              }
              if (message.meeting != null) {
                if (text.isNotEmpty) {
                  widgets.add(SizedBox(height: messageMargin));
                }
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
                    child: MeetingTile(
                      key: ValueKey(message.id),
                      meeting: message.meeting!,
                      isDependency: true,
                    ),
                  ),
                );
              }
              if (message.section != null) {
                if (text.isNotEmpty) {
                  widgets.add(SizedBox(height: messageMargin));
                }
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
                    child: SectionTile(
                      key: ValueKey(message.id),
                      section: message.section!,
                      isDependency: true,
                    ),
                  ),
                );
              }
            }
          }
          widgets.add(SizedBox(height: messageMargin));
          if (DateFormat.yMMMMd().format(DateTime.now()) == date) {
            widgets.add(Center(child: Text('Today')));
          } else if (DateFormat.yMMMMd().format(
                DateTime.now().subtract(Duration(days: 1)),
              ) ==
              date) {
            widgets.add(Center(child: Text('Yesterday')));
          } else {
            widgets.add(Center(child: Text(date)));
          }
          widgets.add(SizedBox(height: messageMargin));
        });

        return MultiBlocListener(
          listeners: [
            BlocListener<WebsocketBloc, WebsocketState>(
              listener: (context, websocketState) {
                if (websocketState.status == WebsocketStatus.connected) {
                  context.read<MessagesBloc>().add(
                    MessagesEvent.get(
                      chat: widget.chat,
                      newestMessage: messages
                          .where((m) => m.syncStatus == SyncStatus.synced)
                          .first,
                    ),
                  );
                }
              },
            ),
            BlocListener<SyncBloc, SyncState>(
              listener: (context, state) {
                if (state is MessageSynced) {
                  if (state.message.chatId == widget.chat.id) {
                    context.read<MessagesBloc>().add(
                      MessagesEvent.update(message: state.message),
                    );
                  }
                }
              },
            ),
          ],
          child: SmartRefresher(
            // Messages are listed in reverse, down is up and up is down...lol
            enablePullDown: false,
            enablePullUp: state.hasNext,
            controller: _refreshController,
            onLoading: () {
              context.read<MessagesBloc>().add(
                MessagesEvent.get(
                  chat: widget.chat,
                  oldestMessage: messages
                      .where((m) => m.syncStatus == SyncStatus.synced)
                      .last,
                ),
              );
            },
            footer: ClassicFooter(),
            child: ListView(reverse: true, children: widgets),
          ),
        );
      },
    );
  }
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
    return CustomText(
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
    var timeFormat = DateFormat('hh:mm a');
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
            message.isEdited
                ? Text(
                    'Edited ',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).disabledColor,
                    ),
                  )
                : SizedBox.shrink(),
            message.syncStatus == SyncStatus.pending
                ? SpinKitThreeInOut(
                    color: Theme.of(context).disabledColor,
                    size: Theme.of(context).textTheme.labelSmall!.fontSize!,
                  )
                : message.syncStatus == SyncStatus.failed
                ? Text(
                    'Not Delivered',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  )
                : Text(
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
  double messageMargin = 10;
  Color highlightColor = Colors.transparent;
  bool canTap = false;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    double messageWidth = responsive.screenWidth < 600
        ? MediaQuery.of(context).size.width / 1.5
        : 400;
    return BlocListener<MessageActionsCubit, MessageActionsState>(
      listener: (context, state) {
        if (state.status == MessageActionsStatus.actionButtonsOpened) {
          if (state.messages.contains(widget.message)) {
            setState(() {
              highlightColor = Theme.of(context).highlightColor;
            });
          } else {
            if (highlightColor != Colors.transparent) {
              setState(() {
                highlightColor = Colors.transparent;
              });
            }
          }
          canTap = true;
        }
        if (state.status == MessageActionsStatus.actionButtonsClosed) {
          setState(() {
            highlightColor = Colors.transparent;
            canTap = false;
          });
        }
      },
      child: GestureDetector(
        onTap: widget.message.isDeleted
            ? null
            : canTap
            ? () {
                context.read<MessageActionsCubit>().messageHighlighted(
                  message: widget.message,
                );
              }
            : null,
        child: Container(
          margin: EdgeInsets.only(top: messageMargin),
          color: highlightColor,
          child: GestureDetector(
            onLongPress: widget.message.isDeleted
                ? null
                : () {
                    context.read<MessageActionsCubit>().messageHighlighted(
                      message: widget.message,
                    );
                  },
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
                          left: widget.alignedRight ? 0 : messageMargin,
                          right: widget.alignedRight ? messageMargin : 0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: widget.alignedRight
                                ? Radius.circular(15)
                                : Radius.circular(0),
                            bottomRight: widget.alignedRight
                                ? Radius.circular(0)
                                : Radius.circular(15),
                          ),
                          color: widget.alignedRight
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(
                                  context,
                                ).colorScheme.secondaryContainer,
                        ),
                        child: widget.child,
                      ),
                    ),
                    if (widget.message.syncStatus == SyncStatus.failed)
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: GestureDetector(
                          onTap: () {
                            context.read<SyncBloc>().add(SyncEvent.start());
                          },
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
      ),
    );
  }
}
