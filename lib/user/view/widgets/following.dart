import 'package:democracy/user/bloc/followers/followers_bloc.dart';
import 'package:democracy/user/bloc/following/following_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Following extends StatelessWidget {
  const Following({super.key, required this.user});

  final User user;

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
                title: Text(user.name),
                bottom: TabBar(
                  dividerColor: Theme.of(context).colorScheme.outlineVariant,
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  tabs: [
                    Tab(text: 'Followers'),
                    Tab(text: 'Following'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [_FollowersTab(user), _FollowingTab(user)],
          ),
        ),
      ),
    );
  }
}

class _FollowersTab extends StatefulWidget {
  const _FollowersTab(this.user);

  final User user;

  @override
  State<_FollowersTab> createState() => _FollowersTabState();
}

class _FollowersTabState extends State<_FollowersTab> {
  List<User> selectedUsers = [];
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<FollowersBloc>().add(FollowersEvent.get(user: widget.user));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowersBloc, FollowersState>(
      buildWhen: (previous, current) {
        return widget.user.id == current.userId;
      },
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == FollowersStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == FollowersStatus.failure) {
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
          loading: state.status == FollowersStatus.initial,
          failure: state.users.isNotEmpty
              ? false
              : state.status == FollowersStatus.failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          showProfileButtons: true,
          onUsersUpdated: (users) {
            context.read<FollowersBloc>().add(
              FollowersEvent.update(users: users),
            );
          },
          onUserTap: (user) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
            );
          },
          onRefresh: () {
            context.read<FollowersBloc>().add(
              FollowersEvent.get(user: widget.user),
            );
          },
          onLoading: () {
            context.read<FollowersBloc>().add(
              FollowersEvent.get(user: widget.user, lastUser: users.last),
            );
          },
          onFailure: () {
            context.read<FollowersBloc>().add(
              FollowersEvent.get(user: widget.user),
            );
          },
        );
      },
    );
  }
}

class _FollowingTab extends StatefulWidget {
  const _FollowingTab(this.user);

  final User user;

  @override
  State<_FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<_FollowingTab> {
  List<User> selectedUsers = [];
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<FollowingBloc>().add(FollowingEvent.get(user: widget.user));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowingBloc, FollowingState>(
      buildWhen: (previous, current) {
        return widget.user.id == current.userId;
      },
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == FollowingStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == FollowingStatus.failure) {
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
          loading: state.status == FollowingStatus.initial,
          failure: state.users.isNotEmpty
              ? false
              : state.status == FollowingStatus.failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          showProfileButtons: true,
          onUsersUpdated: (users) {
            context.read<FollowingBloc>().add(
              FollowingEvent.update(users: users),
            );
          },
          onUserTap: (user) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
            );
          },
          onRefresh: () {
            context.read<FollowingBloc>().add(
              FollowingEvent.get(user: widget.user),
            );
          },
          onLoading: () {
            context.read<FollowingBloc>().add(
              FollowingEvent.get(user: widget.user, lastUser: users.last),
            );
          },
          onFailure: () {
            context.read<FollowingBloc>().add(
              FollowingEvent.get(user: widget.user),
            );
          },
        );
      },
    );
  }
}
