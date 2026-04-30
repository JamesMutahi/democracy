import 'dart:io';

import 'package:democracy/app/shared/camera/camera.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/extras_row.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/app/shared/utils/media_tools.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class BottomTextFormField extends StatefulWidget {
  const BottomTextFormField({
    super.key,
    this.containerKey,
    required this.focusNode,
    required this.showCursor,
    required this.readOnly,
    this.autoFocus = false,
    required this.controller,
    required this.onTap,
    required this.onChanged,
    required this.hintText,
    required this.prefixIcon,
    required this.onMedia,
    required this.media,
    required this.onAddMedia,
    required this.onRemoveMedia,
    required this.onDocument,
    required this.document,
    required this.onContentInsertion,
    required this.allowedMimeTypes,
    required this.onLocation,
    required this.location,
    required this.onRemoveLocation,
    required this.onSectionSelection,
    required this.section,
    required this.onRemoveSection,
    this.recipient,
    required this.onImageEditingComplete,
    required this.onVideoEditingComplete,
    required this.showLoading,
    this.onSend,
  });

  final Key? containerKey;
  final FocusNode focusNode;
  final bool showCursor;
  final bool readOnly;
  final bool autoFocus;
  final TextEditingController controller;
  final VoidCallback onTap;
  final void Function(String) onChanged;
  final String hintText;
  final Widget? prefixIcon;
  final List<File> media;
  final void Function(List<File>) onMedia;
  final void Function(List<File>) onAddMedia;
  final void Function(File) onContentInsertion;
  final void Function(int) onRemoveMedia;
  final void Function(File) onDocument;
  final File? document;
  final List<String> allowedMimeTypes;
  final void Function(LatLng) onLocation;
  final LatLng? location;
  final VoidCallback? onRemoveLocation;
  final void Function(Section) onSectionSelection;
  final Section? section;
  final VoidCallback? onRemoveSection;

  // For editors in camera
  final User? recipient;
  final void Function(File) onImageEditingComplete;
  final void Function(String) onVideoEditingComplete;

  // To send
  final void Function()? onSend;
  final bool showLoading;

  @override
  State<BottomTextFormField> createState() => _BottomTextFormFieldState();
}

