import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/user/bloc/blocked/blocked_bloc.dart';
import 'package:democracy/user/bloc/muted/muted_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class MutedAndBlocked extends StatefulWidget {
  const MutedAndBlocked({super.key});

  @override
  State<MutedAndBlocked> createState() => _MutedAndBlockedState();
}

class _MutedAndBlockedState extends State<MutedAndBlocked>
    with SingleTickerProviderStateMixin {
  final ScrollController _mutedScrollController = ScrollController();
  final ScrollController _blockedScrollController = ScrollController();

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
    ActiveScrollController.deactivate(_mutedScrollController);
    ActiveScrollController.deactivate(_blockedScrollController);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    // Clear the registry when leaving
    _deactivateTabScrollControllers();
    _mutedScrollController.dispose();
    _blockedScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  ScrollController? get _activeScrollController {
    return _tabController.index == 0
        ? _mutedScrollController
        : _blockedScrollController;
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                title: Text('Muted and Blocked'),
                bottom: TabBar(
                  controller: _tabController,
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
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _MutedTab(scrollController: _mutedScrollController),
              _BlockedTab(scrollController: _blockedScrollController),
            ],
          ),
        ),
      ),
    );
  }
}

class _MutedTab extends StatefulWidget {
  const _MutedTab({required this.scrollController});

  final ScrollController scrollController;

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
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

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
          scrollController: isWebLayout ? widget.scrollController : null,
          physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
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
            context.router.push(ProfileRoute(username: user.username));
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
  const _BlockedTab({required this.scrollController});

  final ScrollController scrollController;

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
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

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
          scrollController: isWebLayout ? widget.scrollController : null,
          physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
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
            context.router.push(ProfileRoute(username: user.username));
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
