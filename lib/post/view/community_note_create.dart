import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
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
    return BlocListener<PostDetailBloc, PostDetailState>(
      listener: (context, state) {
        if (state is PostCreated) {
          Navigator.pop(context);
        }
      },
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
                      PostAuthor(),
                      PostTextField(
                        controller: _controller,
                        hintText: "What's new?",
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
                  DependencyContainer(
                    child: PostWidgetSelector(
                      post: widget.post,
                      isDependency: true,
                    ),
                  ),
                ],
              ),
            ),
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
