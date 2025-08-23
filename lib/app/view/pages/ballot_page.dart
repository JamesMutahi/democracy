import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/ballot/view/ballots.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BallotPage extends StatefulWidget {
  const BallotPage({
    super.key,
    required this.user,
    required this.notifications,
  });

  final User user;
  final int notifications;

  @override
  State<BallotPage> createState() => _BallotPageState();
}

class _BallotPageState extends State<BallotPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
                  hintText: 'Search ballots',
                  onChanged: (value) {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.getBallots(searchTerm: value),
                    );
                  },
                ),
              ],
            ),
          ),
        ];
      },
      body: Ballots(),
    );
  }
}
