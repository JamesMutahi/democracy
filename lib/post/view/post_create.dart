import 'dart:io';

import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart'
    show SectionView, MultiMediaView;
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/meet/view/meeting_tile.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:latlong2/latlong.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as p;

class PostCreatePage extends StatefulWidget {
  const PostCreatePage({
    super.key,
    this.replyTo,
    this.repostOf,
    this.ballot,
    this.survey,
    this.petition,
    this.meeting,
    this.section,
  });

  final Post? replyTo;
  final Post? repostOf;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Meeting? meeting;
  final Section? section;

  @override
  State<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends State<PostCreatePage> {
  final _controller = FlutterTaggerController();
  final ValueKey _centerKey = const ValueKey('center');

  bool _canPost = false;

  final List<File> _media = [];
  File? _document;
  LatLng? _selectedLocation;
  Section? _selectedSection;

  @override
  void initState() {
    super.initState();
    if (widget.replyTo != null) {
      context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.replyTo!));
      context.read<ReplyToBloc>().add(ReplyToEvent.add(post: widget.replyTo!));
    }
  }

  void _createPost({PostStatus status = PostStatus.published}) {
    context.loaderOverlay.show();

    final tags = _controller.tags
        .map((tag) => {'id': tag.id, 'text': tag.text})
        .toList();
    context.read<PostCreateBloc>().add(
      PostCreateEvent.create(
        body: _controller.formattedText,
        status: status,
        replyTo: widget.replyTo,
        repostOf: widget.repostOf,
        ballot: widget.ballot,
        survey: widget.survey,
        petition: widget.petition,
        meeting: widget.meeting,
        section: widget.section ?? _selectedSection,
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
    if (!canPost && widget.replyTo != null) {
      canPost =
          _media.isNotEmpty || _document != null || _selectedLocation != null;
    }
    if (canPost != _canPost) {
      setState(() => _canPost = canPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostCreateBloc, PostCreateState>(
          listener: (context, state) {
            if (state.status == PostCreateStatus.success) {
              final post = state.post!;

              // Handle repost case and normal post (not a reply)
              if (widget.repostOf != null || widget.replyTo == null) {
                Navigator.pop(context);
                return;
              }

              // Handle reply case - only pop if the replied-to post is NOT in the ReplyToBloc
              final replyTos = context.read<ReplyToBloc>().state.posts;
              final isReplyingToPostInReplyTos = replyTos.any(
                (p) => p.id == post.repostOf?.id,
              );

              if (!isReplyingToPostInReplyTos) {
                Navigator.pop(context);
              }
            }
          },
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;

          if (!_canPost) {
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
        child: LoaderOverlay(
          overlayWidgetBuilder: (_) {
            return BlocBuilder<PostCreateBloc, PostCreateState>(
              builder: (context, state) {
                return state.status == PostCreateStatus.failure
                    ? LoaderOverlayFailure(
                        onRetry: () {
                          context.read<PostCreateBloc>().add(
                            PostCreateEvent.retry(),
                          );
                        },
                      )
                    : LoaderOverlayLoading(progress: state.progress);
              },
            );
          },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Symbols.close),
                onPressed: () {
                  if (!_canPost) {
                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => _SaveDraftDialog(
                        onYesPressed: () =>
                            _createPost(status: PostStatus.draft),
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
                if (widget.replyTo != null) ReplyTos(post: widget.replyTo!),
                SliverToBoxAdapter(key: _centerKey, child: _buildPostForm()),
              ],
            ),
            bottomNavigationBar: PostBottomNavBar(
              controller: _controller,
              reply: widget.replyTo,
              maxAssets: maxMediaAssetsAllowed - _media.length,
              onNewMedia: (images) {
                setState(() {
                  _media.addAll(images);
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
                if (widget.section == null) {
                  setState(() => _selectedSection = section);
                  _updatePostButtonState(_controller.formattedText);
                }
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
                        _media.add(imageFile);
                      });
                    },
                  ),
                ],
              ),

              // Media Previews
              if (_media.isNotEmpty)
                MultiMediaView(
                  recipient: widget.replyTo?.author,
                  textEditingController: _controller,
                  media: _media,
                  onAdd: (media) => setState(() => _media.addAll(media)),
                  onRemove: (index) => setState(() => _media.removeAt(index)),
                ),

              if (_document != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: FileWidget(
                    fileName: p.basename(_document!.path),
                    url: _document!.path,
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

              if (_selectedSection != null)
                SectionView(
                  section: _selectedSection!,
                  onRemoveSection: () =>
                      setState(() => _selectedSection = null),
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

              if (widget.section != null)
                DependencyContainer(
                  child: SectionTile(
                    section: widget.section!,
                    isDependency: true,
                  ),
                ),
            ],
          ),
        ),
      ],
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
