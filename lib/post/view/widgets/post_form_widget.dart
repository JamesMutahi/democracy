import 'dart:io';

import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/utils/custom_editing_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart'
    show SectionView, MultiMediaView;
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/broadcast_tile.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/post/view/widgets/reply_tos.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:path/path.dart' as p;

class PostFormData {
  final String body;
  final List<File> media;
  final File? document;
  final LatLng? location;
  final Section? section;

  PostFormData({
    required this.body,
    required this.media,
    this.document,
    this.location,
    this.section,
  });
}

class PostFormWidget extends StatefulWidget {
  final Post? replyTo;
  final Post? repostOf;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Broadcast? broadcast;
  final Section? section;
  final ValueChanged<bool> onCanPostChanged;

  const PostFormWidget({
    super.key,
    this.replyTo,
    this.repostOf,
    this.ballot,
    this.survey,
    this.petition,
    this.broadcast,
    this.section,
    required this.onCanPostChanged,
  });

  @override
  // ✅ Made public by removing the underscore
  PostFormWidgetState createState() => PostFormWidgetState();
}

// ✅ Made public by removing the underscore
class PostFormWidgetState extends State<PostFormWidget> {
  final _controller = CustomEditingController();
  final _focusNode = FocusNode();
  final ValueKey _centerKey = const ValueKey('center');

  bool _canPost = false;
  final List<File> _media = [];
  File? _document;
  LatLng? _selectedLocation;
  Section? _selectedSection;

  // ✅ Public getter for the parent to access form data
  PostFormData get formData => PostFormData(
    body: _controller.text,
    media: _media,
    document: _document,
    location: _selectedLocation,
    section: widget.section ?? _selectedSection,
  );

  void _updatePostButtonState(String text) {
    bool canPost = text.trim().isNotEmpty;
    if (!canPost && widget.replyTo != null) {
      canPost =
          _media.isNotEmpty || _document != null || _selectedLocation != null;
    }
    if (canPost != _canPost) {
      setState(() {
        _canPost = canPost;
        widget.onCanPostChanged(canPost);
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            center: _centerKey,
            slivers: [
              if (widget.replyTo != null) ReplyTos(postId: widget.replyTo!.id),
              SliverToBoxAdapter(key: _centerKey, child: _buildPostForm()),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: PostBottomNavBar(
            controller: _controller,
            reply: widget.replyTo,
            maxAssets: maxMediaAssetsAllowed - _media.length,
            onNewMedia: (images) {
              setState(() => _media.addAll(images));
              _updatePostButtonState(_controller.text);
            },
            onNewDocument: (file) {
              setState(() => _document = file);
              _updatePostButtonState(_controller.text);
            },
            onLocation: (point) {
              setState(() => _selectedLocation = point);
              _updatePostButtonState(_controller.text);
            },
            onNewSection: (section) {
              if (widget.section == null) {
                setState(() => _selectedSection = section);
                _updatePostButtonState(_controller.text);
              }
            },
          ),
        ),
      ],
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
                    focusNode: _focusNode,
                    hintText: widget.replyTo != null
                        ? 'Post your reply'
                        : "What's happening?",
                    onChanged: _updatePostButtonState,
                    onContentInsertion: (imageFile) {
                      setState(() => _media.add(imageFile));
                    },
                  ),
                ],
              ),
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
              if (widget.broadcast != null)
                DependencyContainer(
                  child: BroadcastTile(
                    broadcast: widget.broadcast!,
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
