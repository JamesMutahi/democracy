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
  final _scrollController = ScrollController();

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getFollowingPosts());
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowingCubit, FollowingState>(
      builder: (context, state) {
        switch (state.status) {
          case FollowingStatus.failure:
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.getFollowingPosts(),
                );
              },
            );
          case FollowingStatus.success:
            if (state.posts.isEmpty) {
              // TODO: Show text to follow some people
              return const Center(child: Text('No posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Post post = state.posts[index];
                return index >= state.posts.length
                    ? const BottomLoader()
                    : PostTile(key: ValueKey(post.id), post: post);
              },
              itemCount:
                  state.hasReachedMax
                      ? state.posts.length
                      : state.posts.length + 1,
              controller: _scrollController,
            );
          default:
            return LoadingIndicator();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<WebsocketBloc>().add(WebsocketEvent.getFollowingPosts());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