class _BottomTextFormFieldState extends State<BottomTextFormField>
    with TickerProviderStateMixin {
  late final AnimationController _extrasRowAnimationController;
  late final CurvedAnimation _extrasRowAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _extrasRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _extrasRowAnimation = CurvedAnimation(
      parent: _extrasRowAnimationController,
      curve: Curves.easeInCubic,
    );
  }

  void onExtrasButtonPressed() {
    setState(() {
      _open = !_open;
      if (_extrasRowAnimationController.value == 1) {
        _extrasRowAnimationController.reverse();
      } else {
        _extrasRowAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _extrasRowAnimationController.dispose();
    _extrasRowAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.containerKey,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).canvasColor, width: 1.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAttachments(),
          _extrasRowWidget(),
          Row(
            children: [
              GestureDetector(
                onTap: onExtrasButtonPressed,
                child: Card(
                  margin: EdgeInsets.only(left: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RotationTransition(
                      turns: Tween<double>(
                        begin: 0.0,
                        end: 0.125,
                      ).animate(_extrasRowAnimationController),
                      child: const Icon(Icons.add_rounded),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  focusNode: widget.focusNode,
                  showCursor: widget.showCursor,
                  readOnly: widget.readOnly,
                  autofocus: widget.autoFocus,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 4,
                  maxLength: 500,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(color: Theme.of(context).hintColor),
                    counterText: '',
                    prefixIcon: widget.prefixIcon,
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    prefixStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 10,
                      top: 10,
                      bottom: 10,
                    ),
                    border: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  controller: widget.controller,
                  onTap: widget.onTap,
                  onChanged: widget.onChanged,
                  contentInsertionConfiguration: ContentInsertionConfiguration(
                    allowedMimeTypes: widget.allowedMimeTypes,
                    onContentInserted: (KeyboardInsertedContent content) async {
                      if (content.hasData) {
                        final Uint8List bytes = content.data!;
                        // Get the application documents directory
                        final directory = await getTemporaryDirectory();
                        final String filePath =
                            '${directory.path}/${content.uri.split('/').last}';
                        // Write the bytes to a file
                        final File file = File(filePath);
                        await file.writeAsBytes(bytes);

                        widget.onContentInsertion(file);
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: widget.showLoading
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BottomLoader(),
                        )
                      : IconButton(
                          onPressed: widget.onSend,
                          icon: Icon(Icons.send_rounded),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttachments() {
    return Column(
      children: [
        if (widget.media.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 10),
            child: MultiMediaView(
              recipient: widget.recipient,
              textEditingController: widget.controller,
              media: widget.media,
              onAdd: widget.onAddMedia,
              onRemove: widget.onRemoveMedia,
            ),
          ),
        if (widget.location != null)
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: MapWidget(
              mapCenter: widget.location!,
              onRemove: widget.onRemoveLocation,
            ),
          ),
        if (widget.document != null)
          Container(
            margin: EdgeInsets.only(top: 10),
            child: FileWidget(
              fileName: p.basename(widget.document!.path),
              url: widget.document!.path,
              navigateToViewer: false,
            ),
          ),
        if (widget.section != null)
          SectionView(
            section: widget.section!,
            onRemoveSection: widget.onRemoveSection!,
          ),
      ],
    );
  }

  Widget _extrasRowWidget() {
    return SizeTransition(
      sizeFactor: _extrasRowAnimation,
      child: ClipRect(
        child: Container(
          margin: EdgeInsets.only(top: 5),
          child: ExtrasRow(
            controller: _extrasRowAnimationController,
            recipient: widget.recipient,
            textEditingController: widget.controller,
            maxAssets: maxMediaAssetsAllowed - widget.media.length,
            onMedia: widget.onMedia,
            onImageEditingComplete: widget.onImageEditingComplete,
            onVideoEditingComplete: widget.onVideoEditingComplete,
            onLocation: widget.onLocation,
            onDocument: widget.onDocument,
            onSection: widget.onSectionSelection,
          ),
        ),
      ),
    );
  }
}

class SectionView extends StatelessWidget {
  const SectionView({
    super.key,
    required this.section,
    required this.onRemoveSection,
  });

  final Section section;
  final VoidCallback? onRemoveSection;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 15, right: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IgnorePointer(child: SectionTile(section: section)),
        ),
        if (onRemoveSection != null)
          Positioned(
            right: 0,
            top: 6,
            child: GestureDetector(
              onTap: onRemoveSection,
              child: Icon(Icons.highlight_remove_rounded, color: Colors.red),
            ),
          ),
      ],
    );
  }
}

class MultiMediaView extends StatelessWidget {
  const MultiMediaView({
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
                  onVideoEditingComplete: (newVideo) {
                    onAdd([File(newVideo)]);
                  },
                );
              },
              onGalleryPressed: () {
                openGallery(
                  context: context,
                  maxAssets: 1,
                  onMedia: (files) {
                    if (files.isNotEmpty) {
                      onAdd([files.first]);
                    }
                  },
                );
              },
            );
          } else {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Thumbnail(thumbnail: media[index]),
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

class Thumbnail extends StatelessWidget {
  const Thumbnail({super.key, required this.thumbnail});

  final File thumbnail;

  @override
  Widget build(BuildContext context) {
    bool isVideo = checkIsVideo(thumbnail.path);

    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: isVideo
            ? Container(
                height: 150,
                width: 150,
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Center(child: Icon(Icons.play_arrow_rounded)),
              )
            : Image.file(thumbnail, height: 150, width: 150, fit: BoxFit.cover),
      ),
    );
  }
}

bool checkIsVideo(String path) {
  final videoExtensions = ['.mp4', '.mov', '.avi', '.wmv', '.mkv', '.flv'];
  final extension = p.extension(path).toLowerCase();
  return videoExtensions.contains(extension);
}

class AddFile extends StatelessWidget {
  const AddFile({
    super.key,

    required this.onCameraPressed,
    required this.onGalleryPressed,
  });

  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return MediaDialog(
              onCameraPressed: () {
                onCameraPressed();
              },
              onGalleryPressed: () {
                onGalleryPressed();
              },
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.yellow, width: 2),
        ),
        child: const Icon(Icons.add, color: Colors.yellow),
      ),
    );
  }
}
