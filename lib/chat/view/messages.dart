import 'package:collection/collection.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/room_detail/room_detail_cubit.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Messages extends StatefulWidget {
  const Messages({super.key, required this.messages});

  final List<Message> messages;

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
        widgets.add(MessageCard(key: ValueKey(message.id), message: message));
      }
      if (DateFormat.yMMMMd().format(DateTime.now()) == date) {
        widgets.add(Center(child: Text('Today')));
      } else {
        widgets.add(Center(child: Text(date)));
      }
      widgets.add(SizedBox(height: messageMargin));
    });

    return BlocListener<RoomDetailCubit, RoomDetailState>(
      listener: (context, state) {
        if (state is MessageCreated) {
          setState(() {
            _messages.add(state.room.lastMessage);
          });
        }
        if (state is MessageEdited) {
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
          if (_messages.any((element) => element.id == state.message.id)) {
            setState(() {
              _messages[_messages.indexWhere(
                    (message) => message.id == state.message.id,
                  )] =
                  state.message;
            });
          }
        }
      },
      child: ListView(reverse: true, children: widgets),
    );
  }
}

class MessageCard extends StatefulWidget {
  const MessageCard({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  var timeFormat = DateFormat('hh:mm');
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
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          late User currentUser;
          if (state is Authenticated) {
            currentUser = state.user;
          }
          bool alignedRight = currentUser.id == widget.message.user.id;
          return GestureDetector(
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
                          context
                              .read<MessageActionsCubit>()
                              .messageHighlighted(message: widget.message);
                        },
                child: Align(
                  key: ValueKey(widget.message.id),
                  alignment:
                      alignedRight ? Alignment.topRight : Alignment.topLeft,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: messageWidth),
                    margin: EdgeInsets.only(
                      left: alignedRight ? 0 : messageMargin,
                      right: alignedRight ? messageMargin : 0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Theme.of(context).canvasColor,
                    ),
                    child:
                        widget.message.isDeleted
                            ? Text(
                              widget.message.text,
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                              ),
                            )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                                  alignedRight
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                              children: [
                                Text(widget.message.text),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    widget.message.isEdited
                                        ? Text(
                                          'Edited',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.labelSmall?.copyWith(
                                            color:
                                                Theme.of(context).disabledColor,
                                          ),
                                        )
                                        : SizedBox.shrink(),
                                    SizedBox(width: 5),
                                    Text(
                                      timeFormat.format(
                                        widget.message.createdAt,
                                      ),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelSmall?.copyWith(
                                        color: Theme.of(context).disabledColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
