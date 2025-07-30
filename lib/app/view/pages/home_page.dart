import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/post/bloc/following/following_cubit.dart';
import 'package:democracy/post/bloc/for_you/for_you_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user, required this.notifications});

  final User user;
  final List<n_.Notification> notifications;

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
    return BlocListener<PostDetailCubit, PostDetailState>(
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
              SliverAppBar(
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                flexibleSpace: CustomAppBar(
                  user: widget.user,
                  notifications: widget.notifications,
                  extras: [],
                ),
                bottom: TabBar(
                  dividerColor: Theme.of(context).colorScheme.outlineVariant,
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  tabs: [Tab(text: 'For You'), Tab(text: 'Following')],
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [ForYouTab(), FollowingTab()],
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

class _ForYouTabState extends State<ForYouTab> {
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForYouCubit, ForYouState>(
      listener: (context, state) {
        if (state.status == ForYouStatus.success) {
          setState(() {
            _posts = state.posts.toList();
            loading = false;
            failure = false;
            hasNextPage = state.hasNext;
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
            _refreshController.loadComplete();
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

      child: Stack(
        children: [
          PostListView(
            posts: _posts,
            loading: loading,
            failure: failure,
            onPostsUpdated: (posts) {
              setState(() {
                _posts = posts;
              });
            },
            refreshController: _refreshController,
            enablePullDown: false,
            enablePullUp: hasNextPage ? true : false,
            onRefresh: () {},
            onLoading: () {},
            onFailure: () {},
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 10, bottom: 10),
              child: FloatingActionButton(
                heroTag: 'posts',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostCreate()),
                  );
                },
                child: Icon(Symbols.post_add_rounded),
              ),
            ),
          ),
        ],
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
    context.read<WebsocketBloc>().add(WebsocketEvent.getFollowingPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FollowingCubit, FollowingState>(
      listener: (context, state) {
        if (state.status == FollowingStatus.success) {
          setState(() {
            loading = false;
            failure = false;
            _posts = state.posts;
            hasNextPage = state.hasNext;
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
            _refreshController.loadComplete();
          });
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
        enablePullUp: hasNextPage ? true : false,
        onRefresh: () {
          context.read<WebsocketBloc>().add(WebsocketEvent.getFollowingPosts());
        },
        onLoading: () {
          context.read<WebsocketBloc>().add(
            WebsocketEvent.getFollowingPosts(lastPost: _posts.last),
          );
        },
        onFailure: () {
          context.read<WebsocketBloc>().add(WebsocketEvent.getFollowingPosts());
        },
      ),
    );
  }
}
