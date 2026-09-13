import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/post/bloc/quotes/quotes_bloc.dart';
import 'package:democracy/post/bloc/reposts/reposts_bloc.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

@RoutePage()
class Reposts extends StatelessWidget {
  const Reposts({super.key, @PathParam('id') required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              QuotesBloc(webSocketService: context.read<WebSocketService>())
                ..add(QuotesEvent.get(postId: postId)),
        ),
        BlocProvider(
          create: (context) =>
              RepostsBloc(webSocketService: context.read<WebSocketService>())
                ..add(RepostsEvent.get(postId: postId)),
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: MainContainer(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Reposts'),
              bottom: TabBar(
                dividerColor: Theme.of(context).colorScheme.outlineVariant,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                tabs: [
                  Tab(text: 'Quotes'),
                  Tab(text: 'Reposts'),
                ],
              ),
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                _Quotes(postId: postId),
                _Reposts(postId: postId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Quotes extends StatefulWidget {
  const _Quotes({required this.postId});

  final int postId;

  @override
  State<_Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<_Quotes> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesBloc, QuotesState>(
      buildWhen: (previous, current) {
        return widget.postId == current.postId;
      },
      builder: (context, state) {
        final posts = state.posts.toList();

        if (state.status == QuotesStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == QuotesStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }

        return PostListView(
          posts: posts,
          loading: state.status == QuotesStatus.initial,
          failure: state.posts.isNotEmpty
              ? false
              : state.status == QuotesStatus.failure,
          onPostsUpdated: (posts) {
            context.read<QuotesBloc>().add(
              QuotesEvent.update(postId: widget.postId, posts: posts),
            );
          },
          refreshController: _refreshController,
          enablePullDown: posts.isNotEmpty,
          enablePullUp: state.hasNext,
          checkVisibility: true,
          onRefresh: () {
            context.read<QuotesBloc>().add(
              QuotesEvent.get(postId: widget.postId),
            );
          },
          onLoading: () {
            context.read<QuotesBloc>().add(
              QuotesEvent.get(postId: widget.postId, previousPosts: posts),
            );
          },
          onFailure: () {
            context.read<QuotesBloc>().add(
              QuotesEvent.get(postId: widget.postId),
            );
          },
          origin: 'Quotes',
        );
      },
    );
  }
}

class _Reposts extends StatefulWidget {
  const _Reposts({required this.postId});

  final int postId;

  @override
  State<_Reposts> createState() => _RepostsState();
}

class _RepostsState extends State<_Reposts> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepostsBloc, RepostsState>(
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == RepostsStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == RepostsStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }
        return UsersListView(
          users: users,
          loading: state.status == RepostsStatus.initial,
          failure: state.users.isNotEmpty
              ? false
              : state.status == RepostsStatus.failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          showProfileButtons: true,
          onUsersUpdated: (users) {
            context.read<RepostsBloc>().add(RepostsEvent.update(users: users));
          },
          onUserTap: (user) {
            context.router.push(ProfileRoute(username: user.username));
          },
          onRefresh: () {
            context.read<RepostsBloc>().add(
              RepostsEvent.get(postId: widget.postId),
            );
          },
          onLoading: () {
            context.read<RepostsBloc>().add(
              RepostsEvent.get(postId: widget.postId, lastUser: users.last),
            );
          },
          onFailure: () {
            context.read<RepostsBloc>().add(
              RepostsEvent.get(postId: widget.postId),
            );
          },
        );
      },
    );
  }
}
