import 'package:democracy/user/bloc/blocked/blocked_bloc.dart';
import 'package:democracy/user/bloc/muted/muted_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class MutedAndBlocked extends StatelessWidget {
  const MutedAndBlocked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                title: Text('Muted and Blocked'),
                bottom: TabBar(
                  dividerColor: Theme.of(context).colorScheme.outlineVariant,
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  tabs: [
                    Tab(text: 'Muted accounts'),
                    Tab(text: 'Blocked accounts'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [_MutedTab(), _BlockedTab()],
          ),
        ),
      ),
    );
  }
}

class _MutedTab extends StatefulWidget {
  const _MutedTab();

  @override
  State<_MutedTab> createState() => _MutedTabState();
}

class _MutedTabState extends State<_MutedTab> {
  List<User> selectedUsers = [];
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<MutedBloc>().add(MutedEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MutedBloc, MutedState>(
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == MutedStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == MutedStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }
        return UsersListView(
          users: users,
          selectedUsers: selectedUsers,
          loading:
              state.status == MutedStatus.initial ||
              state.status == MutedStatus.loading,
          failure: state.status == MutedStatus.failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          showProfileButtons: true,
          onUsersUpdated: (users) {
            context.read<MutedBloc>().add(MutedEvent.update(users: users));
          },
          onUserTap: (user) {
            navigateToProfilePage(context: context, user: user);
          },
          onRefresh: () {
            context.read<MutedBloc>().add(MutedEvent.get());
          },
          onLoading: () {
            context.read<MutedBloc>().add(MutedEvent.get(lastUser: users.last));
          },
          onFailure: () {
            context.read<MutedBloc>().add(MutedEvent.get());
          },
        );
      },
    );
  }
}

class _BlockedTab extends StatefulWidget {
  const _BlockedTab();

  @override
  State<_BlockedTab> createState() => _BlockedTabState();
}

class _BlockedTabState extends State<_BlockedTab> {
  List<User> selectedUsers = [];
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<BlockedBloc>().add(BlockedEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlockedBloc, BlockedState>(
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == BlockedStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == BlockedStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }

        return UsersListView(
          users: users,
          selectedUsers: selectedUsers,
          loading:
              state.status == BlockedStatus.initial ||
              state.status == BlockedStatus.loading,
          failure: state.status == BlockedStatus.failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          showProfileButtons: true,
          onUsersUpdated: (users) {
            context.read<BlockedBloc>().add(BlockedEvent.update(users: users));
          },
          onUserTap: (user) {
            navigateToProfilePage(context: context, user: user);
          },
          onRefresh: () {
            context.read<BlockedBloc>().add(BlockedEvent.get());
          },
          onLoading: () {
            context.read<BlockedBloc>().add(
              BlockedEvent.get(lastUser: users.last),
            );
          },
          onFailure: () {
            context.read<BlockedBloc>().add(BlockedEvent.get());
          },
        );
      },
    );
  }
}
