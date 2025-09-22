import 'dart:async';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_text_form_field.dart';
import 'package:democracy/app/utils/custom_text.dart';
import 'package:democracy/app/utils/tagging.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_cubit.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/constitution/bloc/sections/sections_cubit.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/replies/replies_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/replies.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_cubit.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
import 'package:democracy/user/bloc/users/users_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
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
        BlocListener<BallotDetailCubit, BallotDetailState>(
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
        BlocListener<RepliesBloc, RepliesState>(
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
                    context.read<RepliesBloc>().add(
                      RepliesEvent.unsubscribe(post: widget.post),
                    );
                  },
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: false,
                    header: ClassicHeader(),
                    controller: _controller,
                    onRefresh: () {
                      context.read<PostDetailBloc>().add(
                        PostDetailEvent.get(post: widget.post),
                      );
                      context.read<RepliesBloc>().add(
                        RepliesEvent.get(post: widget.post),
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
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Symbols.loop_rounded,
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      user.id == widget.repost.author.id
                                          ? 'You reposted'
                                          : '${widget.repost.author.name} reposted',
                                      style: TextStyle(
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
                      PostPopUp(post: post),
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
                  if (post.repostOf != null)
                    DependencyContainer(
                      child: PostTile(post: post.repostOf!, isDependency: true),
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

  void changeOverlayHeight(int length) {
    if (length == 0) {
      overlayHeight = 1;
    }
    if (length == 1) {
      overlayHeight = 75;
    }
    if (length == 2) {
      overlayHeight = 150;
    }
    if (length == 3) {
      overlayHeight = 225;
    }
    if (length > 3) {
      overlayHeight = 300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UsersCubit, UsersState>(
          listener: (context, state) {
            if (state.status == UsersStatus.success) {
              setState(() {
                _view = SearchResultView.users;
                changeOverlayHeight(state.users.length);
              });
            }
          },
        ),
        BlocListener<SectionsCubit, SectionsState>(
          listener: (context, state) {
            if (state is SectionsLoaded) {
              setState(() {
                _view = SearchResultView.hashtag;
                changeOverlayHeight(state.sections.length);
              });
            }
          },
        ),
      ],
      child: FlutterTagger(
        triggerStrategy: TriggerStrategy.eager,
        controller: _controller,
        animationController: _animationController,
        onSearch: (query, triggerChar) {
          if (triggerChar == "@") {
            setState(() {
              _view = SearchResultView.users;
            });
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getUsers(searchTerm: query),
            );
          }
          if (triggerChar == "#") {
            setState(() {
              _view = SearchResultView.hashtag;
            });
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getConstitutionTags(searchTerm: query),
            );
          }
        },
        triggerCharacterAndStyles: const {
          "@": TextStyle(color: Colors.blueAccent),
          "#": TextStyle(color: Colors.blueAccent),
        },
        tagTextFormatter: (id, tag, triggerCharacter) {
          return "$triggerCharacter$id#$tag#";
        },
        overlayHeight: overlayHeight,
        overlay:
            _view == SearchResultView.users
                ? UserListView(
                  tagController: _controller,
                  animation: _animation,
                )
                : _view == SearchResultView.hashtag
                ? SectionListView(
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
            onSend: _disableSendButton ? null : _createPost,
          );
        },
      ),
    );
  }

  void _createPost() {
    List<Map> tags = [];
    for (var tag in _controller.tags) {
      tags.add({'id': tag.id, 'text': tag.text});
    }
    context.read<PostDetailBloc>().add(
      PostDetailEvent.create(
        body: _controller.formattedText,
        status: PostStatus.published,
        replyTo: widget.post,
        repostOf: null,
        ballot: null,
        survey: null,
        petition: null,
        tags: tags,
      ),
    );
    _controller.clear();
    setState(() {
      _disableSendButton = true;
    });
  }
}
