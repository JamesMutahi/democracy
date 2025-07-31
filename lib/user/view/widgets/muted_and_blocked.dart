import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/user/bloc/blocked/blocked_cubit.dart';
import 'package:democracy/user/bloc/muted/muted_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/profile.dart';
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
    context.read<WebsocketBloc>().add(WebsocketEvent.getMuted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MutedCubit, MutedState>(
      listener: (context, state) {
        if (state.status == MutedStatus.success) {
          setState(() {
            _users = state.users;
            loading = false;
            failure = false;
            currentPage = currentPage;
            hasNextPage = hasNextPage;
          });
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }
        if (state.status == MutedStatus.failure) {
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
      child: UsersListView(
        users: _users,
        selectedUsers: selectedUsers,
        loading: loading,
        failure: failure,
        refreshController: _refreshController,
        enablePullDown: true,
        enablePullUp: hasNextPage ? true : false,
        onUserTap: (user) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
          );
        },
        onRefresh: () {
          context.read<WebsocketBloc>().add(WebsocketEvent.getMuted());
        },
        onLoading: () {
          context.read<WebsocketBloc>().add(
            WebsocketEvent.getMuted(page: currentPage + 1),
          );
        },
        onFailure: () {
          context.read<WebsocketBloc>().add(WebsocketEvent.getMuted());
        },
      ),
    );
  }
}

class _BlockedTab extends StatefulWidget {
  const _BlockedTab();

  @override
  State<_BlockedTab> createState() => _BlockedTabState();
}

class _BlockedTabState extends State<_BlockedTab> {
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
    context.read<WebsocketBloc>().add(WebsocketEvent.getBlocked());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlockedCubit, BlockedState>(
      listener: (context, state) {
        if (state.status == BlockedStatus.success) {
          setState(() {
            _users = state.users;
            loading = false;
            failure = false;
            currentPage = currentPage;
            hasNextPage = hasNextPage;
          });
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }
        if (state.status == BlockedStatus.failure) {
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
      child: UsersListView(
        users: _users,
        selectedUsers: selectedUsers,
        loading: loading,
        failure: failure,
        refreshController: _refreshController,
        enablePullDown: true,
        enablePullUp: hasNextPage ? true : false,
        onUserTap: (user) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
          );
        },
        onRefresh: () {
          context.read<WebsocketBloc>().add(WebsocketEvent.getBlocked());
        },
        onLoading: () {
          context.read<WebsocketBloc>().add(
            WebsocketEvent.getBlocked(page: currentPage + 1),
          );
        },
        onFailure: () {
          context.read<WebsocketBloc>().add(WebsocketEvent.getBlocked());
        },
      ),
    );
  }
}
