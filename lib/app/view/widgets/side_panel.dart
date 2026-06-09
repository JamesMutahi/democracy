import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/route/route_cubit.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/explore_search_anchor.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/post/bloc/trending_topics/trending_topics_bloc.dart';
import 'package:democracy/user/bloc/follow_recommendations/follow_recommendations_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({super.key});

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    String currentRoute = context.watch<RouteCubit>().state;
    bool hideSearchBar =
        currentRoute == ExploreRoute.name || currentRoute == SearchResults.name;
    return Builder(
      builder: (context) {
        return Container(
          constraints: BoxConstraints(maxWidth: 400),
          margin: EdgeInsets.only(top: 10),
          child: CustomScrollView(
            slivers: [
              if (!hideSearchBar)
                SliverToBoxAdapter(
                  child: ExploreSearchAnchor(
                    searchController: _searchController,
                    filterCubit: PostFilterCubit(),
                    filterState: PostFilterState(),
                    hideFilterButton: true,
                    onSubmitted: () {},
                  ),
                ),
              _Trending(),
              _WhoToFollow(),
            ],
          ),
        );
      },
    );
  }
}

class _Trending extends StatefulWidget {
  const _Trending();

  @override
  State<_Trending> createState() => _TrendingState();
}

class _TrendingState extends State<_Trending> {
  @override
  void initState() {
    context.read<TrendingTopicsBloc>().add(TrendingTopicsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<TrendingTopicsBloc, TrendingTopicsState>(
        builder: (context, state) {
          final topics = state.topics.toList();

          return _Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, bottom: 5),
                  child: Text(
                    'Trending',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ...topics.map(
                  (topic) => Container(
                    key: ValueKey(topic),
                    child: InkWell(
                      onTap: () {
                        context.router.push(
                          SearchResults(
                            searchTerm: topic,
                            startDate: null,
                            endDate: null,
                            filterCount: 0,
                          ),
                        );
                      },
                      child: ListTile(title: Text(topic)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _WhoToFollow extends StatefulWidget {
  const _WhoToFollow();

  @override
  State<_WhoToFollow> createState() => _WhoToFollowState();
}

class _WhoToFollowState extends State<_WhoToFollow> {
  @override
  void initState() {
    context.read<FollowRecommendationsBloc>().add(
      FollowRecommendationsEvent.get(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowRecommendationsBloc, FollowRecommendationsState>(
      builder: (context, state) {
        final users = state.users.take(3).toList();

        final authBloc = context.read<AuthBloc>();
        final me = authBloc.state.user!;

        return BlocListener<UserDetailBloc, UserDetailState>(
          listener: (context, state) {
            if (state is UserUpdated) {
              if (users.any((user) => user.id == state.user.id)) {
                int index = users.indexWhere(
                  (user) => user.id == state.user.id,
                );
                users[index] = state.user;
                context.read<FollowRecommendationsBloc>().add(
                  FollowRecommendationsEvent.update(users: users),
                );
              }
            }
          },
          child: SliverToBoxAdapter(
            child: _Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 5),
                    child: Text(
                      'Who to follow',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ...users.map(
                    (user) => UserTile(
                      user: user,
                      me: me,
                      showProfileButtons: true,
                      hideOverflow: true,
                      selectedUsers: [],
                      onTap: () {
                        String currentPath = context.router.currentPath;
                        if (!currentPath.contains('profile/${user.id}')) {
                          context.router.push(ProfileRoute(userId: user.id));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 20),
      padding: EdgeInsets.only(top: 15, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
