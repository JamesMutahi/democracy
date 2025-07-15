import 'dart:async';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/app/utils/view/tagging.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/post/view/post_tile.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:democracy/users/bloc/search_users/search_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostCreate extends StatefulWidget {
  const PostCreate({
    super.key,
    this.post,
    this.poll,
    this.survey,
    this.isReply = false,
  });

  final Post? post;
  final Poll? poll;
  final Survey? survey;
  final bool isReply;

  @override
  State<PostCreate> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  final _controller = FlutterTaggerController();
  bool _disablePostButton = true;

  void createPost({PostStatus status = PostStatus.published}) {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.createPost(
        body: _controller.formattedText,
        status: status,
        replyTo: widget.isReply ? widget.post : null,
        repostOf: widget.isReply ? null : widget.post,
        poll: widget.poll,
        survey: widget.survey,
        taggedUserIds:
            _controller.tags.map((tag) => int.parse(tag.id)).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailCubit, PostDetailState>(
      listener: (context, state) {
        if (state is PostCreated) {
          Navigator.pop(context);
          String message =
              state.post.status == PostStatus.published
                  ? state.post.replyTo == null
                      ? 'Post published'
                      : 'Reply sent'
                  : 'Post saved as draft';
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).cardColor,
            content: SnackBarContent(
              message: message,
              status: SnackBarStatus.success,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          _disablePostButton
              ? Navigator.pop(context)
              : showDialog(
                context: context,
                builder:
                    (context) => SaveDraftDialog(
                      onYesPressed: () {
                        createPost(status: PostStatus.draft);
                      },
                    ),
              );
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _disablePostButton
                        ? Navigator.pop(context)
                        : showDialog(
                          context: context,
                          builder:
                              (context) => SaveDraftDialog(
                                onYesPressed: () {
                                  createPost(status: PostStatus.draft);
                                },
                              ),
                        );
                  },
                  icon: Icon(Symbols.close),
                ),
                OutlinedButton(
                  onPressed:
                      _disablePostButton
                          ? null
                          : () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => PostCreateDialog(
                                    onYesPressed: () {
                                      createPost();
                                    },
                                  ),
                            );
                          },
                  child: Text(widget.isReply ? 'Reply' : 'Post'),
                ),
              ],
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            late User user;
                            if (state is Authenticated) {
                              user = state.user;
                            }
                            return ProfileImage(user: user);
                          },
                        ),
                      ),
                      Flexible(
                        flex: 9,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          child: TextFormField(
                            controller: _controller,
                            onChanged: (value) {
                              if (value == '') {
                                setState(() {
                                  _disablePostButton = true;
                                });
                              } else {
                                setState(() {
                                  _disablePostButton = false;
                                });
                              }
                            },
                            autofocus: true,
                            minLines: 1,
                            maxLines: 7,
                            keyboardType: TextInputType.multiline,
                            maxLength: 500,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              hintText:
                                  widget.isReply ? 'Reply' : "What's new?",
                              hintStyle: TextStyle(
                                color: Theme.of(context).hintColor,
                              ),
                              prefixIcon: null,
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 0,
                                minHeight: 0,
                              ),
                              prefixStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                              contentPadding: const EdgeInsets.all(15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  (widget.post == null)
                      ? SizedBox.shrink()
                      : DependencyContainer(
                        child: PostTile(
                          post: widget.post!,
                          isChildOfPost: true,
                        ),
                      ),
                  (widget.poll == null)
                      ? SizedBox.shrink()
                      : DependencyContainer(
                        child: PollTile(
                          poll: widget.poll!,
                          isChildOfPost: true,
                        ),
                      ),
                  (widget.survey == null)
                      ? SizedBox.shrink()
                      : DependencyContainer(
                        child: SurveyTile(
                          survey: widget.survey!,
                          isChildOfPost: true,
                        ),
                      ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _BottomNavBar(controller: _controller),
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatefulWidget {
  const _BottomNavBar({required this.controller});

  final FlutterTaggerController controller;

  @override
  State<_BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  double overlayHeight = 1;
  SearchResultView _view = SearchResultView.none;

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
        widget.controller.dismissOverlay();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.controller.dispose();
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
        controller: widget.controller,
        animationController: _animationController,
        onSearch: (query, triggerChar) {
          if (triggerChar == "@") {
            setState(() {
              _view = SearchResultView.users;
            });
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
                  tagController: widget.controller,
                  animation: _animation,
                )
                : SizedBox.shrink(),
        builder: (context, containerKey) {
          return Container(
            key: containerKey,
            color: Theme.of(context).canvasColor,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PostExtraButton(
                    iconData: Symbols.gallery_thumbnail_rounded,
                    onTap: () {},
                  ),
                  SizedBox(width: 15),
                  PostExtraButton(
                    iconData: Symbols.edit_calendar_rounded,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostExtraButton extends StatelessWidget {
  const PostExtraButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      splashColor: Theme.of(context).colorScheme.secondaryFixedDim,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          // color: Theme.of(context).canvasColor,
          border: Border.all(color: Theme.of(context).disabledColor),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Icon(iconData, color: Theme.of(context).disabledColor, size: 20),
      ),
    );
  }
}

class PostCreateDialog extends StatelessWidget {
  const PostCreateDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Post')),
      content: Text(
        'Are you sure you want to post this?',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            onYesPressed();
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}

class SaveDraftDialog extends StatelessWidget {
  const SaveDraftDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Save as draft')),
      content: Text(
        'Do you want to save this post as a draft? \n'
        'You can post it at a later time.',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
        OutlinedButton(
          onPressed: () {
            onYesPressed();
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}
