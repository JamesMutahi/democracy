import 'dart:io';

import 'package:democracy/app/utils/bottom_text_form_field.dart'
    show MultiImageView;
import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/app/utils/media_tools.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/meet/view/meeting_tile.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
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
  List<Post> _replyTos = [];
  List<File> _selectedImages = [];
  File? _selectedFile;
  File? _insertedContent;

  @override
  void initState() {
    if (widget.isReply) {
      context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.post!));
    }
    super.initState();
  }

  bool isValidPost(String text) {
    final textWithoutLink = text.replaceAll(
      RegExp(
        r"(http|ftp|https)://([\w_-]+(?:\.[\w_-]+)+)([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?",
      ),
      "",
    );
    String textWithoutSpaces = textWithoutLink.replaceAll(RegExp(r'\s+'), '');
    // If the remaining text is empty, it was only a link
    return textWithoutSpaces.isNotEmpty;
  }

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
        communityNoteOf: null,
        ballot: widget.ballot,
        survey: widget.survey,
        petition: widget.petition,
        meeting: widget.meeting,
        tags: tags,
        imagePath1: _insertedContent != null
            ? _insertedContent!.path
            : _selectedImages.isNotEmpty
            ? _selectedImages[0].path
            : null,
        imagePath2: _selectedImages.length > 1 ? _selectedImages[1].path : null,
        imagePath3: _selectedImages.length > 2 ? _selectedImages[2].path : null,
        imagePath4: _selectedImages.length > 3 ? _selectedImages[3].path : null,
        filePath: _selectedFile?.path,
        location: null, //TODO:
      ),
    );
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
            if (state.status == ReplyToStatus.success && widget.isReply) {
              if (widget.post!.id == state.postId) {
                setState(() {
                  _replyTos.add(widget.post!);
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
                        bool hasContent = isValidPost(
                          _controller.formattedText,
                        );
                        if (hasContent) {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                PostCreateDialog(onYesPressed: _createPost),
                          );
                        } else {
                          final snackBar = getSnackBar(
                            context: context,
                            message:
                                'Add context. Unable to post links without context',
                            status: SnackBarStatus.failure,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                child: Text(widget.isReply ? 'Reply' : 'Post'),
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
                    if (widget.isReply)
                      ThreadLine(showBottomThread: false, showTopThread: true),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 15,
                        top: 10,
                        bottom: 5,
                      ),
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
                                  hintText: widget.isReply
                                      ? 'Reply'
                                      : "What's new?",
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
                                  onContentInsertion: (imageFile) {
                                    setState(() {
                                      _insertedContent = imageFile;
                                      _selectedImages = [];
                                      _selectedFile = null;
                                    });
                                  },
                                ),
                              ],
                            ),
                            if (_insertedContent != null)
                              SingleImageView(
                                image: _insertedContent!,
                                onRemove: () {
                                  setState(() {
                                    _insertedContent = null;
                                  });
                                },
                              ),
                            if (_selectedImages.isNotEmpty)
                              MultiImageView(
                                images: _selectedImages,
                                onAdd: (images) {
                                  setState(() {
                                    _selectedImages.addAll(images);
                                  });
                                },
                                onRemove: (index) {
                                  setState(() {
                                    _selectedImages.removeAt(index);
                                  });
                                },
                              ),
                            if (widget.post != null && !widget.isReply)
                              DependencyContainer(
                                child: PostTile(
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
          bottomNavigationBar: PostBottomNavBar(
            controller: _controller,
            onPickMedia: () async {
              List<File> newFiles = await ImagePickerUtil.pickMultiImage(
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
            onNewImages: (images) {
              setState(() {
                _selectedImages = images;
                _selectedFile = null;
                _insertedContent = null;
              });
            },
            onNewFile: (file) {
              setState(() {
                _selectedFile = file;
                _selectedImages = [];
                _insertedContent = null;
              });
            },
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
