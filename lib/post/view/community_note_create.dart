import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class CommunityNoteCreate extends StatefulWidget {
  const CommunityNoteCreate({super.key, required this.post});

  final Post post;

  @override
  State<CommunityNoteCreate> createState() => _CommunityNoteCreateState();
}

class _CommunityNoteCreateState extends State<CommunityNoteCreate> {
  final _controller = TextEditingController();
  bool _disablePostButton = true;
  List<Post> _replyTos = [];

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
        replyTo: null,
        communityNoteOf: widget.post,
        repostOf: null,
        ballot: null,
        survey: null,
        petition: null,
        meeting: null,
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
            reverse: true,
            slivers: <Widget>[
              SliverFillRemaining(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: PostListener(
                  posts: _replyTos,
                  onPostsUpdated: (posts) {
                    setState(() {
                      _replyTos = posts;
                    });
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      Post post = _replyTos[index];
                      return PostWidgetSelector(
                        key: ValueKey(post.id),
                        post: post,
                        showTopThread:
                            post.replyTo != null ||
                            post.communityNoteOf != null,
                        showBottomThread: true,
                        hideBorder: true,
                      );
                    },
                    itemCount: _replyTos.length,
                  ),
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
