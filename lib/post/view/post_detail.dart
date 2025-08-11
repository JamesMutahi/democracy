import 'dart:async';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_text_form_field.dart';
import 'package:democracy/app/utils/view/custom_text.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/app/utils/view/tagging.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/poll/bloc/poll_detail/poll_detail_cubit.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_cubit.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/replies.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:democracy/user/bloc/users/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertagger/fluttertagger.dart';
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
  final RefreshController _controller = RefreshController(
    initialRefresh: false,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostDetailCubit, PostDetailState>(
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
                      isEdited: state.isEdited,
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
                    isEdited: state.isEdited,
                    isDeleted: state.isDeleted,
                    isActive: state.isActive,
                  );
                  setState(() {
                    _post = _post.copyWith(repostOf: repostOf);
                  });
                }
              case PostDeleted(:final postId):
                if (_post.id == postId) {
                  setState(() {
                    isDeleted = true;
                  });
                }
            }
          },
        ),
        BlocListener<UserDetailCubit, UserDetailState>(
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
        BlocListener<PollDetailCubit, PollDetailState>(
          listener: (context, state) {
            if (state is PollUpdated) {
              // post
              if (_post.poll?.id == state.poll.id) {
                setState(() {
                  _post = _post.copyWith(poll: state.poll);
                });
              }
              // repost
              if (_post.repostOf?.poll?.id == state.poll.id) {
                setState(() {
                  Post repostOf = _post.repostOf!.copyWith(poll: state.poll);
                  _post = _post.copyWith(repostOf: repostOf);
                });
              }
            }
          },
        ),
        BlocListener<SurveyDetailCubit, SurveyDetailState>(
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
        BlocListener<RepliesCubit, RepliesState>(
          listener: (context, state) {
            if (state.status == RepliesStatus.success) {
              if (widget.post.id == state.postId) {
                setState(() {
                  if (_controller.headerStatus == RefreshStatus.refreshing) {
                    _controller.refreshCompleted();
                  }
                  if (_controller.footerStatus == LoadStatus.loading) {
                    _controller.loadComplete();
                  }
                });
              }
            }
            if (state.status == RepliesStatus.failure) {
              if (widget.post.id == state.postId) {
                if (_controller.headerStatus == RefreshStatus.refreshing) {
                  _controller.refreshFailed();
                }
                if (_controller.footerStatus == LoadStatus.loading) {
                  _controller.loadFailed();
                }
              }
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Post')),
        body:
            isDeleted
                ? Center(
                  child: Text('This post has been deleted by the author'),
                )
                : PopScope(
                  canPop: true,
                  onPopInvokedWithResult: (_, __) {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.unsubscribeReplies(post: widget.post),
                    );
                  },
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: false,
                    header: ClassicHeader(),
                    controller: _controller,
                    onRefresh: () {
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.getPost(post: widget.post),
                      );
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.getReplies(post: widget.post),
                      );
                    },
                    child: ListView(
                      children: [
                        if (widget.showAsRepost)
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              late User user;
                              if (state is Authenticated) {
                                user = state.user;
                              }
                              return Container(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 10,
                                  bottom: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Symbols.loop_rounded,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.outline,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          user.id == _post.author.id
                                              ? 'You reposted'
                                              : '${_post.author.name} reposted',
                                          style: TextStyle(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.outline,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (user.id == _post.author.id)
                                      IconButton(
                                        onPressed: () {
                                          context.read<WebsocketBloc>().add(
                                            WebsocketEvent.deletePost(
                                              post: _post,
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Symbols.delete_outline_rounded,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.outline,
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        _PostContainer(post: _post),
                        Replies(key: ValueKey(_post.id), post: _post),
                      ],
                    ),
                  ),
                ),
        bottomNavigationBar:
            _post.author.hasBlocked
                ? Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'You have been blocked',
                    textAlign: TextAlign.center,
                  ),
                )
                : BottomReplyTextField(post: _post),
      ),
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

    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).disabledColor.withAlpha(30),
          ),
        ),
      ),
      child:
          post.isDeleted
              ? PostDeletedWidget()
              : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          navigateToProfilePage(post.author);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              ProfileImage(user: post.author),
                              SizedBox(width: 10),
                              Text(
                                post.author.name,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                      PostMorePopUp(post: post),
                    ],
                  ),
                  SizedBox(height: 5),
                  CustomText(
                    text: post.body,
                    style: Theme.of(context).textTheme.bodyMedium!,
                    showAllText: true,
                    suffix: '',
                    onUserTagPressed: (userId) {
                      navigateToProfilePage(
                        post.taggedUsers.firstWhere(
                          (user) => user.id == int.parse(userId),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 5),
                  (post.repostOf == null)
                      ? SizedBox.shrink()
                      : DependencyContainer(
                        child: PostTile(
                          post: post.repostOf!,
                          isDependency: true,
                        ),
                      ),
                  (post.poll == null)
                      ? SizedBox.shrink()
                      : DependencyContainer(
                        child: PollTile(poll: post.poll!, isChildOfPost: true),
                      ),
                  (post.survey == null)
                      ? SizedBox.shrink()
                      : DependencyContainer(
                        child: SurveyTile(
                          survey: post.survey!,
                          isChildOfPost: true,
                        ),
                      ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '${timeFormat.format(post.publishedAt)} • '
                      '${dateFormat.format(post.publishedAt)}',
                      style: TextStyle(color: Theme.of(context).disabledColor),
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
    );
  }
}

class BottomReplyTextField extends StatefulWidget {
  const BottomReplyTextField({super.key, required this.post});

  final Post post;

  @override
  State<BottomReplyTextField> createState() => _BottomReplyTextFieldState();
}

class _BottomReplyTextFieldState extends State<BottomReplyTextField>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool _disableSendButton = true;

  double overlayHeight = 300;
  SearchResultView _view = SearchResultView.none;

  final _controller = FlutterTaggerController();
  final _focusNode = FocusNode();
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((
      bool visible,
    ) {
      if (!visible) {
        _controller.dismissOverlay();
        _focusNode.unfocus();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    _controller.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersCubit, UsersState>(
      listener: (context, state) {
        if (state.status == UsersStatus.success) {
          setState(() {
            _view = SearchResultView.users;
            if (state.users.isEmpty) {
              overlayHeight = 1;
            }
            if (state.users.length == 1) {
              overlayHeight = 75;
            }
            if (state.users.length == 2) {
              overlayHeight = 150;
            }
            if (state.users.length == 3) {
              overlayHeight = 225;
            }
            if (state.users.length > 3) {
              overlayHeight = 300;
            }
          });
        }
      },
      child: FlutterTagger(
        triggerStrategy: TriggerStrategy.eager,
        controller: _controller,
        animationController: _animationController,
        onSearch: (query, triggerChar) {
          if (triggerChar == "@") {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getUsers(
                searchTerm: query.toLowerCase().trim(),
                page: 1,
              ),
            );
          }
        },
        triggerCharacterAndStyles: const {
          "@": TextStyle(color: Colors.blueAccent),
        },
        tagTextFormatter: (id, tag, triggerCharacter) {
          return "$triggerCharacter$id#$tag#";
        },
        overlayHeight: overlayHeight,
        overlay:
            _view == SearchResultView.users
                ? UserListView(
                  key: ValueKey('Detail'),
                  tagController: _controller,
                  animation: _animation,
                )
                : SizedBox.shrink(),
        builder: (context, containerKey) {
          return BottomTextFormField(
            containerKey: containerKey,
            focusNode: _focusNode,
            showCursor: true,
            readOnly: false,
            controller: _controller,
            onTap: () {},
            onChanged: (value) {
              if (value == '') {
                setState(() {
                  _disableSendButton = true;
                });
              } else {
                setState(() {
                  _disableSendButton = false;
                });
              }
            },
            hintText: 'Reply',
            prefixIcon: null,
            onSend:
                _disableSendButton
                    ? null
                    : () {
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.createPost(
                          body: _controller.formattedText,
                          status: PostStatus.published,
                          replyTo: widget.post,
                          repostOf: null,
                          poll: null,
                          survey: null,
                          taggedUserIds:
                              _controller.tags
                                  .map((tag) => int.parse(tag.id))
                                  .toList(),
                        ),
                      );
                      _controller.clear();
                      setState(() {
                        _disableSendButton = true;
                      });
                    },
          );
        },
      ),
    );
  }
}
