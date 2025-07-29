import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/widgets/appbar_title.dart';
import 'package:democracy/chat/view/chats.dart';
import 'package:democracy/chat/view/create_message.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key, required this.user});

  final User user;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getChats());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            floating: true,
            snap: true,
            automaticallyImplyLeading: false,
            forceElevated: true,
            title: AppBarTitle(user: widget.user, extras: []),
          ),
        ];
      },
      body: Stack(
        children: [
          Chats(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 10, bottom: 10),
              child: FloatingActionButton(
                heroTag: 'message',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateMessage()),
                  );
                },
                mini: true,
                child: Icon(Symbols.add_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
