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
  final ValueKey _centerKey = const ValueKey('center');

  bool _canPost = false;
  List<Post> _replyTos = [];

  // Media state
  File? _insertedImage;
  List<File> _selectedImages = [];
  File? _selectedVideo;
  File? _selectedFile;
  LatLng? _selectedLocation;

  @override
  void initState() {
    super.initState();
    if (widget.replyTo != null) {
      context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.replyTo!));
    }
  }

  void _createPost({PostStatus status = PostStatus.published}) {
    final tags = _controller.tags
        .map((tag) => {'id': tag.id, 'text': tag.text})
        .toList();

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
        imagePath1:
            _insertedImage?.path ??
            (_selectedImages.isNotEmpty ? _selectedImages[0].path : null),
        imagePath2: _selectedImages.length > 1 ? _selectedImages[1].path : null,
        imagePath3: _selectedImages.length > 2 ? _selectedImages[2].path : null,
        imagePath4: _selectedImages.length > 3 ? _selectedImages[3].path : null,
        videoPath: _selectedVideo?.path,
        filePath: _selectedFile?.path,
        location: _selectedLocation,
      ),
    );
  }

  void _updatePostButtonState(String text) {
    bool canPost = text.trim().isNotEmpty;
    if (widget.replyTo != null) {
      canPost =
          _insertedImage != null ||
          _selectedImages.isNotEmpty ||
          _selectedVideo != null ||
          _selectedFile != null ||
          _selectedLocation != null;
    }
    if (canPost != _canPost) {
      setState(() => _canPost = canPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostDetailBloc, PostDetailState>(
          listener: (context, state) {
            if (state is PostCreated) {
              if (!_replyTos.any((p) => p.id == state.post.repostOf?.id)) {
                Navigator.pop(context);
              }
            }
          },
        ),
        BlocListener<ReplyToBloc, ReplyToState>(
          listener: (context, state) {
            if (state.status == ReplyToStatus.success &&
                widget.replyTo?.id == state.postId) {
              setState(() {
                _replyTos = [widget.replyTo!, ...state.posts];
              });
            }
          },
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;

          if (widget.replyTo != null || _canPost == false) {
            Navigator.pop(context);
          } else {
            showDialog(
              context: context,
              builder: (context) => _SaveDraftDialog(
                onYesPressed: () => _createPost(status: PostStatus.draft),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Symbols.close),
              onPressed: () {
                if (widget.replyTo != null || !_canPost) {
                  Navigator.pop(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => _SaveDraftDialog(
                      onYesPressed: () => _createPost(status: PostStatus.draft),
                    ),
                  );
                }
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: OutlinedButton(
                  onPressed: _canPost
                      ? () => showDialog(
                          context: context,
                          builder: (context) =>
                              PostCreateDialog(onYesPressed: _createPost),
                        )
                      : null,
                  child: Text(widget.replyTo != null ? 'Reply' : 'Post'),
                ),
              ),
            ],
          ),
          body: CustomScrollView(
            center: _centerKey,
            slivers: [
              PostListener(
                posts: _replyTos,
                onPostsUpdated: (posts) => setState(() => _replyTos = posts),
                child: ReplyTos(replyTos: _replyTos),
              ),
              SliverToBoxAdapter(key: _centerKey, child: _buildPostForm()),
            ],
          ),
          bottomNavigationBar: PostBottomNavBar(
            controller: _controller,
            reply: widget.replyTo,
            onPickMedia: _pickImages,
            files: _selectedImages, // if needed by the bar
            fileLimit: 4,
            onNewImages: (images) {
              setState(() {
                _selectedImages = images;
                _insertedImage = null;
              });
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
            onNewVideo: (video) {
              setState(() => _selectedVideo = video);
              _updatePostButtonState(_controller.formattedText);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPostForm() {
    return Stack(
      children: [
        if (widget.replyTo != null)
          const ThreadLine(showBottomThread: false, showTopThread: true),

        Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 15,
            top: 10,
            bottom: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PostAuthor(),
                  PostTextField(
                    controller: _controller,
                    hintText: widget.replyTo != null ? 'Reply' : "What's new?",
                    onChanged: _updatePostButtonState,
                    onContentInsertion: (imageFile) {
                      setState(() {
                        _insertedImage = imageFile;
                        _selectedImages.clear();
                        _selectedFile = null;
                      });
                    },
                  ),
                ],
              ),

              // Media Previews
              if (_insertedImage != null)
                SingleImageView(
                  image: _insertedImage!,
                  onRemove: () => setState(() => _insertedImage = null),
                ),

              if (_selectedImages.isNotEmpty)
                MultiImageView(
                  recipient: widget.replyTo?.author,
                  textEditingController: _controller,
                  images: _selectedImages,
                  onAdd: (images) =>
                      setState(() => _selectedImages.addAll(images)),
                  onRemove: (index) =>
                      setState(() => _selectedImages.removeAt(index)),
                ),

              if (_selectedVideo != null)
                PostVideoViewer(video: _selectedVideo!),

              if (_selectedFile != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: FileWidget(
                    url: _selectedFile!.path,
                    navigateToViewer: false,
                  ),
                ),

              if (_selectedLocation != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MapWidget(
                    mapCenter: _selectedLocation!,
                    onRemove: () => setState(() => _selectedLocation = null),
                  ),
                ),

              // Dependencies (repost, ballot, survey, etc.)
              if (widget.repostOf != null)
                DependencyContainer(
                  child: PostTile(post: widget.repostOf!, isDependency: true),
                ),

              if (widget.ballot != null)
                DependencyContainer(
                  child: BallotTile(ballot: widget.ballot!, isDependency: true),
                ),

              if (widget.survey != null)
                DependencyContainer(
                  child: SurveyTile(survey: widget.survey!, isDependency: true),
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
      onButton2Pressed: () => Navigator.pop(context),
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
          'Do you want to save this post as a draft?\nYou can post it later.',
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
