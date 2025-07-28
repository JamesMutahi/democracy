import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/post/bloc/likes/likes_cubit.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_cubit.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UserPosts extends StatefulWidget {
  const UserPosts({super.key, required this.user});

  final User user;

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.loadUserPosts(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state is WebsocketConnected) {
              context.read<WebsocketBloc>().add(
                WebsocketEvent.loadUserPosts(user: widget.user),
              );
            }
          },
        ),
        BlocListener<UserPostsCubit, UserPostsState>(
          listener: (context, state) {
            if (state.status == UserPostsStatus.success) {
              if (widget.user.id == state.userId) {
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
                  _refreshController.loadComplete();
                });
              }
            }
            if (state.status == UserPostsStatus.loading) {
              setState(() {
                if (_refreshController.headerStatus !=
                        RefreshStatus.refreshing &&
                    _refreshController.footerStatus != LoadStatus.loading) {
                  setState(() {
                    loading = true;
                    failure = false;
                  });
                }
              });
            }
            if (state.status == UserPostsStatus.failure) {
              if (_refreshController.headerStatus != RefreshStatus.refreshing &&
                  _refreshController.footerStatus != LoadStatus.loading) {
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
      ],
      child: PostListener(
        posts: _posts,
        onPostsUpdated: (posts) {
          setState(() {
            _posts = posts;
          });
        },
        child: PostListView(
          posts: _posts,
          loading: loading,
          failure: failure,
          refreshController: _refreshController,
          enablePullUp: hasNextPage ? true : false,
          onRefresh: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.loadUserPosts(user: widget.user),
            );
          },
          onLoading: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.loadUserPosts(
                user: widget.user,
                lastPost: _posts.last,
              ),
            );
          },
          onFailure: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.loadUserPosts(user: widget.user),
            );
          },
        ),
      ),
    );
  }
}

class UserReplies extends StatefulWidget {
  const UserReplies({super.key, required this.user});

  final User user;

  @override
  State<UserReplies> createState() => _UserRepliesState();
}

class _UserRepliesState extends State<UserReplies> {
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.loadUserReplies(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state is WebsocketConnected) {
              context.read<WebsocketBloc>().add(
                WebsocketEvent.loadUserReplies(user: widget.user),
              );
            }
          },
        ),
        BlocListener<UserRepliesCubit, UserRepliesState>(
          listener: (context, state) {
            if (state.status == UserRepliesStatus.success) {
              if (widget.user.id == state.userId) {
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
                  _refreshController.loadComplete();
                });
              }
            }
            if (state.status == UserRepliesStatus.loading) {
              setState(() {
                if (_refreshController.headerStatus !=
                    RefreshStatus.refreshing &&
                    _refreshController.footerStatus != LoadStatus.loading) {
                  setState(() {
                    loading = true;
                    failure = false;
                  });
                }
              });
            }
            if (state.status == UserRepliesStatus.failure) {
              if (_refreshController.headerStatus != RefreshStatus.refreshing &&
                  _refreshController.footerStatus != LoadStatus.loading) {
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
      ],
      child: PostListener(
        posts: _posts,
        onPostsUpdated: (posts) {
          setState(() {
            _posts = posts;
          });
        },
        child: PostListView(
          posts: _posts,
          loading: loading,
          failure: failure,
          refreshController: _refreshController,
          enablePullUp: hasNextPage ? true : false,
          onRefresh: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.loadUserReplies(user: widget.user),
            );
          },
          onLoading: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.loadUserReplies(
                user: widget.user,
                lastPost: _posts.last,
              ),
            );
          },
          onFailure: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.loadUserReplies(user: widget.user),
            );
          },
        ),
      ),
    );
  }
}

class Likes extends StatefulWidget {
  const Likes({super.key, required this.user});

  final User user;

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.loadLikedPosts(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state is WebsocketConnected) {
              context.read<WebsocketBloc>().add(
                WebsocketEvent.loadLikedPosts(user: widget.user),
              );
            }
          },
        ),
        BlocListener<LikesCubit, LikesState>(
          listener: (context, state) {
            if (state.status == LikesStatus.success) {
              if (widget.user.id == state.userId) {
                setState(() {
                  _posts = state.posts.toList();
                  loading = false;
                  failure = false;
                });
              }
            }
            if (state.status == LikesStatus.failure) {
              if (widget.user.id == state.userId) {
                setState(() {
                  failure = true;
                  loading = false;
                });
              }
            }
          },
        ),
        BlocListener<LikesCubit, LikesState>(
          listener: (context, state) {
            if (state.status == LikesStatus.success) {
              if (widget.user.id == state.userId) {
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
                  _refreshController.loadComplete();
                });
              }
            }
            if (state.status == LikesStatus.loading) {
              setState(() {
                if (_refreshController.headerStatus !=
                    RefreshStatus.refreshing &&
                    _refreshController.footerStatus != LoadStatus.loading) {
                  setState(() {
                    loading = true;
                    failure = false;
                  });
                }
              });
            }
            if (state.status == LikesStatus.failure) {
              if (_refreshController.headerStatus != RefreshStatus.refreshing &&
                  _refreshController.footerStatus != LoadStatus.loading) {
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
      ],
      child: PostListener(
        posts: _posts,
        onPostsUpdated: (posts) {
          setState(() {
            _posts = posts;
          });
        },
        child: PostListView(
          posts: _posts,
          loading: loading,
          failure: failure,
          refreshController: _refreshController,
          enablePullUp: hasNextPage ? true : false,
          onRefresh: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.loadLikedPosts(user: widget.user),
            );
          },
          onLoading: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.loadLikedPosts(
                user: widget.user,
                lastPost: _posts.last,
              ),
            );
          },
          onFailure: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.loadLikedPosts(user: widget.user),
            );
          },
        ),
      ),
    );
  }
}

class PostListView extends StatelessWidget {
  const PostListView({
    super.key,
    required this.posts,
    required this.loading,
    required this.failure,
    required this.refreshController,
    required this.enablePullUp,
    required this.onRefresh,
    required this.onLoading,
    required this.onFailure,
  });

  final List<Post> posts;
  final bool loading;
  final bool failure;
  final RefreshController refreshController;
  final bool enablePullUp;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final VoidCallback onFailure;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(margin: EdgeInsets.only(top: 20), child: BottomLoader())
        : failure
        ? FailureRetryButton(onPressed: onFailure)
        : SmartRefresher(
          enablePullDown: true,
          enablePullUp: enablePullUp,
          header: ClassicHeader(),
          controller: refreshController,
          onRefresh: onRefresh,
          onLoading: onLoading,
          footer: ClassicFooter(),
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 50),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              Post post = posts[index];
              return PostTile(key: ValueKey(post.id), post: post);
            },
            itemCount: posts.length,
          ),
        );
  }
}

class Media extends StatelessWidget {
  const Media({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    // TODO:
    return const Placeholder();
  }
}
