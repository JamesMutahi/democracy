import 'package:collection/collection.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/custom_text.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_cubit.dart';
import 'package:democracy/chat/bloc/messages/messages_cubit.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
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
  bool loading = true;
  bool failure = false;
  List<Message> _messages = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  double messageMargin = 10;

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.getMessages(chat: widget.chat),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _messages.sort((a, b) => b.id.compareTo(a.id));

    var groupByDate = groupBy(
      _messages,
      (obj) => DateFormat.yMMMMd().format(obj.createdAt),
    );

    List<Widget> widgets = [];
    groupByDate.forEach((date, list) {
      // ListView is in reverse so objects are set in reverse order as well
      for (Message message in list) {
        bool alignedRight = widget.currentUser.id == message.user.id;
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
          if (message.text.isNotEmpty) {
            widgets.add(
              AlignmentContainer(
                key: ValueKey(message.id),
                message: message,
                alignedRight: alignedRight,
                child: MessageCard(
                  alignedRight: alignedRight,
                  message: message,
                ),
              ),
            );
          }
          if (message.post != null) {
            if (message.text.isNotEmpty) {
              widgets.add(SizedBox(height: messageMargin));
            }
            widgets.add(
              AlignmentContainer(
                message: message,
                alignedRight: alignedRight,
                child: PostTile(post: message.post!, isDependency: true),
              ),
            );
          }
          if (message.ballot != null) {
            if (message.text.isNotEmpty) {
              widgets.add(SizedBox(height: messageMargin));
            }
            widgets.add(
              AlignmentContainer(
                message: message,
                alignedRight: alignedRight,
                child: BallotTile(ballot: message.ballot!, isDependency: true),
              ),
            );
          }
          if (message.survey != null) {
            if (message.text.isNotEmpty) {
              widgets.add(SizedBox(height: messageMargin));
            }
            widgets.add(
              AlignmentContainer(
                message: message,
                alignedRight: alignedRight,
                child: SurveyTile(survey: message.survey!, isDependency: true),
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
        BlocListener<MessagesCubit, MessagesState>(
          listener: (context, state) {
            if (state.status == MessagesStatus.success) {
              setState(() {
                loading = false;
                failure = false;
                _messages = state.messages;
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
            if (state.status == MessagesStatus.failure) {
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
        BlocListener<MessageDetailCubit, MessageDetailState>(
          listener: (context, state) {
            if (state is MessageCreated) {
              setState(() {
                _messages.add(state.message);
              });
            }
            if (state is MessageUpdated) {
              if (_messages.any((element) => element.id == state.message.id)) {
                setState(() {
                  _messages[_messages.indexWhere(
                        (message) => message.id == state.message.id,
                      )] =
                      state.message;
                });
              }
            }
            if (state is MessageDeleted) {
              if (_messages.any((element) => element.id == state.messageId)) {
                setState(() {
                  _messages.removeWhere(
                    (element) => element.id == state.messageId,
                  );
                });
              }
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
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getMessages(chat: widget.chat),
                  );
                },
              )
              : SmartRefresher(
                // Messages are listed in reverse, down is up and up is down...lol
                enablePullDown: false,
                enablePullUp: hasNextPage,
                controller: _refreshController,
                onLoading: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getMessages(
                      chat: widget.chat,
                      lastMessage: _messages.last,
                    ),
                  );
                },
                footer: ClassicFooter(),
                child: ListView(reverse: true, children: widgets),
              ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.alignedRight,
    required this.message,
  });

  final bool alignedRight;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          alignedRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [MessageBody(text: message.text)],
    );
  }
}

class MessageBody extends StatefulWidget {
  const MessageBody({super.key, required this.text});

  final String text;

  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
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
    double messageWidth = 0.8 * MediaQuery.of(context).size.width;
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
        onTap:
            widget.message.isDeleted
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
            onLongPress:
                widget.message.isDeleted
                    ? null
                    : () {
                      context.read<MessageActionsCubit>().messageHighlighted(
                        message: widget.message,
                      );
                    },
            child: Align(
              alignment:
                  widget.alignedRight ? Alignment.topRight : Alignment.topLeft,
              child: Container(
                constraints: BoxConstraints(maxWidth: messageWidth),
                margin: EdgeInsets.only(
                  left: widget.alignedRight ? 0 : messageMargin,
                  right: widget.alignedRight ? messageMargin : 0,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft:
                        widget.alignedRight
                            ? Radius.circular(15)
                            : Radius.circular(0),
                    bottomRight:
                        widget.alignedRight
                            ? Radius.circular(0)
                            : Radius.circular(15),
                  ),
                  color:
                      widget.alignedRight
                          ? Theme.of(
                            context,
                          ).colorScheme.primaryContainer.withValues(alpha: 0.6)
                          : Theme.of(context).colorScheme.tertiaryContainer,
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
