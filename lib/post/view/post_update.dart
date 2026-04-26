import 'dart:io';

import 'package:democracy/app/shared/camera/camera.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/app/shared/utils/media_tools.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meet/view/widgets/meeting_tile.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:democracy/post/bloc/draft_post/draft_post_bloc.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/draft_post.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:latlong2/latlong.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as p;

class PostUpdatePage extends StatefulWidget {
  const PostUpdatePage({super.key, required this.draft});

  final DraftPost draft;

  @override
  State<PostUpdatePage> createState() => _PostUpdatePageState();
}

class _PostUpdatePageState extends State<PostUpdatePage> {
  late final _controller = FlutterTaggerController();
  final ValueKey _centerKey = ValueKey('Center');

  bool _canPost = true;

  // Media state
  List<File> _media = [];
  File? _document;
  LatLng? _selectedLocation;
  Section? _selectedSection;

  @override
  void initState() {
    super.initState();
    _getData();

    final draft = widget.draft;

    // Initialize flutter tagger
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.text = draft.body;
      _controller.formatTags();
    });

    // Initialize media
    _media = [];
    _document = null;
    if (draft.location != null) _selectedLocation = draft.location;
  }

  void _getData() {
    if (widget.draft.replyTo != null) {
      context.read<ReplyToBloc>().add(
        ReplyToEvent.get(post: widget.draft.replyTo!),
      );
      context.read<ReplyToBloc>().add(
        ReplyToEvent.add(post: widget.draft.replyTo!),
      );
    }
  }

  void _createPost() {
    context.loaderOverlay.show();

    final tags = _controller.tags
        .map((tag) => {'id': tag.id, 'text': tag.text})
        .toList();

    context.read<PostCreateBloc>().add(
      PostCreateEvent.create(
        body: _controller.formattedText,
        status: PostStatus.published,
        replyTo: widget.draft.replyTo,
        repostOf: widget.draft.repostOf,
        ballot: widget.draft.ballot,
        survey: widget.draft.survey,
        petition: widget.draft.petition,
        meeting: widget.draft.meeting,
        section: _selectedSection,
        tags: tags,
        filePaths: [
          ..._media.map((m) => m.path),
          if (_document != null) _document!.path,
        ],
        location: _selectedLocation,
      ),
    );
  }

  void _deleteDraft() {
    context.read<DraftPostBloc>().add(
      DraftPostEvent.delete(draft: widget.draft),
    );
  }

  void _saveDraft() {
    context.loaderOverlay.show();

    final tags = _controller.tags
        .map((tag) => {'id': tag.id, 'text': tag.text})
        .toList();

    context.read<DraftPostBloc>().add(
      DraftPostEvent.save(
        id: widget.draft.id,
        body: _controller.formattedText,
        replyTo: widget.draft.replyTo,
        repostOf: widget.draft.repostOf,
        ballot: widget.draft.ballot,
        survey: widget.draft.survey,
        petition: widget.draft.petition,
        meeting: widget.draft.meeting,
        section: _selectedSection,
        tags: tags,
        filePaths: [
          ..._media.map((m) => m.path),
          if (_document != null) _document!.path,
        ],
        location: _selectedLocation,
      ),
    );
  }

  void _updatePostButtonState(String text) {
    bool canPost = text.trim().isNotEmpty;
    if (!canPost && widget.draft.replyTo != null) {
      canPost =
          _media.isNotEmpty ||
          _document != null ||
          _selectedLocation != null ||
          _selectedSection != null;
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
            builder: (context) => _SaveDraftDialog(onYesPressed: _saveDraft),
          );
        }
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<PostCreateBloc, PostCreateState>(
            listener: (context, state) {
              if (state.status == PostCreateStatus.success) {
                final post = state.post!;

                // Handle repost case and normal post (not a reply)
                if (widget.draft.repostOf != null ||
                    widget.draft.replyTo == null) {
                  _deleteDraft();
                  Navigator.pop(context);
                  return;
                }

                // Handle reply case - only pop if the replied-to post is NOT in the ReplyToBloc
                final replyTos = context.read<ReplyToBloc>().state.posts;
                final isReplyingToPostInReplyTos = replyTos.any(
                  (p) => p.id == post.repostOf?.id,
                );

                if (!isReplyingToPostInReplyTos) {
                  _deleteDraft();
                  Navigator.pop(context);
                }
              }
            },
          ),
          BlocListener<DraftPostBloc, DraftPostState>(
            listener: (context, state) {
              if (state is DraftSaved) {
                Navigator.pop(context);
              }
            },
          ),
        ],
        child: LoaderOverlay(
          overlayWidgetBuilder: (_) {
            return BlocBuilder<DraftPostBloc, DraftPostState>(
              builder: (context, draftPostState) {
                return BlocBuilder<PostCreateBloc, PostCreateState>(
                  builder: (context, postCreateState) {
                    return postCreateState.status == PostCreateStatus.failure ||
                            draftPostState is DraftFailure
                        ? LoaderOverlayFailure(
                            onRetry: () {
                              if (draftPostState is DraftFailure) {
                                _saveDraft();
                              } else {
                                context.read<PostCreateBloc>().add(
                                  PostCreateEvent.retry(),
                                );
                              }
                            },
                          )
                        : LoaderOverlayLoading(
                            progress: postCreateState.progress,
                          );
                  },
                );
              },
            );
          },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: _canPost
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              _SaveDraftDialog(onYesPressed: _saveDraft),
                        );
                      }
                    : null,
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
                                PostUpdateDialog(onYesPressed: _createPost),
                          );
                        }
                      : null,
                  child: Text('Post'),
                ),
              ],
              actionsPadding: EdgeInsets.only(right: 15),
            ),
            body: CustomScrollView(
              center: _centerKey,
              slivers: [
                if (widget.draft.replyTo != null)
                  ReplyTos(post: widget.draft.replyTo!),
                SliverToBoxAdapter(key: _centerKey, child: _buildPostForm()),
              ],
            ),
            bottomNavigationBar: PostBottomNavBar(
              controller: _controller,
              reply: widget.draft.replyTo,
              maxAssets: maxMediaAssetsAllowed - _media.length,
              onNewMedia: (files) {
                setState(() {
                  for (var file in files) {
                    _media.add(file);
                  }
                });
                _updatePostButtonState(_controller.formattedText);
              },
              onNewDocument: (file) {
                setState(() => _document = file);
                _updatePostButtonState(_controller.formattedText);
              },
              onLocation: (point) {
                setState(() => _selectedLocation = point);
                _updatePostButtonState(_controller.formattedText);
              },
              onNewSection: (section) {
                setState(() => _selectedSection = section);
                _updatePostButtonState(_controller.formattedText);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPostForm() {
    return Stack(
      children: [
        if (widget.draft.replyTo != null)
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
                    hintText: widget.draft.replyTo != null
                        ? 'Reply'
                        : "What's new?",
                    onChanged: _updatePostButtonState,
                    onContentInsertion: (imageFile) {
                      setState(() => _media.add(imageFile));
                    },
                  ),
                ],
              ),
              if (_media.isNotEmpty)
                DraftMediaView(
                  recipient: widget.draft.replyTo?.author,
                  textEditingController: _controller,
                  media: _media,
                  onAdd: (images) {
                    setState(() {
                      for (var image in images) {
                        _media.add(image);
                      }
                    });
                  },
                  onRemove: (index) {
                    setState(() => _media.removeAt(index));
                  },
                ),
              if (_document != null)
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FileWidget(
                    fileName: p.basename(_document!.path),
                    url: _document!.path,
                    navigateToViewer: true,
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
              if (widget.draft.repostOf != null)
                DependencyContainer(
                  child: PostTile(
                    post: widget.draft.repostOf!,
                    isDependency: true,
                  ),
                ),
              if (widget.draft.ballot != null)
                DependencyContainer(
                  child: BallotTile(
                    ballot: widget.draft.ballot!,
                    isDependency: true,
                  ),
                ),
              if (widget.draft.survey != null)
                DependencyContainer(
                  child: SurveyTile(
                    survey: widget.draft.survey!,
                    isDependency: true,
                  ),
                ),
              if (widget.draft.petition != null)
                DependencyContainer(
                  child: PetitionTile(
                    petition: widget.draft.petition!,
                    isDependency: true,
                  ),
                ),
              if (widget.draft.meeting != null)
                DependencyContainer(
                  child: MeetingTile(
                    meeting: widget.draft.meeting!,
                    isDependency: true,
                  ),
                ),
              if (widget.draft.section != null)
                SectionView(
                  section: widget.draft.section!,
                  onRemoveSection: null,
                ),
            ],
          ),
        ),
      ],
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

class DraftMediaView extends StatelessWidget {
  const DraftMediaView({
    super.key,
    required this.recipient,
    required this.textEditingController,
    required this.media,
    required this.onAdd,
    required this.onRemove,
  });

  final User? recipient;
  final TextEditingController textEditingController;
  final List<File> media;
  final void Function(List<File>) onAdd;
  final void Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: media.length < 4 ? media.length + 1 : media.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == media.length) {
            return AddFile(
              onCameraPressed: () async {
                openCamera(
                  context: context,
                  recipient: recipient,
                  textEditingController: textEditingController,
                  onImageEditingComplete: (newImage) {
                    onAdd([newImage]);
                  },
                );
              },
              onGalleryPressed: () async {
                openGallery(
                  context: context,
                  maxAssets: 1,
                  onMedia: (files) {
                    if (files.isNotEmpty) {
                      onAdd(files);
                    }
                  },
                );
              },
            );
          } else {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      media[index],
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  top: -7,
                  child: GestureDetector(
                    onTap: () {
                      onRemove(index);
                    },
                    child: const Icon(
                      Icons.highlight_remove_rounded,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
