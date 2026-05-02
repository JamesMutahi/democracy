import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/asset_viewer.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/meeting/view/widgets/meeting_tile.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/replies/replies_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/bottom_reply_text_field.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/post/view/widgets/post_body.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/replies.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({
    super.key,
    required this.post,
    required this.showAsRepost,
    required this.repost,
  });

  final Post post;
  final bool showAsRepost;
  final Post repost;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late Post _post = widget.post;
  final RefreshController _refreshController = RefreshController();
  final ValueKey _centerKey = ValueKey('Center');
  bool _isDeleted = false;
  List<int> expandedReplies = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() {
    context.read<PostDetailBloc>().add(PostDetailEvent.get(post: widget.post));
    context.read<RepliesBloc>().add(RepliesEvent.get(post: widget.post));
    if (widget.post.replyTo != null) {
      context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.post));
    }
    context.read<PostDetailBloc>().add(
      PostDetailEvent.addClick(post: widget.post),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, _) {
        context.read<PostDetailBloc>().add(
          PostDetailEvent.unsubscribe(post: widget.post),
        );
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<WebsocketBloc, WebsocketState>(
            listener: (context, state) {
              if (state.status == WebsocketStatus.connected) {
                context.read<PostDetailBloc>().add(
                  PostDetailEvent.get(post: widget.post),
                );
              }
            },
          ),
          BlocListener<PostCreateBloc, PostCreateState>(
            listener: (context, state) {
              if (state.status == PostCreateStatus.success) {
                final post = state.post!;
                if (widget.post.id == post.replyTo?.id) {
                  context.read<RepliesBloc>().add(
                    RepliesEvent.add(postId: _post.id, reply: post),
                  );
                }
              }
            },
          ),
          BlocListener<PostDetailBloc, PostDetailState>(
            listener: (context, state) {
              switch (state) {
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
                      _isDeleted = true;
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
        ],
        child: Scaffold(
          appBar: AppBar(title: Text('Post')),
          body: BlocBuilder<RepliesBloc, RepliesState>(
            buildWhen: (previous, current) {
              return widget.post.id == current.postId;
            },
            builder: (context, state) {
              final replies = state.posts.toList();

              if (state.status == RepliesStatus.success) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              }

              if (state.status == RepliesStatus.failure) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadFailed();
                }
              }

              return SmartRefresher(
                enablePullDown: false,
                enablePullUp: state.hasNext,
                header: ClassicHeader(),
                footer: ClassicFooter(),
                controller: _refreshController,
                onLoading: () {
                  context.read<RepliesBloc>().add(
                    RepliesEvent.get(post: _post, previousPosts: replies),
                  );
                },
                child: CustomScrollView(
                  center: _centerKey,
                  slivers: <Widget>[
                    if (widget.post.replyTo != null)
                      ReplyTos(post: widget.post),
                    _buildMainPost(),
                    if (state.status == RepliesStatus.initial)
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: BottomLoader(),
                        ),
                      )
                    else if (state.status == RepliesStatus.failure &&
                        replies.isEmpty)
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: FailureRetryButton(onPressed: _getData),
                        ),
                      )
                    else
                      Replies(
                        replies: replies,
                        expandedReplies: expandedReplies,
                        onExpand: (post) {
                          setState(() {
                            expandedReplies.add(post.id);
                          });
                        },
                        onRepliesUpdated: (replies) {
                          context.read<RepliesBloc>().add(
                            RepliesEvent.update(
                              postId: _post.id,
                              replies: replies,
                            ),
                          );
                        },
                        onThreadUpdated: (reply) {
                          int index = replies.indexWhere(
                            (r) => r.id == reply.id,
                          );
                          replies[index] = reply;
                          context.read<RepliesBloc>().add(
                            RepliesEvent.update(
                              postId: _post.id,
                              replies: replies,
                            ),
                          );
                        },
                      ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: _post.isDeleted
              ? SizedBox.shrink()
              : _post.author.hasBlocked
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

  Widget _buildMainPost() {
    return SliverToBoxAdapter(
      key: _centerKey,
      child: Column(
        children: [
          if (_post.replyTo == null)
            Column(
              children: [
                if (widget.showAsRepost) _repostBanner(),
                _PostContainer(post: _post, isDeleted: _isDeleted),
              ],
            )
          else
            Column(
              children: [
                if (widget.showAsRepost)
                  Stack(
                    children: [
                      ThreadLine(showBottomThread: true, showTopThread: true),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: _repostBanner(),
                      ),
                    ],
                  ),
                Stack(
                  children: [
                    ThreadLine(showBottomThread: false, showTopThread: true),
                    _PostContainer(post: _post, isDeleted: _isDeleted),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _repostBanner() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        User user = state.user!;
        String text = user.id == widget.repost.author.id
            ? 'You reposted'
            : '${widget.repost.author.name} reposted';
        if (widget.repost.repostOf!.communityNoteOf != null) {
          text = '$text a community note';
        }
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
                text,
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
  const _PostContainer({required this.post, required this.isDeleted});

  final Post post;
  final bool isDeleted;

  @override
  Widget build(BuildContext context) {
    var timeFormat = DateFormat('hh:mm a');
    var dateFormat = DateFormat('dd/MM/yyyy');

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
          child: isDeleted
              ? PostDeletedWidget()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        navigateToProfilePage(
                          context: context,
                          user: post.author,
                        );
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
                    if (post.assets.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: AssetViewer(
                          key: ValueKey(post.id),
                          assets: post.assets,
                        ),
                      ),
                    if (post.location != null)
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: MapWidget(mapCenter: post.location!),
                      ),
                    if (post.repostOf != null) PostDependency(post: post),
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
                    if (post.meeting != null)
                      DependencyContainer(
                        child: MeetingTile(
                          meeting: post.meeting!,
                          isDependency: true,
                        ),
                      ),
                    if (post.section != null)
                      DependencyContainer(
                        child: SectionTile(
                          section: post.section!,
                          isDependency: true,
                        ),
                      ),
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
                        ReplyButton(post: post),
                        RepostButton(post: post),
                        LikeButton(post: post),
                        BookmarkButton(post: post),
                        ViewsButton(post: post),
                      ],
                    ),
                  ],
                ),
        ),
        post.isDeleted
            ? SizedBox.shrink()
            : Align(
                alignment: Alignment.topRight,
                child: PostPopUp(post: post),
              ),
      ],
    );
  }
}
