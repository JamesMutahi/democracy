import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/chat/bloc/messages/messages_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/view/chat_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void navigateToChatDetail({required BuildContext context, required Chat chat}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) =>
            MessagesBloc(webSocketService: context.read<WebSocketService>()),
        child: ChatDetailPage(chat: chat),
      ),
    ),
  );
}
