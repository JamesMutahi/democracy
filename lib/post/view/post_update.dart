import 'dart:io';

import 'package:democracy/app/models/asset.dart' show ContentType;
import 'package:democracy/app/shared/camera/camera.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/app/shared/utils/media_tools.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meet/view/meeting_tile.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as p;

class PostUpdatePage extends StatefulWidget {
  const PostUpdatePage({super.key, required this.post});

  final Post post;

  @override
  State<PostUpdatePage> createState() => _PostUpdatePageState();
}

class _PostUpdatePageState extends State<PostUpdatePage> {
  late final _controller = FlutterTaggerController();
  ValueKey centerKey = ValueKey('Center');

  bool _canPost = true;

  // Media state
  List<String> _media = [];
  String? _document;
  LatLng? _selectedLocation;
  Section? _selectedSection;

  @override
  void initState() {
    super.initState();
    _getData();

    final post = widget.post;

    // Initialize flutter tagger
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.text = post.body;
      _controller.formatTags();
    });

    // Initialize media
    _media = post.assets
        .where((asset) => asset.contentType != ContentType.document)
        .map((asset) => asset.url)
        .toList();
    if (post.assets.any((asset) => asset.contentType == ContentType.document)) {
      _document = post.assets
          .firstWhere((asset) => asset.contentType == ContentType.document)
          .url;
    }
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
        filePaths: [..._media, ?_document],
        location: _selectedLocation,
      ),
    );
  }

  void _updatePostButtonState(String text) {
    bool canPost = text.trim().isNotEmpty;
    if (!canPost && widget.post.replyTo != null) {
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
          BlocListener<PostCreateBloc, PostCreateState>(
            listener: (context, state) {
              if (state.status == PostCreateStatus.success) {
                var replyTos = context.read<ReplyToBloc>().state.posts;
                if (!replyTos.any((p) => p.id == state.post!.repostOf?.id)) {
                  Navigator.pop(context);
                }
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: _canPost
                  ? () {
                      showDialog(
                        context: context,
                        builder: (context) => _SaveDraftDialog(
                          onYesPressed: () =>
                              _updatePost(status: PostStatus.draft),
                        ),
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
            maxAssets: maxMediaAssetsAllowed - _media.length,
            onNewMedia: (files) {
              setState(() {
                for (var file in files) {
                  _media.add(file.path);
                }
              });
              _updatePostButtonState(_controller.formattedText);
            },
            onNewDocument: (file) {
              setState(() => _document = file.path);
              _updatePostButtonState(_controller.formattedText);
            },
            onLocation: (point) {
              setState(() => _selectedLocation = point);
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
                      setState(() => _media.add(imageFile.path));
                    },
                  ),
                ],
              ),
              if (_media.isNotEmpty)
                DraftImageView(
                  recipient: widget.post.replyTo?.author,
                  textEditingController: _controller,
                  imageUrls: _media,
                  onAdd: (images) {
                    setState(() {
                      for (var image in images) {
                        _media.add(image.path);
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
                    fileName: p.basename(_document!),
                    url: _document!,
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

class DraftImageView extends StatelessWidget {
  const DraftImageView({
    super.key,
    required this.recipient,
    required this.textEditingController,
    required this.imageUrls,
    required this.onAdd,
    required this.onRemove,
  });

  final User? recipient;
  final TextEditingController textEditingController;
  final List<String> imageUrls;
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
        itemCount: imageUrls.length < 4
            ? imageUrls.length + 1
            : imageUrls.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == imageUrls.length) {
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
                    child: isNetworkImage(imageUrls[index])
                        ? Image.network(
                            imageUrls[index],
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(imageUrls[index]),
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

bool isNetworkImage(String path) {
  return Uri.tryParse(path)?.host.isNotEmpty ?? false;
}
