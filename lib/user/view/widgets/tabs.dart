import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/bloc/user_petitions/user_petitions_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:democracy/post/bloc/likes/likes_bloc.dart';
import 'package:democracy/post/bloc/user_community_notes/user_community_notes_bloc.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_bloc.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/shared/add_post_view.dart';
import 'package:democracy/post/view/widgets/community_note_tile.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
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
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<UserPostsBloc>().add(UserPostsEvent.get(user: widget.user));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostsBloc, UserPostsState>(
      buildWhen: (previous, current) {
        return widget.user.id == current.userId;
      },
      builder: (context, state) {
        final posts = state.posts.toList();

        if (state.status == UserPostsStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == UserPostsStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }

        return PostListView(
          posts: posts,
          loading:
              state.status == UserPostsStatus.initial ||
              (state.status == UserPostsStatus.loading && posts.isEmpty),
          failure: state.posts.isNotEmpty
              ? false
              : state.status == UserPostsStatus.failure,
          onPostsUpdated: (posts) {
            context.read<UserPostsBloc>().add(
              UserPostsEvent.update(posts: posts),
            );
          },
          refreshController: _refreshController,
          enablePullDown: posts.isNotEmpty,
          enablePullUp: state.hasNext,
          checkVisibility: true,
          onRefresh: () {
            context.read<UserPostsBloc>().add(
              UserPostsEvent.get(user: widget.user),
            );
          },
          onLoading: () {
            context.read<UserPostsBloc>().add(
              UserPostsEvent.get(previousPosts: posts, user: widget.user),
            );
          },
          onFailure: () {
            context.read<UserPostsBloc>().add(
              UserPostsEvent.get(user: widget.user),
            );
          },
          origin: 'User Posts',
        );
      },
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
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<UserRepliesBloc>().add(
      UserRepliesEvent.get(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRepliesBloc, UserRepliesState>(
      buildWhen: (previous, current) {
        return widget.user.id == current.userId;
      },
      builder: (context, state) {
        final posts = state.posts.toList();

        if (state.status == UserRepliesStatus.initial ||
            (state.status == UserRepliesStatus.loading && posts.isEmpty)) {
          return const BottomLoader();
        }

        if (state.status == UserRepliesStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == UserRepliesStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }

          if (posts.isEmpty) {
            return FailureRetryButton(
              onPressed: () => context.read<UserRepliesBloc>().add(
                UserRepliesEvent.get(user: widget.user),
              ),
            );
          }
        }
        return PostListener(
          posts: posts,
          onPostsUpdated: (posts) {
            context.read<UserRepliesBloc>().add(
              UserRepliesEvent.update(posts: posts),
            );
          },
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.hasNext,
            header: ClassicHeader(),
            footer: ClassicFooter(),
            controller: _refreshController,
            onRefresh: () {
              context.read<UserRepliesBloc>().add(
                UserRepliesEvent.get(user: widget.user),
              );
            },
            onLoading: () {
              context.read<UserRepliesBloc>().add(
                UserRepliesEvent.get(user: widget.user, previousPosts: posts),
              );
            },
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20),
              itemBuilder: (BuildContext context, int index) {
                Post post = posts[index];
                return Column(
                  children: [
                    PostWidgetSelector(
                      key: ValueKey(post.replyTo!.id),
                      post: post.replyTo!,
                      checkVisibility: true,
                      showBottomThread: true,
                      hideBorder: true,
                      onViewed: () {
                        addPostView(context, 'User Replies', post);
                      },
                    ),
                    PostTile(
                      key: ValueKey(post.id),
                      post: post,
                      checkVisibility: true,
                      showTopThread: true,
                      onViewed: () {
                        addPostView(context, 'User Replies', post);
                      },
                    ),
                  ],
                );
              },
              itemCount: posts.length,
            ),
          ),
        );
      },
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
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<LikesBloc>().add(LikesEvent.get(user: widget.user));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikesBloc, LikesState>(
      buildWhen: (previous, current) {
        return widget.user.id == current.userId;
      },
      builder: (context, state) {
        final posts = state.posts.toList();

        if (state.status == LikesStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == LikesStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }

        return PostListView(
          posts: posts,
          loading:
              state.status == LikesStatus.initial ||
              (state.status == LikesStatus.initial && posts.isEmpty),
          failure: state.posts.isNotEmpty
              ? false
              : state.status == LikesStatus.failure,
          onPostsUpdated: (posts) {
            context.read<LikesBloc>().add(LikesEvent.update(posts: posts));
          },
          refreshController: _refreshController,
          enablePullDown: posts.isNotEmpty,
          enablePullUp: state.hasNext,
          checkVisibility: true,
          onRefresh: () {
            context.read<LikesBloc>().add(LikesEvent.get(user: widget.user));
          },
          onLoading: () {
            context.read<LikesBloc>().add(
              LikesEvent.get(previousPosts: posts, user: widget.user),
            );
          },
          onFailure: () {
            context.read<LikesBloc>().add(LikesEvent.get(user: widget.user));
          },
          origin: 'Likes',
        );
      },
    );
  }
}

