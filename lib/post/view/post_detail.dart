import 'dart:async';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_text_form_field.dart';
import 'package:democracy/app/utils/view/custom_text.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/app/utils/view/tagging.dart';
import 'package:democracy/app/view/widgets/profile_page.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_tile.dart';
import 'package:democracy/post/view/replies.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:democracy/users/bloc/search_users/search_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:intl/intl.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key, required this.post});

  final Post post;

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  late Post _post = widget.post;

  void _setPostState(post) {
    setState(() {
      _post = post;
    });
  }

  void _navigateToProfilePage(User user) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ProfilePage(user: _post.author)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var timeFormat = DateFormat('hh:mm a');
    var dateFormat = DateFormat('dd/MM/yyyy');
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    return BlocListener<PostDetailCubit, PostDetailState>(
      listener: (context, state) {
        switch (state) {
          case PostUpdated(:final post):
            if (_post.id == post.id) {
              _setPostState(post);
            }
          case PostCreated(:final post):
            if (post.repostOf?.id == _post.id) {
              _setPostState(post.repostOf!);
            }
            if (post.replyTo?.id == _post.id) {
              _setPostState(post.replyTo!);
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme.of(context).cardColor,
                content: SnackBarContent(
                  message: 'Reply sent',
                  status: SnackBarStatus.success,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Post')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).disabledColor.withAlpha(30),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _navigateToProfilePage(_post.author);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              children: [
                                ProfileImage(user: _post.author),
                                SizedBox(width: 10),
                                Text(
                                  _post.author.name,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                        PostMorePopUp(post: _post),
                      ],
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      text: _post.body,
                      showAllText: true,
                      suffix: '',
                      onUserTagPressed: (userId) {
                        _navigateToProfilePage(
                          _post.taggedUsers.firstWhere(
                            (user) => user.id == int.parse(userId),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 5),
                    (_post.repostOf == null)
                        ? SizedBox.shrink()
                        : DependencyContainer(
                          child: PostTile(
                            post: _post.repostOf!,
                            isChildOfPost: true,
                          ),
                        ),
                    (_post.poll == null)
                        ? SizedBox.shrink()
                        : DependencyContainer(
                          child: PollTile(
                            poll: _post.poll!,
                            isChildOfPost: true,
                          ),
                        ),
                    (_post.survey == null)
                        ? SizedBox.shrink()
                        : DependencyContainer(
                          child: SurveyTile(
                            survey: _post.survey!,
                            isChildOfPost: true,
                          ),
                        ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${(_post.views > 0) ? '${_post.views} ${(_post.views == 1) ? 'View' : 'Views'} • ' : ''}'
                        '${timeFormat.format(_post.publishedAt)} • '
                        '${dateFormat.format(_post.publishedAt)}',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReplyButton(post: _post, numberFormat: numberFormat),
                        RepostButton(post: _post, numberFormat: numberFormat),
                        LikeButton(post: _post, numberFormat: numberFormat),
                        BookmarkButton(post: _post, numberFormat: numberFormat),
                        ShareButton(post: _post),
                      ],
                    ),
                  ],
                ),
              ),
              Replies(key: ValueKey(_post.id), post: _post),
            ],
          ),
        ),
        bottomNavigationBar: BottomReplyTextField(post: _post),
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
    return BlocListener<SearchUsersCubit, SearchUsersState>(
      listener: (context, state) {
        if (state is SearchUsersLoaded) {
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
              WebsocketEvent.searchUsers(
                searchTerm: query.toLowerCase().trim(),
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
