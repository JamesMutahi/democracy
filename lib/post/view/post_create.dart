import 'dart:io';

import 'package:democracy/app/utils/bottom_text_form_field.dart'
    show MultiImageView;
import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/app/utils/file_widget.dart';
import 'package:democracy/app/utils/map_widget.dart';
import 'package:democracy/app/utils/media_tools.dart';
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
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostCreate extends StatefulWidget {
  const PostCreate({
    super.key,
    this.replyTo,
    this.repostOf,
    this.ballot,
    this.survey,
    this.petition,
    this.meeting,
  });

  final Post? replyTo;
  final Post? repostOf;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Meeting? meeting;

  @override
  State<PostCreate> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  final _controller = FlutterTaggerController();
  ValueKey centerKey = ValueKey('Center');
  bool _disablePostButton = true;
  List<File> files = [];
  int fileLimit = 4;
  List<Post> _replyTos = [];
  List<File> _selectedImages = [];
  File? _selectedFile;
  File? _insertedContent;
  LatLng? _location;

  @override
  void initState() {
    if (widget.replyTo != null) {
      context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.replyTo!));
    }
    super.initState();
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
        replyTo: widget.replyTo,
        repostOf: widget.repostOf,
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
        location: _location,
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
              if (!_replyTos.any(
                (element) => element.id == state.post.repostOf?.id,
              )) {
                Navigator.pop(context);
              }
            }
          },
        ),
        BlocListener<ReplyToBloc, ReplyToState>(
          listener: (context, state) {
            if (state.status == ReplyToStatus.success) {
              if (widget.replyTo?.id == state.postId) {
                setState(() {
                  _replyTos.add(widget.replyTo!);
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
          widget.replyTo != null
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
                child: Text(widget.replyTo != null ? 'Reply' : 'Post'),
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
                child: ReplyTos(replyTos: _replyTos),
              ),
              SliverToBoxAdapter(
                key: centerKey,
                child: Stack(
                  children: [
                    if (widget.replyTo != null)
                      ThreadLine(showBottomThread: false, showTopThread: true),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 15,
                        top: 10,
                        bottom: 5,
                      ),
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
                                hintText: widget.replyTo != null
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
                              recipient: widget.replyTo?.author,
                              textEditingController: _controller,
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
                          if (_selectedFile != null)
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: FileWidget(
                                url: _selectedFile!.path,
                                navigateToViewer: false,
                              ),
                            ),
                          if (_location != null)
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: MapWidget(
                                mapCenter: _location!,
                                onRemove: () {
                                  setState(() {
                                    _location = null;
                                  });
                                },
                              ),
                            ),
                          if (widget.repostOf != null)
                            DependencyContainer(
                              child: PostTile(
                                post: widget.repostOf!,
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
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: PostBottomNavBar(
            controller: _controller,
            reply: widget.replyTo,
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
                _insertedContent = null;
              });
            },
            onNewFile: (file) {
              setState(() {
                _selectedFile = file;
              });
            },
            onLocation: (point) {
              setState(() {
                _location = point;
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