class UserCommunityNotes extends StatefulWidget {
  const UserCommunityNotes({super.key, required this.user});

  final User user;

  @override
  State<UserCommunityNotes> createState() => _UserCommunityNotesState();
}

class _UserCommunityNotesState extends State<UserCommunityNotes> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<UserCommunityNotesBloc>().add(
      UserCommunityNotesEvent.get(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCommunityNotesBloc, UserCommunityNotesState>(
      buildWhen: (previous, current) {
        return widget.user.id == current.userId;
      },
      builder: (context, state) {
        final posts = state.posts.toList();

        if (state.status == UserCommunityNotesStatus.initial ||
            (state.status == UserCommunityNotesStatus.loading &&
                posts.isEmpty)) {
          return const BottomLoader();
        }

        if (state.status == UserCommunityNotesStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == UserCommunityNotesStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }

          if (posts.isEmpty) {
            return FailureRetryButton(
              onPressed: () => context.read<UserCommunityNotesBloc>().add(
                UserCommunityNotesEvent.get(user: widget.user),
              ),
            );
          }
        }
        return PostListener(
          posts: posts,
          onPostsUpdated: (posts) {
            context.read<UserCommunityNotesBloc>().add(
              UserCommunityNotesEvent.update(posts: posts),
            );
          },
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.hasNext,
            header: ClassicHeader(),
            footer: ClassicFooter(),
            controller: _refreshController,
            onRefresh: () {
              context.read<UserCommunityNotesBloc>().add(
                UserCommunityNotesEvent.get(user: widget.user),
              );
            },
            onLoading: () {
              context.read<UserCommunityNotesBloc>().add(
                UserCommunityNotesEvent.get(
                  user: widget.user,
                  previousPosts: posts,
                ),
              );
            },
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20),
              itemBuilder: (BuildContext context, int index) {
                Post post = posts[index];
                return CommunityNoteTile(
                  key: ValueKey(post.id),
                  communityNote: post,
                  onViewed: () {
                    addPostView(context, 'User Comm. notes', post);
                  },
                );
              },
              itemCount: posts.length,
            ),
          ),
        );
      },
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
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<UserPetitionsBloc>().add(
      UserPetitionsEvent.get(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetitionDetailBloc, PetitionDetailState>(
      listener: (context, state) {
        final bloc = context.read<UserPetitionsBloc>();

        if (state is PetitionCreated) {
          bloc.add(UserPetitionsEvent.add(petition: state.petition));
        } else if (state is PetitionLoaded) {
          bloc.add(UserPetitionsEvent.update(petition: state.petition));
        } else if (state is PetitionUpdated) {
          bloc.add(UserPetitionsEvent.update(petition: state.petition));
        } else if (state is PetitionDeleted) {
          bloc.add(UserPetitionsEvent.remove(petitionId: state.petitionId));
        }
      },
      child: BlocBuilder<UserPetitionsBloc, UserPetitionsState>(
        buildWhen: (previous, current) {
          return widget.user.id == current.userId;
        },
        builder: (context, state) {
          final petitions = state.petitions.toList();

          if (state.status == UserPetitionsStatus.initial ||
              (state.status == UserPetitionsStatus.initial &&
                  petitions.isEmpty)) {
            return const BottomLoader();
          }

          if (state.status == UserPetitionsStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == UserPetitionsStatus.failure) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshFailed();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadFailed();
            }

            if (state.petitions.isEmpty) {
              return FailureRetryButton(
                onPressed: () => context.read<UserPetitionsBloc>().add(
                  UserPetitionsEvent.get(user: widget.user),
                ),
              );
            }
          }

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.hasNext,
            header: ClassicHeader(),
            controller: _refreshController,
            onRefresh: () {
              context.read<UserPetitionsBloc>().add(
                UserPetitionsEvent.get(user: widget.user),
              );
            },
            onLoading: () {
              context.read<UserPetitionsBloc>().add(
                UserPetitionsEvent.get(
                  user: widget.user,
                  previousPetitions: petitions,
                ),
              );
            },
            footer: ClassicFooter(),
            child: ListView.builder(
              padding: EdgeInsets.all(15),
              itemBuilder: (BuildContext context, int index) {
                Petition petition = petitions[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: PetitionTile(
                    key: ValueKey(petition.id),
                    petition: petition,
                    isDependency: false,
                  ),
                );
              },
              itemCount: petitions.length,
            ),
          );
        },
      ),
    );
  }
}
