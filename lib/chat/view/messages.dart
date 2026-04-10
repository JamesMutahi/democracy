import 'package:collection/collection.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/image_viewer.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/shared/widgets/video_viewer.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_bloc.dart';
import 'package:democracy/chat/bloc/messages/messages_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/utils/link_extractor.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/meet/view/meeting_tile.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Messages extends StatefulWidget {
  const Messages({super.key, required this.chat, required this.currentUser});

  final Chat chat;
  final User currentUser;

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
    return BlocListener<MessageDetailBloc, MessageDetailState>(
      listener: (context, state) {
        if (state is MessageCreated) {
          if (state.message.chatId == widget.chat.id) {
            context.read<MessagesBloc>().add(
              MessagesEvent.add(message: state.message),
            );
          }
        }

        if (state is MessageUpdated) {
          if (state.message.chatId == widget.chat.id) {
            context.read<MessagesBloc>().add(
              MessagesEvent.update(message: state.message),
            );
          }
        }

        if (state is MessageDeleted) {
          context.read<MessagesBloc>().add(
            MessagesEvent.remove(messageId: state.messageId),
          );
        }

        if (state is MessageDetailFailure) {
          final snackBar = getSnackBar(
            context: context,
            message: state.error,
            status: SnackBarStatus.failure,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },

      child: BlocBuilder<MessagesBloc, MessagesState>(
        buildWhen: (previous, current) {
          return current.chatId == widget.chat.id;
        },
        builder: (context, state) {
          if (state.status == MessagesStatus.initial ||
              state.status == MessagesStatus.loading &&
                  state.messages.isEmpty) {
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
          messages.sort((a, b) => b.id.compareTo(a.id));

          double messageMargin = 10;

          var groupByDate = groupBy(
            messages,
            (obj) => DateFormat.yMMMMd().format(obj.createdAt),
          );

          List<Widget> widgets = [];
          groupByDate.forEach((date, list) {
            // ListView is in reverse so objects are set in reverse order as well
            for (Message message in list) {
              bool alignedRight = widget.currentUser.id == message.author.id;
              String text = extractLinkFromMessage(message);
              widgets.add(SizedBox(height: messageMargin));
              if (message.isDeleted) {
                widgets.add(
                  AlignmentContainer(
                    message: message,
                    alignedRight: alignedRight,
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
                      key: ValueKey(message.id),
                      message: message,
                      alignedRight: alignedRight,
                      child: MessageCard(text: text),
                    ),
                  );
                }
                if (message.image1Url != null) {
                  if (text.isNotEmpty) {
                    widgets.add(SizedBox(height: messageMargin));
                  }
                  widgets.add(
                    AlignmentContainer(
                      message: message,
                      alignedRight: alignedRight,
                      child: ImageViewer(message: message),
                    ),
                  );
                }
                if (message.videoUrl != null) {
                  if (text.isNotEmpty) {
                    widgets.add(SizedBox(height: messageMargin));
                  }
                  widgets.add(
                    AlignmentContainer(
                      message: message,
                      alignedRight: alignedRight,
                      child: VideoViewer(urls: [message.videoUrl!]),
                    ),
                  );
                }
                if (message.fileUrl != null) {
                  if (text.isNotEmpty) {
                    widgets.add(SizedBox(height: messageMargin));
                  }
                  widgets.add(
                    AlignmentContainer(
                      message: message,
                      alignedRight: alignedRight,
                      child: FileWidget(url: message.fileUrl!),
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
                      child: MapWidget(mapCenter: message.location!),
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

          return BlocListener<WebsocketBloc, WebsocketState>(
            listener: (context, websocketState) {
              if (websocketState.status == WebsocketStatus.connected) {
                context.read<MessagesBloc>().add(
                  MessagesEvent.get(
                    chat: widget.chat,
                    newestMessage: messages.first,
                  ),
                );
              }
            },
            child: SmartRefresher(
              // Messages are listed in reverse, down is up and up is down...lol
              enablePullDown: false,
              enablePullUp: state.hasNext,
              controller: _refreshController,
              onLoading: () {
                context.read<MessagesBloc>().add(
                  MessagesEvent.get(
                    chat: widget.chat,
                    oldestMessage: messages.last,
                  ),
                );
              },
              footer: ClassicFooter(),
              child: ListView(reverse: true, children: widgets),
            ),
          );
        },
      ),
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
  });

  final bool alignedRight;
  final Message message;
  final Widget child;

  @override
  State<AlignmentContainer> createState() => _AlignmentContainerState();
}

class _AlignmentContainerState extends State<AlignmentContainer> {
  double messageMargin = 10;
  Color highlightColor = Colors.transparent;
  bool canTap = false;

  @override
  Widget build(BuildContext context) {
    double messageWidth = 0.75 * MediaQuery.of(context).size.width;
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
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: messageWidth,
                  minWidth: 60,
                ),
                margin: EdgeInsets.only(
                  left: widget.alignedRight ? 0 : messageMargin,
                  right: widget.alignedRight ? messageMargin : 0,
                ),
                padding: const EdgeInsets.all(10),
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
                      : Theme.of(context).colorScheme.secondaryContainer,
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
