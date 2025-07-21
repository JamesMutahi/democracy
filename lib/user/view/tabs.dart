import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/post/bloc/likes/likes_cubit.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_cubit.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPosts extends StatefulWidget {
  const UserPosts({super.key, required this.user});

  final User user;

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  List<Post> posts = [];
  bool failure = false;
  bool loading = true;

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
            if (state is UserPostsLoaded) {
              if (widget.user.id == state.userId) {
                setState(() {
                  posts = state.posts.toList();
                  loading = false;
                  failure = false;
                });
              }
            }
            if (state is UserPostsFailure) {
              if (widget.user.id == state.userId) {
                setState(() {
                  failure = true;
                  loading = false;
                });
              }
            }
          },
        ),
        BlocListener<PostDetailCubit, PostDetailState>(
          listener: (context, state) {
            switch (state) {
              case PostUpdated(post: final post):
                if (posts.any((element) => element.id == post.id)) {
                  setState(() {
                    posts[posts.indexWhere(
                          (element) => element.id == post.id,
                        )] =
                        post;
                  });
                }
              case PostDeleted(:final postId):
                if (posts.any((element) => element.id == postId)) {
                  setState(() {
                    posts.removeWhere((element) => element.id == postId);
                  });
                }
            }
          },
        ),
      ],
      child: PostListView(
        posts: posts,
        loading: loading,
        failure: failure,
        onFailure: () {
          context.read<WebsocketBloc>().add(
            WebsocketEvent.loadUserReplies(user: widget.user),
          );
        },
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
  List<Post> posts = [];
  bool failure = false;
  bool loading = true;

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
            if (state is UserRepliesLoaded) {
              if (widget.user.id == state.userId) {
                setState(() {
                  posts = state.posts.toList();
                  loading = false;
                  failure = false;
                });
              }
            }
            if (state is UserRepliesFailure) {
              if (widget.user.id == state.userId) {
                setState(() {
                  failure = true;
                  loading = false;
                });
              }
            }
          },
        ),
        BlocListener<PostDetailCubit, PostDetailState>(
          listener: (context, state) {
            switch (state) {
              case PostUpdated(post: final post):
                if (posts.any((element) => element.id == post.id)) {
                  setState(() {
                    posts[posts.indexWhere(
                          (element) => element.id == post.id,
                        )] =
                        post;
                  });
                }
              case PostDeleted(:final postId):
                if (posts.any((element) => element.id == postId)) {
                  setState(() {
                    posts.removeWhere((element) => element.id == postId);
                  });
                }
            }
          },
        ),
      ],
      child: PostListView(
        posts: posts,
        loading: loading,
        failure: failure,
        onFailure: () {
          context.read<WebsocketBloc>().add(
            WebsocketEvent.loadUserReplies(user: widget.user),
          );
        },
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
  List<Post> posts = [];
  bool failure = false;
  bool loading = true;

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
            if (state is LikesLoaded) {
              if (widget.user.id == state.userId) {
                setState(() {
                  posts = state.posts.toList();
                  loading = false;
                  failure = false;
                });
              }
            }
            if (state is LikesFailure) {
              if (widget.user.id == state.userId) {
                setState(() {
                  failure = true;
                  loading = false;
                });
              }
            }
          },
        ),
        BlocListener<PostDetailCubit, PostDetailState>(
          listener: (context, state) {
            switch (state) {
              case PostUpdated(post: final post):
                if (posts.any((element) => element.id == post.id)) {
                  setState(() {
                    posts[posts.indexWhere(
                          (element) => element.id == post.id,
                        )] =
                        post;
                  });
                }
              case PostDeleted(:final postId):
                if (posts.any((element) => element.id == postId)) {
                  setState(() {
                    posts.removeWhere((element) => element.id == postId);
                  });
                }
            }
          },
        ),
      ],
      child: PostListView(
        posts: posts,
        loading: loading,
        failure: failure,
        onFailure: () {
          context.read<WebsocketBloc>().add(
            WebsocketEvent.loadUserReplies(user: widget.user),
          );
        },
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
    required this.onFailure,
  });

  final List<Post> posts;
  final bool loading;
  final bool failure;
  final VoidCallback onFailure;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(margin: EdgeInsets.only(top: 20), child: BottomLoader())
        : failure
        ? FailureRetryButton(onPressed: onFailure)
        : ListView.builder(
          padding: EdgeInsets.only(bottom: 50),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            Post post = posts[index];
            return PostTile(key: ValueKey(post.id), post: post);
          },
          itemCount: posts.length,
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
