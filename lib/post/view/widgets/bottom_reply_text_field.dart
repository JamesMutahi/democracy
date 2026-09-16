import 'dart:async';
import 'dart:io';

import 'package:democracy/app/shared/utils/custom_editing_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_text_form_field.dart';
import 'package:democracy/app/shared/widgets/tagging.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:latlong2/latlong.dart';

class BottomReplyTextField extends StatefulWidget {
  const BottomReplyTextField({super.key, required this.post});

  final Post post;

  @override
  State<BottomReplyTextField> createState() => _BottomReplyTextFieldState();
}

class _BottomReplyTextFieldState extends State<BottomReplyTextField> {
  bool _disableSendButton = true;
  List<File> _media = [];
  File? _document;
  LatLng? _location;
  Section? _selectedSection;

  final _controller = CustomEditingController();
  final _focusNode = FocusNode();
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((
      bool visible,
    ) {
      if (!visible) {
        _focusNode.unfocus();
      }
    });
  }

  @override
  void dispose() {
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
        controller: _controller,
        focusNode: _focusNode,
        position: TagPosition.top,
        child: BottomTextFormField(
          focusNode: _focusNode,
          showCursor: true,
          readOnly: false,
          controller: _controller,
          onTap: () {},
          onChanged: (value) {
            if (value.isEmpty) {
              setState(() => _disableSendButton = true);
            }
            if (value.isNotEmpty && _disableSendButton) {
              setState(() => _disableSendButton = false);
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
        ),
      ),
    );
  }

  void _createPost() {
    context.read<PostCreateBloc>().add(
      PostCreateEvent.create(
        body: _controller.text,
        status: PostStatus.published,
        replyTo: widget.post,
        filePaths: [
          ..._media.map((m) => m.path),
          if (_document != null) _document!.path,
        ],
        location: _location,
      ),
    );
  }
}
