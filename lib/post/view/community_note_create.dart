import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:material_symbols_icons/symbols.dart';

class CommunityNoteCreate extends StatefulWidget {
  const CommunityNoteCreate({super.key, required this.post});

  final Post post;

  @override
  State<CommunityNoteCreate> createState() => _CommunityNoteCreateState();
}

class _CommunityNoteCreateState extends State<CommunityNoteCreate> {
  final _controller = FlutterTaggerController();
  bool _disablePostButton = true;
  List<Post> _replyTos = [];
  ValueKey centerKey = ValueKey('Center');

  @override
  void initState() {
    context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.post));
    super.initState();
  }

  void _createPost() {
    context.read<PostDetailBloc>().add(
      PostDetailEvent.create(
        body: _controller.text,
        status: PostStatus.published,
        communityNoteOf: widget.post,
        tags: [],
      ),
    );
  }

  void _closePage() {
    _disablePostButton
        ? Navigator.pop(context)
        : showDialog(context: context, builder: (context) => _CloseDialog());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostDetailBloc, PostDetailState>(
          listener: (context, state) {
            if (state is PostCreated) {
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<ReplyToBloc, ReplyToState>(
          listener: (context, state) {
            if (state.status == ReplyToStatus.success) {
              if (widget.post.id == state.postId) {
                setState(() {
                  _replyTos.add(widget.post);
                  _replyTos.addAll(state.posts.toList());
                });
              }
            }
          },
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          _closePage();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: _closePage,
              icon: Icon(Symbols.close),
            ),
            actions: [
              OutlinedButton(
                onPressed: _disablePostButton
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              _CreateDialog(onYesPressed: _createPost),
                        );
                      },
                child: Text('Post'),
              ),
            ],
            actionsPadding: EdgeInsets.only(right: 15),
          ),
          body: CustomScrollView(
            center: centerKey,
            slivers: <Widget>[
              PostListener(
                posts: _replyTos,
                onPostsUpdated: (posts) {
                  setState(() {
                    _replyTos = posts;
                  });
                },
                child: ReplyTos(post: widget.post),
              ),
              SliverToBoxAdapter(
                key: centerKey,
                child: Stack(
                  children: [
                    ThreadLine(showBottomThread: false, showTopThread: true),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 15,
                        top: 10,
                        bottom: 5,
                      ),
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PostAuthor(),
                            PostTextField(
                              controller: _controller,
                              hintText: "What's the note?",
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
                              onContentInsertion: (imageFile) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateDialog extends StatelessWidget {
  const _CreateDialog({required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Post',
      content: 'Are you sure you want to post this?',
      button1Text: 'Yes',
      onButton1Pressed: () {
        Navigator.pop(context);
        onYesPressed();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class _CloseDialog extends StatelessWidget {
  const _CloseDialog();

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Close',
      content:
          'Are you sure you want to close this? \n'
          'Progress is not saved',
      button1Text: 'Yes',
      onButton1Pressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
      },
    );
  }
}
