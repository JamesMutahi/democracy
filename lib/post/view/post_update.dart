import 'dart:io';

import 'package:democracy/app/utils/bottom_text_form_field.dart';
import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/app/utils/file_widget.dart';
import 'package:democracy/app/utils/map_widget.dart';
import 'package:democracy/app/utils/media_tools.dart';
import 'package:democracy/app/utils/video_viewer.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/meet/view/meeting_tile.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostUpdate extends StatefulWidget {
  const PostUpdate({super.key, required this.post});

  final Post post;

  @override
  State<PostUpdate> createState() => _PostUpdateState();
}

class _PostUpdateState extends State<PostUpdate> {
  late final _controller = FlutterTaggerController();
  ValueKey centerKey = ValueKey('Center');
  bool _disablePostButton = false;
  List<File> files = [];
  int fileLimit = 4;
  List<File> _selectedImages = [];
  File? _selectedFile;
  File? _insertedContent;
  LatLng? _location;
  File? _selectedVideo;

  @override
  void initState() {
    if (widget.post.replyTo != null) {
      context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.post));
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.text = widget.post.body;
    });
  }

  void _updatePost({PostStatus status = PostStatus.published}) {
    List<Map> tags = [];
    for (var tag in _controller.tags) {
      tags.add({'id': tag.id, 'text': tag.text});
    }
    context.read<PostDetailBloc>().add(
      PostDetailEvent.patch(
        id: widget.post.id,
        body: _controller.formattedText,
        status: status,
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        _disablePostButton
            ? Navigator.pop(context)
            : showDialog(
                context: context,
                builder: (context) => _SaveDraftDialog(
                  onYesPressed: () => _updatePost(status: PostStatus.draft),
                ),
              );
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<PostDetailBloc, PostDetailState>(
            listener: (context, state) {
              if (state is PostPatched) {
                if (state.post.id == widget.post.id) {
                  Navigator.pop(context);
                }
              }
            },
          ),
          BlocListener<PostDetailBloc, PostDetailState>(
            listener: (context, state) {
              if (state is PostCreated) {
                var replyTos = context.read<ReplyToBloc>().state.posts;
                if (!replyTos.any((p) => p.id == state.post.repostOf?.id)) {
                  Navigator.pop(context);
                }
              }
            },
          ),
        ],
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
                              _updatePost(status: PostStatus.draft),
                        ),
                      );
              },
              icon: Icon(Symbols.close),
            ),
            title: Text('Edit post'),
            actions: [
              OutlinedButton(
                onPressed: _disablePostButton
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              PostUpdateDialog(onYesPressed: _updatePost),
                        );
                      },
                child: Text('Post'),
              ),
            ],
            actionsPadding: EdgeInsets.only(right: 15),
          ),
          body: CustomScrollView(
            center: centerKey,
            slivers: [
              ReplyTos(post: widget.post),
              SliverToBoxAdapter(
                key: centerKey,
                child: Stack(
                  children: [
                    if (widget.post.replyTo != null)
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
                              recipient: widget.post.replyTo?.author,
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
                          if (_selectedVideo != null)
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: VideoViewer(urls: [_selectedVideo!.path]),
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
                            MapWidget(mapCenter: _location!),
                          if (widget.post.repostOf != null)
                            DependencyContainer(
                              child: PostTile(
                                post: widget.post.repostOf!,
                                isDependency: true,
                              ),
                            ),
                          if (widget.post.ballot != null)
                            DependencyContainer(
                              child: BallotTile(
                                ballot: widget.post.ballot!,
                                isDependency: true,
                              ),
                            ),
                          if (widget.post.survey != null)
                            DependencyContainer(
                              child: SurveyTile(
                                survey: widget.post.survey!,
                                isDependency: true,
                              ),
                            ),
                          if (widget.post.petition != null)
                            DependencyContainer(
                              child: PetitionTile(
                                petition: widget.post.petition!,
                                isDependency: true,
                              ),
                            ),
                          if (widget.post.meeting != null)
                            DependencyContainer(
                              child: MeetingTile(
                                meeting: widget.post.meeting!,
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
            reply: widget.post.replyTo,
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
            onNewVideo: (video) {
              setState(() {
                _selectedVideo = video;
              });
            },
          ),
        ),
      ),
    );
  }
}

class PostUpdateDialog extends StatelessWidget {
  const PostUpdateDialog({super.key, required this.onYesPressed});

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
      title: 'Save',
      content:
          'Do you want to save your changes? \n'
          'You can still post at a later time.',
      button1Text: 'Yes',
      onButton1Pressed: () {
        Navigator.pop(context);
        onYesPressed();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  }
}
