import 'dart:async';
import 'dart:io';

import 'package:democracy/app/utils/camera/camera.dart';
import 'package:democracy/app/utils/location.dart';
import 'package:democracy/app/utils/media_tools.dart';
import 'package:democracy/app/utils/tagging.dart';
import 'package:democracy/app/utils/video_viewer.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertagger/fluttertagger.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PostAuthor extends StatelessWidget {
  const PostAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User user;
        if (state is Authenticated) {
          user = state.user;
        }
        return PostAuthorProfile(author: user, isDependency: false);
      },
    );
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

class SingleImageView extends StatelessWidget {
  const SingleImageView({
    super.key,
    required this.image,
    required this.onRemove,
  });

  final File image;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.only(right: 10, bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(image, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          right: 2,
          top: -7,
          child: GestureDetector(
            onTap: onRemove,
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
}

class PostVideoViewer extends StatelessWidget {
  const PostVideoViewer({super.key, required this.video});

  final File video;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: 10),
      child: VideoViewer(urls: [video.path]),
    );
  }
}

class PostBottomNavBar extends StatefulWidget {
  const PostBottomNavBar({
    super.key,
    required this.controller,
    required this.onPickMedia,
    required this.files,
    required this.fileLimit,
    required this.onNewImages,
    required this.onNewFile,
    required this.onLocation,
    this.reply,
    required this.onNewVideo,
  });

  final FlutterTaggerController controller;
  final VoidCallback onPickMedia;
  final List<File> files;
  final int fileLimit;
  final void Function(List<File>) onNewImages;
  final void Function(File) onNewFile;
  final void Function(LatLng) onLocation;
  final Post? reply;
  final void Function(File) onNewVideo;

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PostExtraButton(
                    onTap: () async {
                      openCamera(
                        context: context,
                        recipient: widget.reply?.author,
                        textEditingController: widget.controller,
                        onImageEditingComplete: (newImage) {
                          widget.onNewImages([newImage]);
                        },
                        onVideoEditingComplete: (video) {
                          widget.onNewVideo(video);
                        }
                      );
                    },
                    iconData: Icons.photo_camera_outlined,
                    text: 'Camera',
                  ),
                  PostExtraButton(
                    onTap: () async {
                      List<File>? newImages =
                          await ImagePickerUtil.pickMultiImage(limit: 4);
                      if (newImages.isNotEmpty) {
                        widget.onNewImages(newImages);
                      }
                    },
                    iconData: Icons.photo_library_outlined,
                    text: 'Gallery',
                  ),
                  PostExtraButton(
                    onTap: () async {
                      var status = await Permission.storage.status;
                      if (!status.isGranted) {
                        await Permission.storage.request();
                      }
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Location(onLocation: widget.onLocation),
                          ),
                        );
                      }
                    },
                    iconData: Icons.location_on_outlined,
                    text: 'Location',
                  ),
                  PostExtraButton(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf', 'doc', 'docx'],
                          );
                      if (result != null) {
                        File file = File(result.files.single.path!);
                        widget.onNewFile(file);
                      }
                    },
                    iconData: Icons.edit_document,
                    text: 'Document',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostExtraButton extends StatelessWidget {
  const PostExtraButton({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
  });

  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(iconData, size: 30),
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
