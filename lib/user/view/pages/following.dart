import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/user/bloc/followers/followers_bloc.dart';
import 'package:democracy/user/bloc/following/following_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

@RoutePage()
class FollowingPage extends StatelessWidget {
  const FollowingPage({
    super.key,
    @PathParam('id') required this.userId,
    @PathParam('name') required this.userName,
  });

  final int userId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FollowingBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(
          create: (context) =>
              FollowersBloc(webSocketService: context.read<WebSocketService>()),
        ),
      ],
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  title: Text(userName),
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
              children: [_FollowersTab(userId), _FollowingTab(userId)],
            ),
          ),
        ),
      ),
    );
  }
}

class _FollowersTab extends StatefulWidget {
  const _FollowersTab(this.userId);

  final int userId;

  @override
  State<_FollowersTab> createState() => _FollowersTabState();
}

class _FollowersTabState extends State<_FollowersTab> {
  List<User> selectedUsers = [];
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<FollowersBloc>().add(
      FollowersEvent.get(userId: widget.userId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowersBloc, FollowersState>(
      buildWhen: (previous, current) {
        return widget.userId == current.userId;
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
            context.router.push(ProfileRoute(userId: user.id));
          },
          onRefresh: () {
            context.read<FollowersBloc>().add(
              FollowersEvent.get(userId: widget.userId),
            );
          },
          onLoading: () {
            context.read<FollowersBloc>().add(
              FollowersEvent.get(userId: widget.userId, lastUser: users.last),
            );
          },
          onFailure: () {
            context.read<FollowersBloc>().add(
              FollowersEvent.get(userId: widget.userId),
            );
          },
        );
      },
    );
  }
}

class _FollowingTab extends StatefulWidget {
  const _FollowingTab(this.userId);

  final int userId;

  @override
  State<_FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<_FollowingTab> {
  List<User> selectedUsers = [];
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<FollowingBloc>().add(
      FollowingEvent.get(userId: widget.userId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowingBloc, FollowingState>(
      buildWhen: (previous, current) {
        return widget.userId == current.userId;
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
            context.router.push(ProfileRoute(userId: user.id));
          },
          onRefresh: () {
            context.read<FollowingBloc>().add(
              FollowingEvent.get(userId: widget.userId),
            );
          },
          onLoading: () {
            context.read<FollowingBloc>().add(
              FollowingEvent.get(userId: widget.userId, lastUser: users.last),
            );
          },
          onFailure: () {
            context.read<FollowingBloc>().add(
              FollowingEvent.get(userId: widget.userId),
            );
          },
        );
      },
    );
  }
}
