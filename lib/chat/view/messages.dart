import 'package:collection/collection.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:democracy/post/view/post_tile.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Messages extends StatefulWidget {
  const Messages({
    super.key,
    required this.messages,
    required this.currentUser,
  });

  final List<Message> messages;
  final User currentUser;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late final List<Message> _messages = widget.messages.toList();
  double messageMargin = 10;

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
      widgets.add(SizedBox(height: messageMargin));
      for (Message message in list) {
        bool alignedRight = widget.currentUser.id == message.user.id;
        widgets.add(SizedBox(height: messageMargin));
        if (message.isDeleted) {
          widgets.add(
            AlignmentContainer(
              message: message,
              alignedRight: alignedRight,
              child: Text(
                message.text,
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
                child: PostTile(post: message.post!, isChildOfPost: true),
              ),
            );
          }
          if (message.poll != null) {
            if (message.text.isNotEmpty) {
              widgets.add(SizedBox(height: messageMargin));
            }
            widgets.add(
              AlignmentContainer(
                message: message,
                alignedRight: alignedRight,
                child: PollTile(poll: message.poll!, isChildOfPost: true),
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
                child: SurveyTile(survey: message.survey!, isChildOfPost: true),
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

    return BlocListener<ChatDetailCubit, ChatDetailState>(
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
              _messages.removeWhere((element) => element.id == state.messageId);
            });
          }
        }
      },
      child: ListView(reverse: true, children: widgets),
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
      children: [
        Text(message.text),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            message.isEdited
                ? Text(
                  'Edited',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
                )
                : SizedBox.shrink(),
          ],
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
    var timeFormat = DateFormat('hh:mm');
    return Align(
      alignment: alignedRight ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: alignedRight ? 0 : 20,
          right: alignedRight ? 20 : 0,
        ),
        child: Text(
          timeFormat.format(message.createdAt),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).disabledColor,
          ),
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
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Theme.of(context).canvasColor,
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
