import 'dart:async';
import 'dart:io';

import 'package:democracy/app/shared/constants/regex.dart';
import 'package:democracy/app/shared/widgets/extras_row.dart';
import 'package:democracy/app/shared/widgets/tagging.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertagger/fluttertagger.dart';
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
    required this.hintText,
    required this.onChanged,
    required this.onContentInsertion,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String) onChanged;
  final void Function(File) onContentInsertion;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 9,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          autofocus: true,
          // onTapOutside: (event) {
          //   FocusScope.of(context).unfocus();
          // },
          minLines: 1,
          maxLines: 7,
          keyboardType: TextInputType.multiline,
          maxLength: 500,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).hintColor),
            prefixIcon: null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            prefixStyle: TextStyle(color: Theme.of(context).primaryColor),
            contentPadding: const EdgeInsets.all(15),
            border: InputBorder.none,
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

  final FlutterTaggerController controller;
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
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  double overlayHeight = 1;
  SearchResultView _view = SearchResultView.none;

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
        widget.controller.dismissOverlay();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.controller.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  void changeOverlayHeight(int length) {
    if (length == 0) {
      overlayHeight = 1;
    }
    if (length == 1) {
      overlayHeight = 75;
    }
    if (length == 2) {
      overlayHeight = 150;
    }
    if (length == 3) {
      overlayHeight = 225;
    }
    if (length > 3) {
      overlayHeight = 300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UsersBloc, UsersState>(
          listener: (context, state) {
            if (state.status == UsersStatus.success) {
              setState(() {
                _view = SearchResultView.users;
                changeOverlayHeight(state.users.length);
              });
            }
          },
        ),
      ],
      child: FlutterTagger(
        searchRegex: searchRegex,
        triggerStrategy: TriggerStrategy.eager,
        controller: widget.controller,
        animationController: _animationController,
        onSearch: (query, triggerChar) {
          if (triggerChar == "@") {
            setState(() {
              _view = SearchResultView.users;
            });
            context.read<UsersBloc>().add(UsersEvent.get(searchTerm: query));
          }
          if (triggerChar == "#") {
            setState(() {
              _view = SearchResultView.hashtag;
            });
          }
        },
        triggerCharacterAndStyles: const {
          "@": TextStyle(color: Colors.blueAccent),
        },
        tagTextFormatter: (id, tag, triggerCharacter) {
          return "$triggerCharacter$id#$tag#";
        },
        overlayHeight: overlayHeight,
        overlay: _view == SearchResultView.users
            ? UserListView(
                tagController: widget.controller,
                animation: _animation,
              )
            : SizedBox.shrink(),
        builder: (context, containerKey) {
          return Container(
            key: containerKey,
            color: Theme.of(context).canvasColor,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: ExtrasRow(
                    maxAssets: widget.maxAssets,
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
        },
      ),
    );
  }
}
