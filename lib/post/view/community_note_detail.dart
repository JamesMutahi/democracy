import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/replies/replies_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/bottom_reply_text_field.dart';
import 'package:democracy/post/view/widgets/community_note_tile.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/replies.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

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
  late Post _communityNote = widget.communityNote;
  late Post _communityNoteOf = widget.communityNote.communityNoteOf!;
  bool isDeleted = false;
  bool loading = true;
  bool failure = false;
  List<Post> _replies = [];
  bool hasNextPage = false;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    context.read<RepliesBloc>().add(
      RepliesEvent.get(post: widget.communityNote),
    );
    context.read<RepliesBloc>().add(
      RepliesEvent.resubscribe(
        post: widget.communityNote,
        replies: [widget.communityNote.communityNoteOf!],
      ),
    );
  }

  void _onScrollUp() {
    context.read<RepliesBloc>().add(
      RepliesEvent.get(post: widget.communityNote, lastPost: _replies.last),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) {
        if (_replies.isNotEmpty) {
          context.read<RepliesBloc>().add(
            RepliesEvent.unsubscribe(
              post: widget.communityNote,
              replies: _replies,
            ),
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
                      post: widget.communityNote,
                      replies: _replies,
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
                  if (widget.communityNote.id == post.replyTo?.id) {
                    setState(() {
                      int index = _replies.indexWhere(
                        (element) => element.author.id != post.author.id,
                      );
                      _replies.insert(index, post);
                    });
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
          BlocListener<RepliesBloc, RepliesState>(
            listener: (context, state) {
              if (state.status == RepliesStatus.success) {
                if (widget.communityNote.id == state.postId) {
                  setState(() {
                    _replies = state.posts.toList();
                    loading = false;
                    failure = false;
                    hasNextPage = state.hasNext;
                    //   TODO: Stop loader
                  });
                }
              }
              if (state.status == RepliesStatus.failure) {
                if (widget.communityNote.id == state.postId) {
                  if (loading) {
                    setState(() {
                      loading = false;
                      failure = true;
                    });
                  }
                  //   TODO: Stop loader with failure message
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
              : CustomScrollView(
                  reverse: true,
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: SingleChildScrollView(
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
                                  : Replies(replies: _replies),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: PostTile(
                        showBottomThread: true,
                        hideBorder: true,
                        post: _communityNoteOf,
                      ),
                    ),
                  ],
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
        late User user;
        if (state is Authenticated) user = state.user;
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
