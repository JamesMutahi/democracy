import 'package:democracy/meeting/bloc/participants/participants_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class AllTab extends StatefulWidget {
  const AllTab({super.key, required this.meeting});

  final Meeting meeting;

  @override
  State<AllTab> createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context.read<ParticipantsBloc>().add(
      ParticipantsEvent.get(meeting: widget.meeting),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ParticipantsBloc, ParticipantsState>(
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == ParticipantsStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == ParticipantsStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }
        return UsersListView(
          users: users,
          loading:
              state.status == ParticipantsStatus.initial ||
              (users.isEmpty && state.status == ParticipantsStatus.loading),
          failure: state.users.isNotEmpty
              ? false
              : state.status == ParticipantsStatus.failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          showProfileButtons: true,
          onUsersUpdated: (users) {
            context.read<ParticipantsBloc>().add(
              ParticipantsEvent.update(users: users),
            );
          },
          onUserTap: (user) {
            navigateToProfilePage(context: context, user: user);
          },
          onRefresh: () {
            context.read<ParticipantsBloc>().add(
              ParticipantsEvent.get(meeting: widget.meeting),
            );
          },
          onLoading: () {
            context.read<ParticipantsBloc>().add(
              ParticipantsEvent.get(
                meeting: widget.meeting,
                lastUser: users.last,
              ),
            );
          },
          onFailure: () {
            context.read<ParticipantsBloc>().add(
              ParticipantsEvent.get(meeting: widget.meeting),
            );
          },
        );
      },
    );
  }
}
