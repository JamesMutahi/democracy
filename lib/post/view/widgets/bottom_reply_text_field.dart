import 'dart:async';
import 'dart:io';

import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart';
import 'package:democracy/app/shared/widgets/tagging.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:latlong2/latlong.dart';

class BottomReplyTextField extends StatefulWidget {
  const BottomReplyTextField({super.key, required this.post});

  final Post post;

  @override
  State<BottomReplyTextField> createState() => _BottomReplyTextFieldState();
}

class _BottomReplyTextFieldState extends State<BottomReplyTextField>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool _disableSendButton = true;
  List<File> _media = [];
  File? _document;
  LatLng? _location;
  Section? _selectedSection;

  final _controller = FlutterTaggerController();
  final _focusNode = FocusNode();
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _animation = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((
      bool visible,
    ) {
      if (!visible) {
        _controller.dismissOverlay();
        _focusNode.unfocus();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    _controller.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostCreateBloc, PostCreateState>(
          listener: (context, state) {
            if (state.status == PostCreateStatus.success) {
              if (state.post?.replyTo?.id == widget.post.id) {
                _controller.clear();
                setState(() {
                  _disableSendButton = true;
                  _document = null;
                  _media = [];
                  _location = null;
                  _selectedSection = null;
                });
              }
            }
          },
        ),
      ],
      child: Tagging(
        flutterTaggerController: _controller,
        animationController: _animationController,
        animation: _animation,
        builder: (context, containerKey) {
          return BottomTextFormField(
            containerKey: containerKey,
            focusNode: _focusNode,
            showCursor: true,
            readOnly: false,
            controller: _controller,
            onTap: () {},
            onChanged: (value) {
              if (value == '') {
                setState(() {
                  _disableSendButton = true;
                });
              } else {
                setState(() {
                  _disableSendButton = false;
                });
              }
            },
            hintText: 'Reply',
            prefixIcon: null,
            media: _media,
            document: _document,
            onMedia: (media) {
              setState(() => _media.addAll(media));
            },
            onAddMedia: (media) {
              setState(() => _media.addAll(media));
            },
            onRemoveMedia: (index) {
              setState(() => _media.removeAt(index));
            },
            onDocument: (file) => setState(() => _document = file),
            onContentInsertion: (imageFile) {
              setState(() => _media.add(imageFile));
            },
            allowedMimeTypes: const <String>['image/gif'],
            onLocation: (point) => setState(() => _location = point),
            location: _location,
            onRemoveLocation: () => setState(() => _location = null),
            onSectionSelection: (section) {
              setState(() => _selectedSection = section);
            },
            section: _selectedSection,
            onRemoveSection: () => setState(() => _selectedSection = null),
            onImageEditingComplete: (image) {
              setState(() {
                _media.add(image);
              });
            },
            onVideoEditingComplete: (videoPath) {
              setState(() {
                _media.add(File(videoPath));
              });
            },
            onSend:
                _disableSendButton &&
                    _document == null &&
                    _media.isEmpty &&
                    _location == null &&
                    _selectedSection == null
                ? null
                : _createPost,
          );
        },
      ),
    );
  }

  void _createPost() {
    List<Map<String, dynamic>> tags = [];
    for (var tag in _controller.tags) {
      tags.add({'id': tag.id, 'text': tag.text});
    }
    context.read<PostCreateBloc>().add(
      PostCreateEvent.create(
        body: _controller.formattedText,
        status: PostStatus.published,
        replyTo: widget.post,
        tags: tags,
        filePaths: [
          ..._media.map((m) => m.path),
          if (_document != null) _document!.path,
        ],
        location: _location,
      ),
    );
  }
}
