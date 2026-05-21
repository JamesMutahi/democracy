import 'package:democracy/meeting/bloc/listeners/listeners_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart'
    show navigateToProfilePage;
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ListenersTab extends StatefulWidget {
  const ListenersTab({super.key, required this.meeting});

  final Meeting meeting;

  @override
  State<ListenersTab> createState() => _ListenersTabState();
}

class _ListenersTabState extends State<ListenersTab>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<ListenersBloc>().add(
      ListenersEvent.get(meeting: widget.meeting),
    );
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ListenersBloc, ListenersState>(
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == ListenersStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == ListenersStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }
        return UsersListView(
          users: users,
          loading: state.status == ListenersStatus.initial,
          failure: state.users.isNotEmpty
              ? false
              : state.status == ListenersStatus.failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          emptyListText: 'No listeners',
          showProfileButtons: true,
          onUsersUpdated: (users) {
            context.read<ListenersBloc>().add(
              ListenersEvent.update(users: users),
            );
          },
          onUserTap: (user) {
            navigateToProfilePage(context: context, user: user);
          },
          onRefresh: () {
            context.read<ListenersBloc>().add(
              ListenersEvent.get(meeting: widget.meeting),
            );
          },
          onLoading: () {
            context.read<ListenersBloc>().add(
              ListenersEvent.get(meeting: widget.meeting, lastUser: users.last),
            );
          },
          onFailure: () {
            context.read<ListenersBloc>().add(
              ListenersEvent.get(meeting: widget.meeting),
            );
          },
        );
      },
    );
  }
}
