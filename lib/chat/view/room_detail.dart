import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/models/room.dart';
import 'package:democracy/chat/view/edit_message.dart';
import 'package:democracy/chat/view/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

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
  final _focusNode = FocusNode();
  bool _disableSendButton = true;
  bool showMessageActions = false;
  Set<Message> messages = {};

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MessageActionsCubit, MessageActionsState>(
          listener: (context, state) {
            if (state.status == MessageActionsStatus.actionButtonsOpened) {
              setState(() {
                showMessageActions = true;
                messages = state.messages;
              });
            }
            if (state.status == MessageActionsStatus.actionButtonsClosed) {
              setState(() {
                showMessageActions = false;
                messages = {};
              });
            }
          },
        ),
      ],
      child: PopScope(
        canPop: !showMessageActions,
        onPopInvokedWithResult: (didPop, __) {
          context.read<MessageActionsCubit>().closeActionButtons();
        },
        child: Scaffold(
          appBar: AppBar(
            title:
                showMessageActions
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        (messages.length == 1 &&
                                !messages.any(
                                  (message) =>
                                      message.user.id == widget.otherUser.id,
                                ))
                            ? (DateTime.now().difference(
                                      messages.first.createdAt,
                                    ) <
                                    Duration(minutes: 15))
                                ? IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (context) => EditMessage(
                                              message: messages.first,
                                            ),
                                      ),
                                    ).then((value) {
                                      if (mounted) {
                                        context
                                            .read<MessageActionsCubit>()
                                            .closeActionButtons();
                                      }
                                    });
                                  },
                                  icon: Icon(Symbols.edit_rounded),
                                )
                                : SizedBox.shrink()
                            : SizedBox.shrink(),
                        IconButton(
                          onPressed: () async {
                            context
                                .read<MessageActionsCubit>()
                                .closeActionButtons();
                            await Clipboard.setData(
                              ClipboardData(
                                text:
                                    (messages.length == 1)
                                        ? messages.first.text
                                        : copyMultiple(forCopy: messages),
                              ),
                            );
                          },
                          icon: Icon(Symbols.content_copy),
                        ),
                        (messages.any(
                              (message) =>
                                  message.user.id == widget.otherUser.id,
                            ))
                            ? SizedBox.shrink()
                            : IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder:
                                      (context) => DeleteDialog(
                                        messages: messages.toList(),
                                      ),
                                );
                              },
                              icon: Icon(Symbols.delete_rounded),
                            ),
                      ],
                    )
                    : Row(
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
          body: Messages(messages: widget.room.messages),
          bottomNavigationBar: BottomContainer(
            focusNode: _focusNode,
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
        ),
      ),
    );
  }
}

String copyMultiple({required Set<Message> forCopy}) {
  List<Message> messages = forCopy.toList();
  messages.sort((a, b) => a.id.compareTo(b.id));
  var dateFormat = DateFormat('dd/MM/yyyy hh:mm');
  String copiedText = '';
  for (var message in messages) {
    copiedText +=
        '[${dateFormat.format(message.createdAt)}] '
        '${message.user.firstName} ${message.user.lastName}: '
        '${message.text} ${(messages.last == message) ? '' : '\n'}';
  }
  return copiedText;
}

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key, required this.messages});

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.warning_amber_rounded, size: 40),
      iconColor: Colors.amber,
      title: Text('Delete message'),
      content: Text(
        'Are you sure you want to delete this? \n'
        'The message will be permanently deleted',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.deleteMessage(messages: messages),
            );
            context.read<MessageActionsCubit>().closeActionButtons();
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
    required this.focusNode,
    required this.showCursor,
    required this.readOnly,
    this.autoFocus = false,
    required this.controller,
    required this.onTap,
    required this.onChanged,
    required this.hintText,
    required this.prefixIcon,
    this.onSend,
  });

  final FocusNode focusNode;
  final bool showCursor;
  final bool readOnly;
  final bool autoFocus;
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
              focusNode: focusNode,
              showCursor: showCursor,
              readOnly: readOnly,
              autofocus: autoFocus,
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
