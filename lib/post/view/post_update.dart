import 'dart:io';

import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/app/shared/utils/media_tools.dart';
import 'package:democracy/app/shared/widgets/video_viewer.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/constitution/models/section.dart';
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

class PostUpdatePage extends StatefulWidget {
  const PostUpdatePage({super.key, required this.post});

  final Post post;

  @override
  State<PostUpdatePage> createState() => _PostUpdatePageState();
}

class _PostUpdatePageState extends State<PostUpdatePage> {
  late final _controller = FlutterTaggerController(text: widget.post.body);
  ValueKey centerKey = ValueKey('Center');

  bool _canPost = true;

  // Media state
  List<File> _selectedImages = [];
  String? _selectedVideoPath;
  File? _selectedFile;
  LatLng? _selectedLocation;
  Section? _selectedSection;

  @override
  void initState() {
    super.initState();
    _getData();

    _controller.formatTags();

    final post = widget.post;
    // Initialize media (cleaner way)
    _selectedImages = [
      if (post.image1Url != null) File.fromUri(Uri.parse(post.image1Url!)),
      if (post.image2Url != null) File.fromUri(Uri.parse(post.image2Url!)),
      if (post.image3Url != null) File.fromUri(Uri.parse(post.image3Url!)),
      if (post.image4Url != null) File.fromUri(Uri.parse(post.image4Url!)),
    ].where((f) => f.path.isNotEmpty).toList();

    if (post.videoUrl != null) _selectedVideoPath = post.videoUrl;
    if (post.location != null) _selectedLocation = post.location;
  }

  void _getData() {
    if (widget.post.replyTo != null) {
      context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.post));
    }
  }

  void _updatePost({PostStatus status = PostStatus.published}) {
    List<Map<String, dynamic>> tags = [];
    for (var tag in _controller.tags) {
      tags.add({'id': tag.id, 'text': tag.text});
    }
    context.read<PostDetailBloc>().add(
      PostDetailEvent.patch(
        id: widget.post.id,
        body: _controller.formattedText,
        status: status,
        replyTo: widget.post.replyTo,
        repostOf: widget.post.repostOf,
        ballot: widget.post.ballot,
        survey: widget.post.survey,
        petition: widget.post.petition,
        meeting: widget.post.meeting,
        section: _selectedSection,
        tags: tags,
        imagePath1: _selectedImages.isNotEmpty ? _selectedImages[0].path : null,
        imagePath2: _selectedImages.length > 1 ? _selectedImages[1].path : null,
        imagePath3: _selectedImages.length > 2 ? _selectedImages[2].path : null,
        imagePath4: _selectedImages.length > 3 ? _selectedImages[3].path : null,
        videoPath: _selectedVideoPath,
        filePath: _selectedFile?.path,
        location: _selectedLocation,
      ),
    );
  }

  void _updatePostButtonState(String text) {
    bool canPost = text.trim().isNotEmpty;
    if (!canPost && widget.post.replyTo != null) {
      canPost =
          _selectedImages.isNotEmpty ||
          _selectedVideoPath != null ||
          _selectedFile != null ||
          _selectedLocation != null;
    }
    if (canPost != _canPost) {
      setState(() => _canPost = canPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;

        if (!_canPost) {
          Navigator.pop(context);
        } else {
          showDialog(
            context: context,
            builder: (context) => _SaveDraftDialog(
              onYesPressed: () => _updatePost(status: PostStatus.draft),
            ),
          );
        }
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
                _canPost
                    ? showDialog(
                        context: context,
                        builder: (context) => _SaveDraftDialog(
                          onYesPressed: () =>
                              _updatePost(status: PostStatus.draft),
                        ),
                      )
                    : null;
              },
              icon: Icon(Symbols.close),
            ),
            title: Text('Edit post'),
            actions: [
              OutlinedButton(
                onPressed: _canPost
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              PostUpdateDialog(onYesPressed: _updatePost),
                        );
                      }
                    : null,
                child: Text('Post'),
              ),
            ],
            actionsPadding: EdgeInsets.only(right: 15),
          ),
          body: CustomScrollView(
            center: centerKey,
            slivers: [
              if (widget.post.replyTo != null) ReplyTos(post: widget.post),
              SliverToBoxAdapter(key: centerKey, child: _buildPostForm()),
            ],
          ),
          bottomNavigationBar: PostBottomNavBar(
            controller: _controller,
            reply: widget.post.replyTo,
            onPickMedia: _pickImages,
            files: _selectedImages, // if needed by the bar
            fileLimit: 4,
            onNewImages: (images) {
              setState(() => _selectedImages = images);
              _updatePostButtonState(_controller.formattedText);
            },
            onNewFile: (file) {
              setState(() => _selectedFile = file);
              _updatePostButtonState(_controller.formattedText);
            },
            onLocation: (point) {
              setState(() => _selectedLocation = point);
              _updatePostButtonState(_controller.formattedText);
            },
            onNewVideo: (videoPath) {
              setState(() => _selectedVideoPath = videoPath);
              _updatePostButtonState(_controller.formattedText);
            },
            onNewSection: (section) {
              if (widget.post.section == null) {
                setState(() => _selectedSection = section);
                _updatePostButtonState(_controller.formattedText);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPostForm() {
    return Stack(
      children: [
        if (widget.post.replyTo != null)
          ThreadLine(showBottomThread: false, showTopThread: true),
        Container(
          padding: EdgeInsets.only(left: 10, right: 15, top: 10, bottom: 5),
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
                    hintText: widget.post.replyTo != null
                        ? 'Reply'
                        : "What's new?",
                    onChanged: _updatePostButtonState,
                    onContentInsertion: (imageFile) {
                      setState(() => _selectedImages.add(imageFile));
                    },
                  ),
                ],
              ),
              if (_selectedImages.isNotEmpty)
                MultiImageView(
                  recipient: widget.post.replyTo?.author,
                  textEditingController: _controller,
                  images: _selectedImages,
                  onAdd: (images) {
                    setState(() => _selectedImages.addAll(images));
                  },
                  onRemove: (index) {
                    setState(() => _selectedImages.removeAt(index));
                  },
                ),
              if (_selectedVideoPath != null)
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: VideoViewer(urls: [_selectedVideoPath!]),
                ),
              if (_selectedFile != null)
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FileWidget(
                    url: _selectedFile!.path,
                    navigateToViewer: false,
                  ),
                ),
              if (_selectedLocation != null)
                MapWidget(mapCenter: _selectedLocation!),
              if (_selectedSection != null)
                SectionView(
                  section: _selectedSection!,
                  onRemoveSection: () =>
                      setState(() => _selectedSection = null),
                ),
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
              if (widget.post.section != null)
                SectionView(
                  section: widget.post.section!,
                  onRemoveSection: null,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _pickImages() async {
    final newImages = await ImagePickerUtil.pickMultiImage(
      limit: 4 - _selectedImages.length,
    );
    if (newImages.isNotEmpty) {
      setState(() => _selectedImages.addAll(newImages));
    }
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
