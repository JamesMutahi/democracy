import 'package:democracy/chat/bloc/room_detail/room_detail_cubit.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Messages extends StatefulWidget {
  const Messages({super.key, required this.messages});

  final List<Message> messages;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late final List<Message> _messages = widget.messages.toList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomDetailCubit, RoomDetailState>(
      listener: (context, state) {
        if (state is MessageCreated) {
          setState(() {
            _messages.add(state.room.lastMessage);
            _messages.sort((a, b) => b.id.compareTo(a.id));
          });
        }
      },
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        reverse: true,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Message message = _messages[index];
          return Card(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message.text),
            ),
          );
        },
        itemCount: _messages.length,
      ),
    );
  }
}
