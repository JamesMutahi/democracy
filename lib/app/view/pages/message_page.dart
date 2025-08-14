import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/chat/view/chats.dart';
import 'package:democracy/chat/view/create_message.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({
    super.key,
    required this.user,
    required this.notifications,
  });

  final User user;
  final List<n_.Notification> notifications;

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
            flexibleSpace: CustomAppBar(
              user: widget.user,
              notifications: widget.notifications,
              extras: [
                AppBarSearchBar(
                  hintText: 'Search messages',
                  onChanged: (value) {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.getChats(searchTerm: value),
                    );
                  },
                ),
              ],
            ),
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
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: const BeveledRectangleBorder(),
                    builder: (context) => CreateMessage(),
                  );
                },
                child: Icon(Icons.send_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
