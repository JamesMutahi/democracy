import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/cached_link_preview.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/post/post_bloc.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/replies/replies_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart' hide PostStatus;
import 'package:democracy/post/view/widgets/bottom_reply_text_field.dart';
import 'package:democracy/post/view/widgets/community_note_tile.dart';
import 'package:democracy/post/view/widgets/replies.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class CommunityNoteDetail extends StatelessWidget {
  const CommunityNoteDetail({super.key, @PathParam('id') required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PostBloc(webSocketService: context.read<WebSocketService>())
                ..add(PostEvent.load(postId: postId)),
        ),
        BlocProvider(
          create: (context) =>
              UsersBloc(webSocketService: context.read<WebSocketService>()),
        ),
      ],
      child: MainContainer(
        child: Scaffold(
          appBar: AppBar(
            leading: const AutoLeadingButton(),
            title: Text('Community Note'),
          ),
          body: BlocBuilder<PostBloc, PostState>(
            buildWhen: (previous, current) => current.postId == postId,
            builder: (context, state) {
              if (state.status == PostStatus.initial ||
                  (state.status == PostStatus.loading && state.post == null)) {
                return BottomLoader();
              }
              if (state.status == PostStatus.failure && state.post == null) {
                return FailureRetryButton(
                  onPressed: () {
                    context.read<PostBloc>().add(
                      PostEvent.load(postId: postId),
                    );
                  },
                );
              }
              return _CommunityNoteDetail(post: state.post!);
            },
          ),
          bottomNavigationBar: BlocBuilder<PostBloc, PostState>(
            buildWhen: (previous, current) => current.postId == postId,
            builder: (context, state) {
              return state.post == null
                  ? SizedBox.shrink()
                  : state.post!.isDeleted
                  ? SizedBox.shrink()
                  : state.post!.author.hasBlocked
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'You have been blocked',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : BottomReplyTextField(post: state.post!);
            },
          ),
        ),
      ),
    );
  }
}

class _CommunityNoteDetail extends StatefulWidget {
  const _CommunityNoteDetail({required this.post});

  final Post post;

  @override
  State<_CommunityNoteDetail> createState() => _CommunityNoteDetailState();
}

class _CommunityNoteDetailState extends State<_CommunityNoteDetail> {
  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController = RefreshController();
  final ValueKey _centerKey = ValueKey('Center');
  bool _isDeleted = false;
  List<int> expandedReplies = [];

