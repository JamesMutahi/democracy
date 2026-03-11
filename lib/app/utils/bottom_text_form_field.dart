import 'dart:io';

import 'package:democracy/app/utils/media_tools.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'custom_bottom_sheet.dart';

class BottomTextFormField extends StatelessWidget {
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
    required this.onNewFile,
    required this.selectedFile,
    required this.onContentInsertion,
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
  final void Function(List<File>) onNewImages;
  final List<File> selectedImages;
  final void Function(File) onNewFile;
  final File? selectedFile;
  final void Function(File) onContentInsertion;
  final void Function()? onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: containerKey,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).canvasColor, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          if (selectedImages.isEmpty)
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: const BeveledRectangleBorder(),
                  useSafeArea: true,
                  builder: (BuildContext context) {
                    return _FileBottomSheet(
                      onNewImages: onNewImages,
                      onNewFile: onNewFile,
                    );
                  },
                );
              },
              child: Card(
                margin: EdgeInsets.only(left: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.add_rounded),
                ),
              ),
            ),
          Flexible(
            flex: 6,
            child: TextFormField(
              focusNode: focusNode,
              showCursor: showCursor,
              readOnly: readOnly,
              autofocus: autoFocus,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 4,
              maxLength: 500,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                hintText: hintText,
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                counterText: '',
                prefixIcon: prefixIcon,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                prefixStyle: TextStyle(color: Theme.of(context).primaryColor),
                contentPadding: const EdgeInsets.all(15),
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              controller: controller,
              onTap: onTap,
              onChanged: onChanged,
              contentInsertionConfiguration: ContentInsertionConfiguration(
                allowedMimeTypes: const <String>['image/png', 'image/gif'],
                onContentInserted: (KeyboardInsertedContent content) async {
                  if (content.hasData) {
                    final Uint8List bytes = content.data!;
                    final String mimeType = content.mimeType;
                    // Determine file extension from mime type (basic example)
                    final String extension = mimeType.split('/').last;

                    // Get the application documents directory
                    final directory = await getApplicationDocumentsDirectory();
                    final String filePath =
                        '${directory.path}/inserted_content.$extension';

                    // Write the bytes to a file
                    final File file = File(filePath);
                    await file.writeAsBytes(bytes);

                    onContentInsertion(file);
                  }
                },
              ),
            ),
          ),
          Flexible(
            child: IconButton(
              onPressed: onSend,
              icon: Icon(Icons.send_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

class _FileBottomSheet extends StatelessWidget {
  const _FileBottomSheet({required this.onNewImages, required this.onNewFile});

  final void Function(List<File>) onNewImages;
  final void Function(File) onNewFile;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'Add file',
      children: [
        Row(
          children: [
            _FileCard(
              onTap: () async {
                Navigator.pop(context);
                File? newImage = await ImagePickerUtil.takePhoto();
                if (newImage != null) {
                  onNewImages([newImage]);
                }
              },
              iconData: Icons.photo_camera_outlined,
              text: 'Camera',
            ),
            SizedBox(width: 20),
            _FileCard(
              onTap: () async {
                Navigator.pop(context);
                List<File>? newImages = await ImagePickerUtil.pickMultiImage(
                  limit: 4,
                );
                if (newImages.isNotEmpty) {
                  onNewImages(newImages);
                }
              },
              iconData: Icons.photo_library_outlined,
              text: 'Gallery',
            ),
            SizedBox(width: 20),
            _FileCard(
              onTap: () {
                Navigator.pop(context);
                // TODO:
              },
              iconData: Icons.location_on_outlined,
              text: 'Location',
            ),
            SizedBox(width: 20),
            _FileCard(
              onTap: () async {
                Navigator.pop(context);
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'doc'],
                );
                if (result != null) {
                  File file = File(result.files.single.path!);
                  onNewFile(file);
                }
              },
              iconData: Icons.edit_document,
              text: 'Document',
            ),
          ],
        ),
      ],
    );
  }
}

class _FileCard extends StatelessWidget {
  const _FileCard({
    required this.onTap,
    required this.iconData,
    required this.text,
  });

  final VoidCallback onTap;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
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

class MultiImageView extends StatelessWidget {
  const MultiImageView({
    super.key,
    required this.images,
    required this.onAdd,
    required this.onRemove,
  });

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
                File? newImage = await ImagePickerUtil.takePhoto();
                if (newImage != null) {
                  onAdd([newImage]);
                }
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
