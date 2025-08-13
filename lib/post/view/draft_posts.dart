import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_update.dart';
import 'package:democracy/post/view/widgets/posts_pop_scope.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DraftPosts extends StatefulWidget {
  const DraftPosts({super.key});

  @override
  State<DraftPosts> createState() => _DraftsPostsState();
}

class _DraftsPostsState extends State<DraftPosts> {
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getDraftPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User user;
        if (state is Authenticated) {
          user = state.user;
        }
        return PostsPopScope(
          user: user,
          posts: _posts,
          child: Scaffold(
            appBar: AppBar(title: Text('Drafts')),
            body: MultiBlocListener(
              listeners: [
                BlocListener<DraftPostsCubit, DraftPostsState>(
                  listener: (context, state) {
                    if (state.status == DraftPostsStatus.success) {
                      setState(() {
                        _posts = state.posts.toList();
                        loading = false;
                        failure = false;
                        hasNextPage = state.hasNext;
                        if (_refreshController.headerStatus ==
                            RefreshStatus.refreshing) {
                          _refreshController.refreshCompleted();
                        }
                        if (_refreshController.footerStatus ==
                            LoadStatus.loading) {
                          _refreshController.loadComplete();
                        }
                      });
                    }
                    if (state.status == DraftPostsStatus.failure) {
                      if (loading) {
                        setState(() {
                          loading = false;
                          failure = true;
                        });
                      }
                      if (_refreshController.headerStatus ==
                          RefreshStatus.refreshing) {
                        _refreshController.refreshFailed();
                      }
                      if (_refreshController.footerStatus ==
                          LoadStatus.loading) {
                        _refreshController.loadFailed();
                      }
                    }
                  },
                ),
                BlocListener<WebsocketBloc, WebsocketState>(
                  listener: (context, state) {
                    if (state.status == WebsocketStatus.connected) {
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.resubscribeUserPosts(
                          user: user,
                          posts: _posts,
                        ),
                      );
                    }
                  },
                ),
              ],
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: hasNextPage,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getDraftPosts(),
                  );
                },
                onLoading: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getDraftPosts(lastPost: _posts.last),
                  );
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  itemBuilder: (BuildContext context, int index) {
                    Post post = _posts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PostUpdate()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Text(post.body),
                      ),
                    );
                  },
                  itemCount: _posts.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
