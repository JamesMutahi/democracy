import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeakersTab extends StatefulWidget {
  const SpeakersTab({super.key, required this.meeting});

  final Meeting meeting;

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
            user: widget.meeting.host,
            me: me,
            showProfileButtons: true,
            selectedUsers: [],
            onTap: () {
              context.router.push(ProfileRoute(userId: widget.meeting.host.id));
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            User user = widget.meeting.coHosts[index];
            return UserTile(
              user: user,
              me: me,
              showProfileButtons: true,
              selectedUsers: [],
              onTap: () {
                context.router.push(ProfileRoute(userId: user.id));
              },
            );
          }, childCount: widget.meeting.coHosts.length),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            User user = widget.meeting.speakers[index];
            return UserTile(
              user: user,
              me: me,
              showProfileButtons: true,
              selectedUsers: [],
              onTap: () {
                context.router.push(ProfileRoute(userId: user.id));
              },
            );
          }, childCount: widget.meeting.speakers.length),
        ),
      ],
    );
  }
}
