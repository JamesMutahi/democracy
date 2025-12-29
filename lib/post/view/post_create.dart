import 'dart:io';

import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/app/utils/media_tools.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/meet/view/meeting_tile.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostCreate extends StatefulWidget {
  const PostCreate({
    super.key,
    this.post,
    this.ballot,
    this.survey,
    this.petition,
    this.meeting,
    this.isReply = false,
  });

  final Post? post;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Meeting? meeting;
  final bool isReply;

  @override
  State<PostCreate> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  final _controller = FlutterTaggerController();
  bool _disablePostButton = true;
  List<File> files = [];
  int fileLimit = 4;

  void _createPost({PostStatus status = PostStatus.published}) {
    List<Map> tags = [];
    for (var tag in _controller.tags) {
      tags.add({'id': tag.id, 'text': tag.text});
    }
    context.read<PostDetailBloc>().add(
      PostDetailEvent.create(
        body: _controller.formattedText,
        status: status,
        replyTo: widget.isReply ? widget.post : null,
        repostOf: widget.isReply ? null : widget.post,
        ballot: widget.ballot,
        survey: widget.survey,
        petition: widget.petition,
        meeting: widget.meeting,
        tags: tags,
      ),
    );
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
          widget.isReply
              ? Navigator.pop(context)
              : _disablePostButton
              ? Navigator.pop(context)
              : showDialog(
                  context: context,
                  builder: (context) => _SaveDraftDialog(
                    onYesPressed: () => _createPost(status: PostStatus.draft),
                  ),
                );
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                _disablePostButton
                    ? Navigator.pop(context)
                    : showDialog(
                        context: context,
                        builder: (context) => _SaveDraftDialog(
                          onYesPressed: () =>
                              _createPost(status: PostStatus.draft),
                        ),
                      );
              },
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
                              PostCreateDialog(onYesPressed: _createPost),
                        );
                      },
                child: Text(widget.isReply ? 'Reply' : 'Post'),
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
                        hintText: widget.isReply ? 'Reply' : "What's new?",
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

                  if (widget.post != null)
                    DependencyContainer(
                      child: PostWidgetSelector(
                        post: widget.post!,
                        isDependency: true,
                      ),
                    ),
                  if (widget.ballot != null)
                    DependencyContainer(
                      child: BallotTile(
                        ballot: widget.ballot!,
                        isDependency: true,
                      ),
                    ),
                  if (widget.survey != null)
                    DependencyContainer(
                      child: SurveyTile(
                        survey: widget.survey!,
                        isDependency: true,
                      ),
                    ),
                  if (widget.petition != null)
                    DependencyContainer(
                      child: PetitionTile(
                        petition: widget.petition!,
                        isDependency: true,
                      ),
                    ),
                  if (widget.meeting != null)
                    DependencyContainer(
                      child: MeetingTile(
                        meeting: widget.meeting!,
                        isDependency: true,
                      ),
                    ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: PostBottomNavBar(
            controller: _controller,
            onPickMedia: () async {
              List<File> newFiles = await ImagePickerUtil.pickMedia(
                limit: files.isEmpty ? fileLimit : fileLimit - files.length,
              );
              if (newFiles.isNotEmpty) {
                setState(() {
                  files.addAll(newFiles);
                });
              }
            },
            files: files,
            fileLimit: fileLimit,
          ),
        ),
      ),
    );
  }
}

class PostCreateDialog extends StatelessWidget {
  const PostCreateDialog({super.key, required this.onYesPressed});

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

class _SaveDraftDialog extends StatelessWidget {
  const _SaveDraftDialog({required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Save as draft',
      content:
          'Do you want to save this post as a draft? \n'
          'You can post it at a later time.',
      button1Text: 'Delete',
      onButton1Pressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      button2Text: 'Save',
      onButton2Pressed: () {
        Navigator.pop(context);
        onYesPressed();
      },
    );
  }
}
