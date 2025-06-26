import 'package:collection/collection.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/room_detail/room_detail_cubit.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Messages extends StatefulWidget {
  const Messages({super.key, required this.otherUser, required this.messages});
  final User otherUser;
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
      widgets.add(SizedBox(height: messageMargin));
      for (Message message in list) {
        widgets.add(MessageCard(message: message, otherUser: widget.otherUser));
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
      },
      child: ListView(reverse: true, children: widgets),

      // ListView.builder(
      //   scrollDirection: Axis.vertical,
      //   reverse: true,
      //   shrinkWrap: true,
      //   padding: EdgeInsets.only(bottom: messageMargin),
      //   itemBuilder: (BuildContext context, int index) {
      //     print(groupByDate);
      //     var message = _messages[index];
      //     return MessageCard(message: message, otherUser: widget.otherUser);
      //   },
      //   itemCount: _messages.length,
      // ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.message,
    required this.otherUser,
  });

  final Message message;
  final User otherUser;

  @override
  Widget build(BuildContext context) {
    var timeFormat = DateFormat('hh:mm');
    double messageMargin = 10;
    double messageWidth = 0.8 * MediaQuery.of(context).size.width;
    bool alignedLeft = otherUser.id == message.user.id;
    return Align(
      key: ValueKey(message.id),
      alignment: alignedLeft ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: messageWidth),
        margin: EdgeInsets.only(
          top: messageMargin,
          left: alignedLeft ? messageMargin : 0,
          right: alignedLeft ? 0 : messageMargin,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              alignedLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            SelectableText(message.text),
            Text(
              timeFormat.format(message.createdAt),
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
