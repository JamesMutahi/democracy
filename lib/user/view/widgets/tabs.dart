import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_cubit.dart';
import 'package:democracy/petition/bloc/user_petitions/user_petitions_cubit.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/bloc/likes/likes_cubit.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_cubit.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/post/view/widgets/posts_pop_scope.dart';
import 'package:democracy/user/models/user.dart';
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
      WebsocketEvent.getUserPosts(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
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
                });
              }
            }
            if (state.status == UserPostsStatus.failure) {
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
              context.read<WebsocketBloc>().add(
                WebsocketEvent.resubscribeUserPosts(
                  user: widget.user,
                  posts: _posts,
                ),
              );
            }
          },
        ),
      ],
      child: PostsPopScope(
        user: widget.user,
        posts: _posts,
        child: PostListView(
          posts: _posts,
          loading: loading,
          failure: failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: hasNextPage,
          onPostsUpdated: (posts) {
            setState(() {
              _posts = posts;
            });
          },
          onRefresh: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getUserPosts(user: widget.user),
            );
          },
          onLoading: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getUserPosts(
                user: widget.user,
                lastPost: _posts.last,
              ),
            );
          },
          onFailure: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getUserPosts(user: widget.user),
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
      WebsocketEvent.getUserReplies(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
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
                });
              }
            }
            if (state.status == UserRepliesStatus.failure) {
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
              context.read<WebsocketBloc>().add(
                WebsocketEvent.resubscribeUserPosts(
                  user: widget.user,
                  posts: _posts,
                ),
              );
            }
          },
        ),
      ],
      child: PostsPopScope(
        user: widget.user,
        posts: _posts,
        child: PostListView(
          posts: _posts,
          loading: loading,
          failure: failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: hasNextPage,
          onPostsUpdated: (posts) {
            setState(() {
              _posts = posts;
            });
          },
          onRefresh: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getUserReplies(user: widget.user),
            );
          },
          onLoading: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getUserReplies(
                user: widget.user,
                lastPost: _posts.last,
              ),
            );
          },
          onFailure: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getUserReplies(user: widget.user),
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
      WebsocketEvent.getLikedPosts(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
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
                });
              }
            }
            if (state.status == LikesStatus.failure) {
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
              context.read<WebsocketBloc>().add(
                WebsocketEvent.resubscribeUserPosts(
                  user: widget.user,
                  posts: _posts,
                ),
              );
            }
          },
        ),
      ],
      child: PostsPopScope(
        user: widget.user,
        posts: _posts,
        child: PostListView(
          posts: _posts,
          loading: loading,
          failure: failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: hasNextPage,
          onPostsUpdated: (posts) {
            setState(() {
              _posts = posts;
            });
          },
          onRefresh: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getLikedPosts(user: widget.user),
            );
          },
          onLoading: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getLikedPosts(
                user: widget.user,
                lastPost: _posts.last,
              ),
            );
          },
          onFailure: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getLikedPosts(user: widget.user),
            );
          },
        ),
      ),
    );
  }
}

class UserPetitions extends StatefulWidget {
  const UserPetitions({super.key, required this.user});

  final User user;

  @override
  State<UserPetitions> createState() => _UserPetitionsState();
}

class _UserPetitionsState extends State<UserPetitions> {
  bool loading = true;
  bool failure = false;
  List<Petition> _petitions = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.getUserPetitions(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<WebsocketBloc>().add(
                WebsocketEvent.resubscribeUserPetitions(
                  user: widget.user,
                  petitions: _petitions,
                ),
              );
            }
          },
        ),
        BlocListener<UserPetitionsCubit, UserPetitionsState>(
          listener: (context, state) {
            if (state.status == UserPetitionsStatus.success) {
              setState(() {
                loading = false;
                failure = false;
                _petitions = state.petitions;
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
            if (state.status == UserPetitionsStatus.failure) {
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
        BlocListener<PetitionDetailCubit, PetitionDetailState>(
          listener: (context, state) {
            if (state is PetitionUpdated) {
              if (_petitions.any(
                (petition) => petition.id == state.petition.id,
              )) {
                setState(() {
                  int index = _petitions.indexWhere(
                    (petition) => petition.id == state.petition.id,
                  );
                  _petitions[index] = state.petition;
                });
              }
            }
            if (state is PetitionDeleted) {
              if (_petitions.any(
                (petition) => petition.id == state.petitionId,
              )) {
                setState(() {
                  _petitions.removeWhere(
                    (petition) => petition.id == state.petitionId,
                  );
                });
              }
            }
          },
        ),
      ],
      child:
          loading
              ? BottomLoader()
              : failure
              ? FailureRetryButton(
                onPressed: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getPetitions(),
                  );
                },
              )
              : PopScope(
                canPop: true,
                onPopInvokedWithResult: (_, __) {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.unsubscribeUserPetitions(
                      user: widget.user,
                      petitions: _petitions,
                    ),
                  );
                },
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: hasNextPage,
                  header: ClassicHeader(),
                  controller: _refreshController,
                  onRefresh: () {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.getPetitions(),
                    );
                  },
                  onLoading: () {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.getPetitions(
                        lastPetition: _petitions.last,
                      ),
                    );
                  },
                  footer: ClassicFooter(),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      Petition petition = _petitions[index];
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: PetitionTile(
                              key: ValueKey(petition.id),
                              petition: petition,
                              isDependency: false,
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: _petitions.length,
                  ),
                ),
              ),
    );
  }
}
