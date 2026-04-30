import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/messages/messages_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/view/chat_detail.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void navigateToChatDetail({required BuildContext context, required Chat chat}) {
  final authBloc = context.read<AuthBloc>();
  final me = authBloc.state.user!;

  User otherUser = me;
  if (chat.users.length > 1) {
    otherUser = chat.users.firstWhere((u) => u.id != me.id);
  }

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => MessagesBloc(
          webSocketService: context.read<WebSocketService>(),
          databaseRepository: context.read<DatabaseRepository>(),
        ),
        child: ChatDetailPage(chat: chat, me: me, otherUser: otherUser),
      ),
    ),
  );
}
