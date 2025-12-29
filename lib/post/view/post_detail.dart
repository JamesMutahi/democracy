import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/replies/replies_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/bottom_reply_text_field.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/post/view/widgets/image_viewer.dart';
import 'package:democracy/post/view/widgets/post_body.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({
    super.key,
    required this.post,
    required this.showAsRepost,
    required this.repost,
  });

  final Post post;
  final bool showAsRepost;
  final Post repost;

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  late Post _post = widget.post;
  bool isDeleted = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  bool loading = true;
  bool failure = false;
  List<Post> _replies = [];
  List<Post> _replyTos = [];
  bool hasNextPage = false;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    context.read<RepliesBloc>().add(RepliesEvent.get(post: widget.post));
    if (widget.post.replyTo != null) {
      context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.post));
    }
  }

  void _onScrollUp() {
    context.read<RepliesBloc>().add(
      RepliesEvent.get(post: widget.post, lastPost: _replies.last),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) {
        if (_replies.isNotEmpty) {
          context.read<RepliesBloc>().add(
            RepliesEvent.unsubscribe(post: widget.post, replies: _replies),
          );
          context.read<ReplyToBloc>().add(
            ReplyToEvent.unsubscribe(post: widget.post, posts: _replyTos),
          );
        }
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<WebsocketBloc, WebsocketState>(
            listener: (context, state) {
              if (state.status == WebsocketStatus.connected) {
                if (_replies.isNotEmpty) {
                  context.read<RepliesBloc>().add(
                    RepliesEvent.resubscribe(
                      post: widget.post,
                      replies: _replies,
                    ),
                  );
                }
                if (_replyTos.isNotEmpty) {
                  context.read<ReplyToBloc>().add(
                    ReplyToEvent.resubscribe(
                      post: widget.post,
                      posts: _replyTos,
                    ),
                  );
                }
              }
            },
          ),
          BlocListener<PostDetailBloc, PostDetailState>(
            listener: (context, state) {
              switch (state) {
                case PostCreated(post: final post):
                  if (widget.post.id == post.replyTo?.id) {
                    setState(() {
                      int index = _replies.indexWhere(
                        (element) => element.author.id != post.author.id,
                      );
                      _replies.insert(index, post);
                    });
                  }
                case PostLoaded(:final post):
                  if (_post.id == post.id) {
                    setState(() {
                      _post = post;
                    });
                  }
                case PostUpdated():
                  // update post
                  if (_post.id == state.postId) {
                    setState(() {
                      _post = _post.copyWith(
                        body: state.body,
                        likes: state.likes,
                        isLiked: state.isLiked,
                        bookmarks: state.bookmarks,
                        isBookmarked: state.isBookmarked,
                        views: state.views,
                        replies: state.replies,
                        reposts: state.reposts,
                        isReposted: state.isReposted,
                        isQuoted: state.isQuoted,
                        communityNote: state.communityNote,
                        isUpvoted: state.isUpvoted,
                        isDownvoted: state.isDownvoted,
                        upvotes: state.upvotes,
                        downvotes: state.downvotes,
                        isDeleted: state.isDeleted,
                        isActive: state.isActive,
                      );
                    });
                  }
                  // update post's repost_of
                  if (_post.repostOf?.id == state.postId) {
                    Post repostOf = _post.repostOf!.copyWith(
                      body: state.body,
                      likes: state.likes,
                      isLiked: state.isLiked,
                      bookmarks: state.bookmarks,
                      isBookmarked: state.isBookmarked,
                      views: state.views,
                      replies: state.replies,
                      reposts: state.reposts,
                      isReposted: state.isReposted,
                      isQuoted: state.isQuoted,
                      communityNote: state.communityNote,
                      isUpvoted: state.isUpvoted,
                      isDownvoted: state.isDownvoted,
                      upvotes: state.upvotes,
                      downvotes: state.downvotes,
                      isDeleted: state.isDeleted,
                      isActive: state.isActive,
                    );
                    setState(() {
                      _post = _post.copyWith(repostOf: repostOf);
                    });
                  }
                case PostDeleted(:final postId):
                  if (_post.id == postId || widget.repost.id == postId) {
                    setState(() {
                      isDeleted = true;
                    });
                  }
              }
            },
          ),
          BlocListener<UserDetailBloc, UserDetailState>(
            listener: (context, state) {
              if (state is UserUpdated) {
                // post
                if (_post.author.id == state.user.id) {
                  setState(() {
                    _post = _post.copyWith(author: state.user);
                  });
                }
                // repost
                if (_post.repostOf?.author.id == state.user.id) {
                  Post repostOf = _post.repostOf!.copyWith(author: state.user);
                  setState(() {
                    _post = _post.copyWith(repostOf: repostOf);
                  });
                }
              }
            },
          ),
          BlocListener<BallotDetailBloc, BallotDetailState>(
            listener: (context, state) {
              if (state is BallotUpdated) {
                // post
                if (_post.ballot?.id == state.ballot.id) {
                  setState(() {
                    _post = _post.copyWith(ballot: state.ballot);
                  });
                }
                // repost
                if (_post.repostOf?.ballot?.id == state.ballot.id) {
                  setState(() {
                    Post repostOf = _post.repostOf!.copyWith(
                      ballot: state.ballot,
                    );
                    _post = _post.copyWith(repostOf: repostOf);
                  });
                }
              }
            },
          ),
          BlocListener<SurveyDetailBloc, SurveyDetailState>(
            listener: (context, state) {
              if (state is SurveyUpdated) {
                // post
                if (_post.survey?.id == state.survey.id) {
                  setState(() {
                    _post = _post.copyWith(survey: state.survey);
                  });
                }
                // repost
                if (_post.repostOf?.survey?.id == state.survey.id) {
                  setState(() {
                    Post repostOf = _post.repostOf!.copyWith(
                      survey: state.survey,
                    );
                    _post = _post.copyWith(repostOf: repostOf);
                  });
                }
              }
            },
          ),
          BlocListener<RepliesBloc, RepliesState>(
            listener: (context, state) {
              if (state.status == RepliesStatus.success) {
                if (widget.post.id == state.postId) {
                  setState(() {
                    _replies = state.posts.toList();
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
              if (state.status == RepliesStatus.failure) {
                if (widget.post.id == state.postId) {
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
                  if (_refreshController.footerStatus == LoadStatus.loading) {
                    _refreshController.loadFailed();
                  }
                }
              }
            },
          ),
          BlocListener<ReplyToBloc, ReplyToState>(
            listener: (context, state) {
              if (state.status == ReplyToStatus.success) {
                if (widget.post.id == state.postId) {
                  setState(() {
                    _replyTos = state.posts.toList();
                  });
                }
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(title: Text('Post')),
          body: isDeleted
              ? Center(child: Text('This post has been deleted by the author'))
              : SmartRefresher(
                  enablePullDown: hasNextPage,
                  enablePullUp: false,
                  header: ClassicHeader(
                    // CustomScrollView is in reverse
                    idleIcon: Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.grey,
                    ),
                    idleText: 'Pull up to load more',
                    releaseText: 'Release to load more',
                    completeText: 'Loaded',
                  ),
                  footer: ClassicFooter(
                    // CustomScrollView is in reverse
                    idleIcon: Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.grey,
                    ),
                    idleText: 'Show more',
                  ),
                  controller: _refreshController,
                  onRefresh: _onScrollUp,
                  child: CustomScrollView(
                    reverse: true,
                    slivers: <Widget>[
                      SliverFillRemaining(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _post.replyTo == null
                                  ? Column(
                                      children: [
                                        if (widget.showAsRepost)
                                          _repostBanner(),
                                        _PostContainer(post: _post),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Column(
                                          children: [
                                            if (widget.showAsRepost)
                                              Stack(
                                                children: [
                                                  ThreadLine(
                                                    showBottomThread: true,
                                                    showTopThread: true,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 30,
                                                    ),
                                                    child: _repostBanner(),
                                                  ),
                                                ],
                                              ),
                                            Stack(
                                              children: [
                                                ThreadLine(
                                                  showBottomThread: false,
                                                  showTopThread: true,
                                                ),
                                                _PostContainer(post: _post),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                              PostListener(
                                posts: _replies,
                                onPostsUpdated: (posts) {
                                  setState(() {
                                    _replies = posts;
                                  });
                                },
                                child: loading
                                    ? Container(
                                        margin: EdgeInsets.only(top: 50),
                                        child: BottomLoader(),
                                      )
                                    : failure
                                    ? FailureRetryButton(onPressed: _getData)
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                              Post post = _replies[index];
                                              return PostTile(
                                                key: ValueKey(post.id),
                                                post: post,
                                                checkVisibility: true,
                                                showThreadedReplies:
                                                    post.thread.isEmpty
                                                    ? false
                                                    : true,
                                                showBottomThread:
                                                    post.thread.isEmpty
                                                    ? false
                                                    : true,
                                              );
                                            },
                                        itemCount: _replies.length,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: PostListener(
                          posts: _replyTos,
                          onPostsUpdated: (posts) {
                            setState(() {
                              _replyTos = posts;
                            });
                          },
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              Post post = _replyTos[index];
                              return PostWidgetSelector(
                                key: ValueKey(post.id),
                                post: post,
                                showTopThread:
                                    post.replyTo != null ||
                                    post.communityNoteOf != null,
                                showBottomThread: true,
                                hideBorder: true,
                              );
                            },
                            itemCount: _replyTos.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          bottomNavigationBar: _post.author.hasBlocked
              ? Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'You have been blocked',
                    textAlign: TextAlign.center,
                  ),
                )
              : BottomReplyTextField(post: _post),
        ),
      ),
    );
  }

  Widget _repostBanner() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User user;
        if (state is Authenticated) user = state.user;

        return Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Row(
            children: [
              Icon(
                Symbols.loop_rounded,
                color: Theme.of(context).colorScheme.outline,
                size: 17,
              ),
              const SizedBox(width: 5),
              Text(
                user.id == widget.repost.author.id
                    ? 'You reposted'
                    : '${widget.repost.author.name} reposted',
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PostContainer extends StatelessWidget {
  const _PostContainer({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    var timeFormat = DateFormat('hh:mm a');
    var dateFormat = DateFormat('dd/MM/yyyy');
    var numberFormat = NumberFormat.compact(locale: "en_UK");

    void navigateToProfilePage(User user) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProfilePage(user: post.author)),
      );
    }

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).disabledColor.withAlpha(30),
              ),
            ),
          ),
          child: post.isDeleted
              ? PostDeletedWidget()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        navigateToProfilePage(post.author);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            PostAuthorProfile(
                              isDependency: false,
                              author: post.author,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.author.name,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  '@${post.author.username}',
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context).hintColor,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    PostBody(post: post, showWholeText: true),
                    SizedBox(height: 5),
                    if (post.image1Url != null)
                      SizedBox(height: 200, child: ImageViewer(post: post)),
                    SizedBox(height: 5),
                    if (post.repostOf != null)
                      DependencyContainer(
                        child: PostWidgetSelector(
                          post: post.repostOf!,
                          isDependency: true,
                        ),
                      ),
                    if (post.ballot != null)
                      DependencyContainer(
                        child: BallotTile(
                          ballot: post.ballot!,
                          isDependency: true,
                        ),
                      ),
                    if (post.survey != null)
                      DependencyContainer(
                        child: SurveyTile(
                          survey: post.survey!,
                          isDependency: true,
                        ),
                      ),
                    if (post.petition != null)
                      DependencyContainer(
                        child: PetitionTile(
                          petition: post.petition!,
                          isDependency: true,
                        ),
                      ),
                    SizedBox(height: 5),
                    if (post.communityNote.isNotEmpty)
                      CommunityNote(post: post),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${timeFormat.format(post.publishedAt)} • '
                        '${dateFormat.format(post.publishedAt)}',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReplyButton(post: post, numberFormat: numberFormat),
                        RepostButton(post: post, numberFormat: numberFormat),
                        LikeButton(post: post, numberFormat: numberFormat),
                        BookmarkButton(post: post, numberFormat: numberFormat),
                        ViewsButton(post: post, numberFormat: numberFormat),
                      ],
                    ),
                  ],
                ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PostPopUp(post: post),
        ),
      ],
    );
  }
}
