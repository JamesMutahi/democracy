import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/replies/replies_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/bottom_reply_text_field.dart';
import 'package:democracy/post/view/widgets/community_note_tile.dart';
import 'package:democracy/post/view/widgets/replies.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CommunityNoteDetail extends StatefulWidget {
  const CommunityNoteDetail({
    super.key,
    required this.communityNote,
    this.showAsRepost = false,
    this.repost,
  });

  final Post communityNote;
  final bool showAsRepost;
  final Post? repost;

  @override
  State<CommunityNoteDetail> createState() => _CommunityNoteDetailState();
}

class _CommunityNoteDetailState extends State<CommunityNoteDetail> {
  final RefreshController _refreshController = RefreshController();
  late Post _communityNote = widget.communityNote;
  late Post _communityNoteOf = widget.communityNote.communityNoteOf!;
  ValueKey centerKey = ValueKey('Center');
  bool isDeleted = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() {
    context.read<RepliesBloc>().add(
      RepliesEvent.get(post: widget.communityNote),
    );
    context.read<PostDetailBloc>().add(
      PostDetailEvent.get(post: widget.communityNote),
    );
    context.read<ReplyToBloc>().add(
      ReplyToEvent.get(post: widget.communityNote),
    );
    if (!widget.communityNote.isClicked) {
      context.read<PostDetailBloc>().add(
        PostDetailEvent.addClick(post: widget.communityNote),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, _) {
        context.read<PostDetailBloc>().add(
          PostDetailEvent.unsubscribe(post: widget.communityNote),
        );
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<WebsocketBloc, WebsocketState>(
            listener: (context, state) {
              context.read<PostDetailBloc>().add(
                PostDetailEvent.get(post: widget.communityNote),
              );
            },
          ),
          BlocListener<PostDetailBloc, PostDetailState>(
            listener: (context, state) {
              switch (state) {
                case PostCreated(post: final post):
                  if (widget.communityNote.id == post.replyTo?.id) {
                    context.read<RepliesBloc>().add(
                      RepliesEvent.add(post: post),
                    );
                  }
                case PostLoaded(:final post):
                  if (_communityNote.id == post.id) {
                    setState(() {
                      _communityNote = post;
                    });
                  }
                case PostUpdated():
                  // update post
                  if (_communityNote.id == state.postId) {
                    setState(() {
                      _communityNote = _communityNote.copyWith(
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
                  //   update community note of
                  if (_communityNoteOf.id == state.postId) {
                    setState(() {
                      _communityNoteOf = _communityNoteOf.copyWith(
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
                case PostDeleted(:final postId):
                  if (_communityNote.id == postId) {
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
                if (_communityNote.author.id == state.user.id) {
                  setState(() {
                    _communityNote = _communityNote.copyWith(
                      author: state.user,
                    );
                  });
                }
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(title: Text('Note')),
          body: isDeleted
              ? Center(
                  child: Text(
                    'This community note has been deleted by the author',
                  ),
                )
              : BlocBuilder<RepliesBloc, RepliesState>(
                  buildWhen: (previous, current) {
                    return widget.communityNote.id == current.postId;
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
                            post: _communityNote,
                            previousPosts: replies,
                          ),
                        );
                      },
                      child: CustomScrollView(
                        center: centerKey,
                        slivers: <Widget>[
                          ReplyTos(post: widget.communityNote),
                          SliverToBoxAdapter(
                            key: centerKey,
                            child: Column(
                              children: [
                                if (widget.showAsRepost)
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
                                  communityNote: _communityNote,
                                  navigateToDetailPage: false,
                                  showWholeText: true,
                                  isDependency: false,
                                  showTopThread: true,
                                  showBottomThread: false,
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
                                  _getData();
                                },
                              ),
                            )
                          else
                            Replies(replies: replies),
                        ],
                      ),
                    );
                  },
                ),
          bottomNavigationBar: _communityNote.author.hasBlocked
              ? Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'You have been blocked',
                    textAlign: TextAlign.center,
                  ),
                )
              : BottomReplyTextField(post: _communityNote),
        ),
      ),
    );
  }

  Widget _repostBanner() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        User user = (state as Authenticated).user;
        String text = user.id == widget.repost!.author.id
            ? 'You reposted'
            : '${widget.repost!.author.name} reposted';
        if (widget.repost!.repostOf!.communityNoteOf != null) {
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
      },
    );
  }
}
