import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/expandable_fab.dart';
import 'package:democracy/post/bloc/following_posts/following_posts_bloc.dart';
import 'package:democracy/post/bloc/for_you/for_you_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/posts/posts_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user, required this.notifications});

  final User user;
  final int notifications;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<PostDetailBloc, PostDetailState>(
      listener: (context, state) {
        if (state is PostCreated) {
          String message =
              state.post.status == PostStatus.published
                  ? state.post.replyTo == null
                      ? 'Posted'
                      : 'Reply sent'
                  : 'Post saved as draft';
          final snackBar = getSnackBar(
            context: context,
            message: message,
            status: SnackBarStatus.success,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              CustomAppBar(
                user: widget.user,
                notifications: widget.notifications,
                middle: [
                  Text(
                    'People of Kenya',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
                bottom: TabBar(
                  dividerColor: Theme.of(context).colorScheme.outlineVariant,
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  tabs: [Tab(text: 'For You'), Tab(text: 'Following')],
                ),
              ),
            ];
          },
          body: Stack(
            children: [
              TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [ForYouTab(), FollowingTab()],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: ExpandableFab(distance: 112),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForYouTab extends StatefulWidget {
  const ForYouTab({super.key});

  @override
  State<ForYouTab> createState() => _ForYouTabState();
}

class _ForYouTabState extends State<ForYouTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
    context.read<ForYouBloc>().add(ForYouEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<ForYouBloc, ForYouState>(
          listener: (context, state) {
            if (state.status == ForYouStatus.success) {
              setState(() {
                _posts = state.posts.toList();
                loading = false;
                failure = false;
                hasNextPage = state.hasNext;
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              });
            }
            if (state.status == ForYouStatus.failure) {
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
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<PostsBloc>().add(
                PostsEvent.resubscribe(posts: _posts),
              );
            }
          },
        ),
      ],
      child: PostListView(
        posts: _posts,
        loading: loading,
        failure: failure,
        onPostsUpdated: (posts) {
          setState(() {
            _posts = posts;
          });
        },
        refreshController: _refreshController,
        //   TODO: enable pull down
        enablePullDown: false,
        enablePullUp: hasNextPage,
        checkVisibility: true,
        onRefresh: () {
          //   TODO:
        },
        onLoading: () {
          //   TODO:
        },
        onFailure: () {
          context.read<ForYouBloc>().add(ForYouEvent.get());
        },
      ),
    );
  }
}

class FollowingTab extends StatefulWidget {
  const FollowingTab({super.key});

  @override
  State<FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab> {
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<FollowingPostsBloc>().add(FollowingPostsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FollowingPostsBloc, FollowingPostsState>(
          listener: (context, state) {
            if (state.status == FollowingPostsStatus.success) {
              setState(() {
                loading = false;
                failure = false;
                _posts = state.posts;
                hasNextPage = state.hasNext;
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              });
            }
            if (state.status == FollowingPostsStatus.failure) {
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
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<PostsBloc>().add(
                PostsEvent.resubscribe(posts: _posts),
              );
            }
          },
        ),
      ],
      child: PostListView(
        posts: _posts,
        loading: loading,
        failure: failure,
        onPostsUpdated: (posts) {
          setState(() {
            _posts = posts;
          });
        },
        refreshController: _refreshController,
        enablePullDown: true,
        enablePullUp: hasNextPage,
        checkVisibility: true,
        onRefresh: () {
          context.read<FollowingPostsBloc>().add(FollowingPostsEvent.get());
        },
        onLoading: () {
          context.read<FollowingPostsBloc>().add(
            FollowingPostsEvent.get(lastPost: _posts.last),
          );
        },
        onFailure: () {
          context.read<FollowingPostsBloc>().add(FollowingPostsEvent.get());
        },
      ),
    );
  }
}
