import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/user/bloc/followers/followers_bloc.dart';
import 'package:democracy/user/bloc/following/following_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class FollowingPage extends StatefulWidget {
  const FollowingPage({
    super.key,
    @PathParam('id') required this.userId,
    @PathParam('name') required this.userName,
  });

  final int userId;
  final String userName;

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage>
    with SingleTickerProviderStateMixin {
  final ScrollController _followersScrollController = ScrollController();
  final ScrollController _followingScrollController = ScrollController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_activeScrollController!);
    });
  }

  void _onTabChanged() {
    _deactivateTabScrollControllers();
    ActiveScrollController.activate(_activeScrollController!);
  }

  void _deactivateTabScrollControllers() {
    ActiveScrollController.deactivate(_followersScrollController);
    ActiveScrollController.deactivate(_followingScrollController);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    // Clear the registry when leaving
    _deactivateTabScrollControllers();
    _followersScrollController.dispose();
    _followingScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  ScrollController? get _activeScrollController {
    return _tabController.index == 0
        ? _followersScrollController
        : _followingScrollController;
  }

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
      child: MainContainer(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  title: Text(widget.userName),
                  bottom: TabBar(
                    controller: _tabController,
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
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _FollowersTab(
                  scrollController: _followersScrollController,
                  userId: widget.userId,
                ),
                _FollowingTab(
                  scrollController: _followingScrollController,
                  userId: widget.userId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FollowersTab extends StatefulWidget {
  const _FollowersTab({required this.scrollController, required this.userId});

  final ScrollController scrollController;
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
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

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
          scrollController: isWebLayout ? widget.scrollController : null,
          physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
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
            context.router.push(ProfileRoute(username: user.username));
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
  const _FollowingTab({required this.scrollController, required this.userId});

  final ScrollController scrollController;
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
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

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
          scrollController: isWebLayout ? widget.scrollController : null,
          physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
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
            context.router.push(ProfileRoute(username: user.username));
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
