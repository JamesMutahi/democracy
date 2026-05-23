import 'package:democracy/app/shared/pages/search_results.dart';
import 'package:democracy/app/view/router/router.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/trending_topics/trending_topics_bloc.dart';
import 'package:democracy/user/bloc/follow_recommendations/follow_recommendations_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: CustomScrollView(slivers: [_Trending(), _WhoToFollow()]),
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

          return Container(
            margin: EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ...topics.map(
                  (topic) => Container(
                    key: ValueKey(topic),
                    child: InkWell(
                      onTap: () {
                        navigateToSearchResults(
                          context: context,
                          searchTerm: topic,
                          filterCount: 0,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(topic),
                      ),
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
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
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
                        context.push(ProfileRoute(userId: user.id).location);
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