  @override
  void initState() {
    super.initState();
    context.read<PostDetailBloc>().add(
      PostDetailEvent.addClick(post: widget.post),
    );
    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    // Clear the registry when leaving
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RepliesBloc(webSocketService: context.read<WebSocketService>())
                ..add(RepliesEvent.get(postId: widget.post.id)),
        ),
        BlocProvider(
          create: (context) => ReplyToBloc(
            webSocketService: context.read<WebSocketService>(),
          )..add(ReplyToEvent.get(postId: widget.post.communityNoteOf!.id)),
        ),
      ],
      child: PopScope(
        canPop: true,
        onPopInvokedWithResult: (_, _) {
          context.read<PostDetailBloc>().add(
            PostDetailEvent.unsubscribe(postId: widget.post.id),
          );
        },
        child: MultiBlocListener(
          listeners: [
            BlocListener<WebsocketBloc, WebsocketState>(
              listener: (context, state) {
                context.read<PostBloc>().add(
                  PostEvent.load(postId: widget.post.id),
                );
              },
            ),
            BlocListener<PostCreateBloc, PostCreateState>(
              listener: (context, state) {
                if (state.status == PostCreateStatus.success) {
                  final post = state.post!;
                  if (widget.post.id == post.replyTo?.id) {
                    context.read<RepliesBloc>().add(
                      RepliesEvent.add(postId: widget.post.id, reply: post),
                    );
                  }
                  if (widget.post.id == post.repostOf?.id) {
                    context.read<PostBloc>().add(
                      PostEvent.postCreated(post: post),
                    );
                  }
                }
              },
            ),
            BlocListener<PostDetailBloc, PostDetailState>(
              listener: (context, state) {
                switch (state) {
                  case PostUpdated():
                    context.read<PostBloc>().add(
                      PostEvent.detailUpdated(
                        postId: state.postId,
                        likes: state.likes,
                        bookmarks: state.bookmarks,
                        views: state.views,
                        replies: state.replies,
                        reposts: state.reposts,
                        communityNote: state.communityNote,
                        upvotes: state.upvotes,
                        downvotes: state.downvotes,
                        isDeleted: state.isDeleted,
                        isActive: state.isActive,
                      ),
                    );

                  case PostLiked(:final postId):
                    if (widget.post.id == postId) {
                      context.read<PostBloc>().add(
                        PostEvent.likeUpdated(
                          isLiked: state.isLiked,
                          likes: state.likes,
                        ),
                      );
                    }

                  case PostBookmarked(:final postId):
                    if (widget.post.id == postId) {
                      context.read<PostBloc>().add(
                        PostEvent.bookmarkUpdated(
                          isBookmarked: state.isBookmarked,
                          bookmarks: state.bookmarks,
                        ),
                      );
                    }

                  case PostUpvoted(:final postId):
                    if (widget.post.id == postId) {
                      context.read<PostBloc>().add(
                        PostEvent.upvoteUpdated(
                          isUpvoted: state.isUpvoted,
                          upvotes: state.upvotes,
                          isDownvoted: state.isDownvoted,
                          downvotes: state.downvotes,
                        ),
                      );
                    }

                  case PostDownvoted(:final postId):
                    if (widget.post.id == postId) {
                      context.read<PostBloc>().add(
                        PostEvent.downvoteUpdated(
                          isUpvoted: state.isUpvoted,
                          upvotes: state.upvotes,
                          isDownvoted: state.isDownvoted,
                          downvotes: state.downvotes,
                        ),
                      );
                    }

                  case PostDeleted(:final postId):
                    if (widget.post.id == postId) {
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
                  if (widget.post.author.id == state.user.id) {
                    context.read<PostBloc>().add(
                      PostEvent.authorUpdated(user: state.user),
                    );
                  }
                  // repost
                  if (widget.post.repostOf?.author.id == state.user.id) {
                    context.read<PostBloc>().add(
                      PostEvent.authorUpdated(user: state.user),
                    );
                  }
                }
              },
            ),
          ],
          child: _isDeleted
              ? Center(
                  child: Text(
                    'This community note has been deleted by the author',
                  ),
                )
              : BlocBuilder<RepliesBloc, RepliesState>(
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
                      if (_refreshController.footerStatus ==
                          LoadStatus.loading) {
                        _refreshController.loadComplete();
                      }
                    }

                    if (state.status == RepliesStatus.failure) {
                      if (_refreshController.headerStatus ==
                          RefreshStatus.refreshing) {
                        _refreshController.refreshFailed();
                      }
                      if (_refreshController.footerStatus ==
                          LoadStatus.loading) {
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
                          RepliesEvent.get(
                            postId: widget.post.id,
                            previousPosts: replies,
                          ),
                        );
                      },
                      child: CustomScrollView(
                        center: _centerKey,
                        controller: isWebLayout ? _scrollController : null,
                        physics: isWebLayout
                            ? NeverScrollableScrollPhysics()
                            : null,
                        slivers: <Widget>[
                          ReplyTos(postId: widget.post.communityNoteOf!.id),
                          SliverToBoxAdapter(
                            key: _centerKey,
                            child: Column(
                              children: [
                                if (widget.post.repostType == RepostType.repost)
                                  Stack(
                                    children: [
                                      ThreadLine(
                                        showBottomThread: true,
                                        showTopThread: true,
                                      ),
                                      _repostBanner(),
                                    ],
                                  ),
                                CommunityNoteTile(
                                  communityNote: widget.post,
                                  navigateToDetailPage: false,
                                  showWholeText: true,
                                  isDependency: false,
                                  showTopThread: true,
                                  showBottomThread: false,
                                ),
                                CachedLinkPreview(
                                  text: widget.post.body,
                                  cacheKey: 'post: ${widget.post.id}',
                                ),
                              ],
                            ),
                          ),
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
                              child: FailureRetryButton(
                                onPressed: () {
                                  context.read<RepliesBloc>().add(
                                    RepliesEvent.get(postId: widget.post.id),
                                  );
                                  context.read<ReplyToBloc>().add(
                                    ReplyToEvent.get(postId: widget.post.id),
                                  );
                                },
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
                                    postId: widget.post.id,
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
                                    postId: widget.post.id,
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
        ),
      ),
    );
  }

  Widget _repostBanner() {
    final user = context.read<AuthBloc>().state.user!;
    String text = user.id == widget.post.author.id
        ? 'You reposted'
        : '${widget.post.author.name} reposted';
    if (widget.post.repostOf!.communityNoteOf != null) {
      text = '$text a community note';
    }
    return Container(
      margin: EdgeInsets.only(left: 30),
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
  }
}
