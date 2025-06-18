import 'package:democracy/app/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/social/bloc/post_list/post_list_cubit.dart';
import 'package:democracy/app/social/models/post.dart';
import 'package:democracy/app/social/view/post_create.dart';
import 'package:democracy/app/social/view/post_list.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PostListCubit, PostListState>(
      builder: (context, state) {
        switch (state) {
          case PostListLoaded():
            List<Post> posts = state.posts.toList();
            return Stack(
              children: [
                (posts.isNotEmpty) ? PostList(posts: posts) : const NoResults(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 10, bottom: 10),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PostCreate()),
                        );
                      },
                      mini: true,
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            );
          case PostListFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<PostListCubit>().retryButtonPressed();
                context.read<WebsocketBloc>().add(WebsocketEvent.getPosts());
              },
            );
          default:
            return const LoadingIndicator();
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
    // if (_isBottom) context.read<PostBloc>().add(PostEvent.bottomReached());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
