import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/poll/view/polls.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PollPage extends StatefulWidget {
  const PollPage({super.key, required this.user, required this.notifications});

  final User user;
  final int notifications;

  @override
  State<PollPage> createState() => _PollPageState();
}

class _PollPageState extends State<PollPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getPolls());
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
                  hintText: 'Search polls',
                  onChanged: (value) {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.getPolls(searchTerm: value),
                    );
                  },
                ),
              ],
            ),
          ),
        ];
      },
      body: Polls(),
    );
  }
}
