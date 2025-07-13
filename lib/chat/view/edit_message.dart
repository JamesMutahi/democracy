import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_text_form_field.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/view/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditMessage extends StatefulWidget {
  const EditMessage({super.key, required this.message});

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
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          late User user;
          if (state is Authenticated) {
            user = state.user;
          }
          return Messages(messages: [widget.message], currentUser: user);
        },
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
