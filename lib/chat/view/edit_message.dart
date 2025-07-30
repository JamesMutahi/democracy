import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_text_form_field.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditMessage extends StatefulWidget {
  const EditMessage({super.key, required this.chat, required this.message});

  final Chat chat;
  final Message message;

  @override
  State<EditMessage> createState() => _EditMessageState();
}

class _EditMessageState extends State<EditMessage> {
  final _focusNode = FocusNode();
  bool _disableSendButton = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.message.text;
    context.read<MessageActionsCubit>().closeActionButtons();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).scaffoldBackgroundColor.withValues(alpha: 0.75),
      appBar: AppBar(title: Text('Edit message')),
      body: ListView(
        reverse: true,
        children: [
          SizedBox(height: 10),
          MessageTime(message: widget.message, alignedRight: true),
          AlignmentContainer(
            key: ValueKey(widget.message.id),
            message: widget.message,
            alignedRight: true,
            child: MessageCard(alignedRight: true, message: widget.message),
          ),
        ],
      ),
      bottomNavigationBar: BottomTextFormField(
        focusNode: _focusNode,
        showCursor: true,
        readOnly: false,
        autoFocus: true,
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
        hintText: 'Edit message',
        prefixIcon: null,
        onSend:
            _disableSendButton
                ? null
                : () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.editMessage(
                      messageId: widget.message.id,
                      text: _controller.text,
                    ),
                  );
                  Navigator.pop(context);
                },
      ),
    );
  }
}
