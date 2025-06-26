import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/models/room.dart';
import 'package:democracy/chat/view/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomDetail extends StatefulWidget {
  const RoomDetail({
    super.key,
    required this.title,
    required this.room,
    required this.otherUser,
  });

  final String title;
  final Room room;
  final User otherUser;

  @override
  State<RoomDetail> createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  final _controller = TextEditingController();
  final focusNode = FocusNode();
  bool _disableSendButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ProfileImage(user: widget.otherUser),
            SizedBox(width: 10),
            Text(
              widget.title,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
      body: Messages(
        otherUser: widget.otherUser,
        messages: widget.room.messages,
      ),
      bottomNavigationBar: BottomContainer(
        showCursor: true,
        readOnly: false,
        controller: _controller,
        onTap: () {},
        onChanged: (value) {
          if (value == '') {
            setState(() {
              _disableSendButton = true;
            });
          } else {
            setState(() {
              _disableSendButton = false;
            });
          }
        },
        hintText: 'Message',
        prefixIcon: null,
        onSend:
            _disableSendButton
                ? null
                : () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.createMessage(
                      room: widget.room,
                      message: _controller.text,
                    ),
                  );
                  _controller.clear();
                  setState(() {
                    _disableSendButton = true;
                  });
                },
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
    required this.showCursor,
    required this.readOnly,
    required this.controller,
    required this.onTap,
    required this.onChanged,
    required this.hintText,
    required this.prefixIcon,
    this.onSend,
  });

  final bool showCursor;
  final bool readOnly;
  final TextEditingController controller;
  final VoidCallback onTap;
  final void Function(String) onChanged;
  final String hintText;
  final Widget? prefixIcon;
  final void Function()? onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).canvasColor, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: TextFormField(
              showCursor: showCursor,
              readOnly: readOnly,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 4,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                hintText: hintText,
                prefixIcon: prefixIcon,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                prefixStyle: TextStyle(color: Theme.of(context).primaryColor),
                contentPadding: const EdgeInsets.all(15),
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              controller: controller,
              onTap: onTap,
              onChanged: onChanged,
            ),
          ),
          Flexible(
            child: IconButton(
              onPressed: onSend,
              icon: Icon(Icons.send_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
