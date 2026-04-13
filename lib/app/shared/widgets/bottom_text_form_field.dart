import 'dart:io';

import 'package:democracy/app/shared/camera/camera.dart';
import 'package:democracy/app/shared/widgets/extras_row.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/pages/location.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/app/shared/utils/media_tools.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/constitution/view/constitution.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/post/view/widgets/post_form_widgets.dart';
import 'package:democracy/user/models/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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
    required this.onNewImages,
    required this.selectedImages,
    required this.onAddImages,
    required this.onRemoveImage,
    required this.onNewFile,
    required this.selectedFile,
    required this.onContentInsertion,
    required this.insertedContent,
    required this.onRemoveInsertedContent,
    required this.allowedMimeTypes,
    required this.onLocation,
    required this.location,
    required this.onRemoveLocation,
    required this.onSectionSelection,
    required this.section,
    required this.onRemoveSection,
    this.onSend,
    this.recipient,
    this.onImageEditingComplete,
    this.onVideoEditingComplete,
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
  final void Function(List<File>) onNewImages;
  final List<File> selectedImages;
  final void Function(List<File>) onAddImages;
  final void Function(int) onRemoveImage;
  final void Function(File) onNewFile;
  final File? selectedFile;
  final void Function(File) onContentInsertion;
  final File? insertedContent;
  final VoidCallback? onRemoveInsertedContent;
  final List<String> allowedMimeTypes;
  final void Function(LatLng) onLocation;
  final LatLng? location;
  final VoidCallback? onRemoveLocation;
  final void Function(Section) onSectionSelection;
  final Section? section;
  final VoidCallback? onRemoveSection;
  final void Function()? onSend;

  // For editors in camera
  final User? recipient;
  final void Function(File)? onImageEditingComplete;
  final void Function(File)? onVideoEditingComplete;

  @override
  State<BottomTextFormField> createState() => _BottomTextFormFieldState();
}

class _BottomTextFormFieldState extends State<BottomTextFormField>
    with TickerProviderStateMixin {
  late final AnimationController _extrasButtonAnimationController;
  late final AnimationController _extrasRowAnimationController;
  late final CurvedAnimation _extrasRowAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _extrasButtonAnimationController = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
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
    _extrasButtonAnimationController.dispose();
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
                    child: Stack(
                      children: [
                        _buildTapToOpenExtras(),
                        if (_open) Icon(Icons.close_rounded),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 6,
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
                    contentPadding: const EdgeInsets.all(15),
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
                        final directory =
                            await getApplicationDocumentsDirectory();
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
              Flexible(
                child: IconButton(
                  onPressed: widget.onSend,
                  icon: Icon(Icons.send_rounded),
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
        if (widget.insertedContent != null)
          Container(
            margin: EdgeInsets.only(top: 10),
            child: SingleImageView(
              image: widget.insertedContent!,
              onRemove: widget.onRemoveInsertedContent!,
            ),
          ),
        if (widget.selectedImages.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 10),
            child: MultiImageView(
              recipient: widget.recipient!,
              textEditingController: widget.controller,
              images: widget.selectedImages,
              onAdd: widget.onAddImages,
              onRemove: widget.onRemoveImage,
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
        if (widget.selectedFile != null)
          Container(
            margin: EdgeInsets.only(top: 10),
            child: FileWidget(
              url: widget.selectedFile!.path,
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

  Widget _buildTapToOpenExtras() {
    return AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: Matrix4.diagonal3Values(
        _open ? 0.7 : 1.0,
        _open ? 0.7 : 1.0,
        1.0,
      ),
      duration: const Duration(milliseconds: 250),
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      child: AnimatedOpacity(
        opacity: _open ? 0.0 : 1.0,
        curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
        duration: const Duration(milliseconds: 250),
        child: Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _extrasRowWidget() {
    return SizeTransition(
      sizeFactor: _extrasRowAnimation,
      child: ClipRect(
        child: Container(
          margin: EdgeInsets.only(top: 5),
          child: ExtrasRow(
            onCameraTap: () async {
              onExtrasButtonPressed();
              openCamera(
                context: context,
                recipient: widget.recipient!,
                textEditingController: widget.controller,
                onImageEditingComplete: widget.onImageEditingComplete!,
                onVideoEditingComplete: widget.onVideoEditingComplete,
              );
            },
            onGalleryTap: () async {
              onExtrasButtonPressed();
              List<File>? newImages = await ImagePickerUtil.pickMultiImage(
                limit: 4,
              );
              if (newImages.isNotEmpty) {
                widget.onNewImages(newImages);
              }
            },
            onLocationTap: () async {
              onExtrasButtonPressed();
              var status = await Permission.storage.status;
              if (!status.isGranted) {
                await Permission.storage.request();
              }
              if (mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Location(onLocation: widget.onLocation),
                  ),
                );
              }
            },
            onDocumentTap: () async {
              onExtrasButtonPressed();
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'doc', 'docx'],
              );
              if (result != null) {
                File file = File(result.files.single.path!);
                widget.onNewFile(file);
              }
            },
            onConstitutionTap: () {
              onExtrasButtonPressed();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Constitution(onSelection: widget.onSectionSelection),
                ),
              );
            },
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
  final VoidCallback onRemoveSection;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IgnorePointer(child: SectionTile(section: section)),
        ),
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

class MultiImageView extends StatelessWidget {
  const MultiImageView({
    super.key,
    required this.recipient,
    required this.textEditingController,
    required this.images,
    required this.onAdd,
    required this.onRemove,
  });

  final User? recipient;
  final TextEditingController textEditingController;
  final List<File> images;
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
        itemCount: images.length < 4 ? images.length + 1 : images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == images.length) {
            return _AddFile(
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
                List<File> newImages = await ImagePickerUtil.pickMultiImage(
                  limit: images.isEmpty ? 4 : 4 - images.length,
                );
                onAdd(newImages);
              },
            );
          } else {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                _Thumbnail(thumbnail: images[index]),
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

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.thumbnail});

  final File thumbnail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.file(
          thumbnail,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _AddFile extends StatelessWidget {
  const _AddFile({
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
