import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeakersTab extends StatefulWidget {
  const SpeakersTab({super.key, required this.broadcast});

  final Broadcast broadcast;

  @override
  State<SpeakersTab> createState() => _SpeakersTabState();
}

class _SpeakersTabState extends State<SpeakersTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final me = context.read<AuthBloc>().state.user!;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: UserTile(
            user: widget.broadcast.host,
            me: me,
            showProfileButtons: true,
            selectedUsers: [],
            onTap: () {
              context.router.push(ProfileRoute(userId: widget.broadcast.host.id));
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            User user = widget.broadcast.coHosts[index];
            return UserTile(
              user: user,
              me: me,
              showProfileButtons: true,
              selectedUsers: [],
              onTap: () {
                context.router.push(ProfileRoute(userId: user.id));
              },
            );
          }, childCount: widget.broadcast.coHosts.length),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            User user = widget.broadcast.speakers[index];
            return UserTile(
              user: user,
              me: me,
              showProfileButtons: true,
              selectedUsers: [],
              onTap: () {
                context.router.push(ProfileRoute(userId: user.id));
              },
            );
          }, childCount: widget.broadcast.speakers.length),
        ),
      ],
    );
  }
}
