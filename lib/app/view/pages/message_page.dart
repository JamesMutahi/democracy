import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/chat/bloc/chats/chats_cubit.dart';
import 'package:democracy/chat/view/chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        switch (state) {
          case ChatsLoaded(:final chats):
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                late User user;
                if (state is Authenticated) {
                  user = state.user;
                }
                return Stack(
                  children: [
                    Chats(chats: chats, currentUser: user),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        child: FloatingActionButton(
                          heroTag: 'message',
                          onPressed: () {
                            //   TODO:
                          },
                          mini: true,
                          child: Icon(Symbols.add_rounded),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          case ChatsFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(WebsocketEvent.connect());
              },
            );
          default:
            return LoadingIndicator();
        }
      },
    );
  }
}
