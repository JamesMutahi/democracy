import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/post/bloc/following/following_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/bloc/post_list/post_list_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/post/view/post_list.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
        child: Column(
          children: [
            const TabBar(tabs: [Tab(text: 'For You'), Tab(text: 'Following')]),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [ForYouTab(), FollowingTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForYouTab extends StatelessWidget {
  const ForYouTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListCubit, PostListState>(
      builder: (context, state) {
        switch (state.status) {
          case PostListStatus.success:
            return Stack(
              children: [
                (state.posts.isNotEmpty)
                    ? PostList(posts: state.posts)
                    : NoResults(text: 'No posts'),
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
                      mini: true,
                      child: Icon(Symbols.post_add_rounded),
                    ),
                  ),
                ),
              ],
            );
          case PostListStatus.failure:
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(WebsocketEvent.connect());
              },
            );
          default:
            return const LoadingIndicator();
        }
      },
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
      child:
          loading
              ? LoadingIndicator()
              : failure
              ? FailureRetryButton(
                onPressed: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getFollowingPosts(),
                  );
                },
              )
              : SmartRefresher(
                enablePullDown: true,
                enablePullUp: hasNextPage ? true : false,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getFollowingPosts(),
                  );
                },
                onLoading: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getFollowingPosts(lastPost: _posts.last),
                  );
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Post post = _posts[index];
                    return index >= _posts.length
                        ? const BottomLoader()
                        : PostTile(key: ValueKey(post.id), post: post);
                  },
                  itemCount: _posts.length,
                ),
              ),
    );
  }
}
