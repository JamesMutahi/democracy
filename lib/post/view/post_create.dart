import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostCreate extends StatefulWidget {
  const PostCreate({super.key, this.post, this.poll, this.survey});

  final Post? post;
  final Poll? poll;
  final Survey? survey;

  @override
  State<PostCreate> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  String body = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailCubit, PostDetailState>(
      listener: (context, state) {
        if (state is PostCreated) {
          Navigator.pop(context);
          String message =
              state.post.status == PostStatus.published
                  ? 'Post published'
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
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  if (body.isEmpty) {
                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder:
                          (context) => SaveDraftDialog(
                            onYesPressed: () {
                              context.read<WebsocketBloc>().add(
                                WebsocketEvent.createPost(
                                  body: body,
                                  status: PostStatus.draft,
                                  replyTo: null,
                                  repostOf: widget.post,
                                  poll: widget.poll,
                                  survey: widget.survey,
                                ),
                              );
                            },
                          ),
                    );
                  }
                },
                icon: Icon(Symbols.close),
              ),
              OutlinedButton(
                onPressed:
                    body == ''
                        ? null
                        : () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => PostCreateDialog(
                                  onYesPressed: () {
                                    context.read<WebsocketBloc>().add(
                                      WebsocketEvent.createPost(
                                        body: body,
                                        status: PostStatus.published,
                                        replyTo: null,
                                        repostOf: widget.post,
                                        poll: widget.poll,
                                        survey: widget.survey,
                                      ),
                                    );
                                  },
                                ),
                          );
                        },
                child: Text('Post'),
              ),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
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
                          onChanged: (value) {
                            setState(() {
                              body = value;
                            });
                          },
                          autofocus: true,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // maxLength: 25000,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            hintText: "What's new?",
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
                      child: PostTile(post: widget.post!, isChildOfPost: true),
                    ),
                (widget.poll == null)
                    ? SizedBox.shrink()
                    : DependencyContainer(
                      child: PollTile(poll: widget.poll!, isChildOfPost: true),
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
        bottomNavigationBar: _BottomNavBar(body: body),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.body});

  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PostExtraButton(iconData: Symbols.gallery_thumbnail_rounded),
            SizedBox(width: 15),
            PostExtraButton(iconData: Symbols.edit_calendar_rounded),
          ],
        ),
      ),
    );
  }
}

class PostExtraButton extends StatelessWidget {
  const PostExtraButton({super.key, required this.iconData});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      splashColor: Theme.of(context).colorScheme.secondaryFixedDim,
      onTap: () {},
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
      title: Text('Post'),
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
      title: Text('Close'),
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
