import 'dart:async';
import 'dart:io';

import 'package:democracy/app/shared/utils/custom_editing_controller.dart';
import 'package:democracy/app/shared/widgets/extras_row.dart';
import 'package:democracy/app/shared/widgets/tagging.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';

class PostAuthor extends StatelessWidget {
  const PostAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final me = authBloc.state.user!;
    return PostAuthorProfile(author: me, isDependency: false);
  }
}

class PostTextField extends StatelessWidget {
  const PostTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.onChanged,
    required this.onContentInsertion,
  });

  final CustomEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final void Function(String) onChanged;
  final void Function(File) onContentInsertion;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Flexible(
      flex: 9,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Tagging(
          controller: controller,
          focusNode: focusNode,
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            autofocus: true,
            // onTapOutside: (event) {
            //   FocusScope.of(context).unfocus();
            // },
            minLines: 1,
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            maxLength: 500,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest,
              hintText: hintText,
              hintStyle: TextStyle(color: Theme.of(context).hintColor),
              prefixIcon: null,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              prefixStyle: TextStyle(color: theme.primaryColor),
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hoverColor: Colors.transparent,
            ),
            contentInsertionConfiguration: ContentInsertionConfiguration(
              allowedMimeTypes: const <String>['image/gif'],
              onContentInserted: (KeyboardInsertedContent content) async {
                if (content.hasData) {
                  final Uint8List bytes = content.data!;
                  // Get the application documents directory
                  final directory = await getApplicationDocumentsDirectory();
                  final String filePath =
                      '${directory.path}/${content.uri.split('/').last}';
                  // Write the bytes to a file
                  final File file = File(filePath);
                  await file.writeAsBytes(bytes);

                  onContentInsertion(file);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PostBottomNavBar extends StatefulWidget {
  const PostBottomNavBar({
    super.key,
    required this.controller,
    required this.maxAssets,
    required this.onNewMedia,
    required this.onNewDocument,
    required this.onLocation,
    this.reply,
    required this.onNewSection,
  });

  final CustomEditingController controller;
  final int maxAssets;
  final void Function(List<File>) onNewMedia;
  final void Function(File) onNewDocument;
  final void Function(LatLng) onLocation;
  final Post? reply;
  final void Function(Section) onNewSection;

  @override
  State<PostBottomNavBar> createState() => _PostBottomNavBarState();
}

class _PostBottomNavBarState extends State<PostBottomNavBar>
    with TickerProviderStateMixin {
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((
      bool visible,
    ) {
      if (!visible) {
        //   Dismiss overlay
      }
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ExtrasRow(
              maxAssets: widget.maxAssets,
              textEditingController: widget.controller,
              onMedia: widget.onNewMedia,
              onLocation: widget.onLocation,
              onDocument: widget.onNewDocument,
              onSection: widget.onNewSection,
              onImageEditingComplete: (file) {
                widget.onNewMedia([file]);
              },
              onVideoEditingComplete: (path) {
                widget.onNewMedia([File(path)]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
