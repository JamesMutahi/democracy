import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/user/bloc/followers/followers_bloc.dart';
import 'package:democracy/user/bloc/following/following_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
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
                  tabs: [Tab(text: 'Followers'), Tab(text: 'Following')],
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
  bool loading = true;
  bool failure = false;
  List<User> _users = [];
  List<User> selectedUsers = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<FollowersBloc>().add(FollowersEvent.get(user: widget.user));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<UsersBloc>().add(
                UsersEvent.resubscribe(users: _users),
              );
            }
          },
        ),
        BlocListener<FollowersBloc, FollowersState>(
          listener: (context, state) {
            if (state.status == FollowersStatus.success) {
              setState(() {
                _users = state.users;
                loading = false;
                failure = false;
                hasNextPage = state.hasNext;
              });
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshCompleted();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadComplete();
              }
            }
            if (state.status == FollowersStatus.failure) {
              if (loading) {
                setState(() {
                  loading = false;
                  failure = true;
                });
              }
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
            }
          },
        ),
      ],
      child: UsersListView(
        users: _users,
        selectedUsers: selectedUsers,
        loading: loading,
        failure: failure,
        refreshController: _refreshController,
        enablePullDown: true,
        enablePullUp: hasNextPage,
        showProfileButtons: true,
        onUsersUpdated: (users) {
          setState(() {
            _users = users;
          });
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
            FollowersEvent.get(user: widget.user, lastUser: _users.last),
          );
        },
        onFailure: () {
          context.read<FollowersBloc>().add(
            FollowersEvent.get(user: widget.user),
          );
        },
      ),
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
  bool loading = true;
  bool failure = false;
  List<User> _users = [];
  List<User> selectedUsers = [];
  int currentPage = 1;
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<FollowingBloc>().add(FollowingEvent.get(user: widget.user));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<UsersBloc>().add(
                UsersEvent.resubscribe(users: _users),
              );
            }
          },
        ),
        BlocListener<FollowingBloc, FollowingState>(
          listener: (context, state) {
            if (state.status == FollowingStatus.success) {
              setState(() {
                _users = state.users;
                loading = false;
                failure = false;
                currentPage = currentPage;
                hasNextPage = state.hasNext;
              });
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshCompleted();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadComplete();
              }
            }
            if (state.status == FollowingStatus.failure) {
              if (loading) {
                setState(() {
                  loading = false;
                  failure = true;
                });
              }
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
            }
          },
        ),
      ],
      child: UsersListView(
        users: _users,
        selectedUsers: selectedUsers,
        loading: loading,
        failure: failure,
        refreshController: _refreshController,
        enablePullDown: true,
        enablePullUp: hasNextPage,
        showProfileButtons: true,
        onUsersUpdated: (users) {
          setState(() {
            _users = users;
          });
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
            FollowingEvent.get(user: widget.user, lastUser: _users.last),
          );
        },
        onFailure: () {
          context.read<FollowingBloc>().add(
            FollowingEvent.get(user: widget.user),
          );
        },
      ),
    );
  }
}
