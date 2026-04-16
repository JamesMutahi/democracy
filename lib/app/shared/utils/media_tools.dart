import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> getImage() async {
    final pickedFile = await _picker.pickImage(
      imageQuality: 100,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  // static Future<File?> takePhoto() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.camera);
  //   if (pickedFile != null) {
  //     return File(pickedFile.path);
  //   }
  //   return null;
  // }

  static Future<List<File>> pickMultiImage({required int limit}) async {
    final pickedFiles = await _picker.pickMultiImage(
      imageQuality: 100,
      limit: limit,
    );
    if (pickedFiles.isNotEmpty) {
      return pickedFiles.map((xFile) => File(xFile.path)).toList();
    }
    return [];
  }
}

class MediaDialog extends StatelessWidget {
  const MediaDialog({
    super.key,
    required this.onCameraPressed,
    required this.onGalleryPressed,
  });

  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Take from:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              onCameraPressed();
            },
            leading: Icon(Icons.photo_camera_outlined, size: 30),
            title: Text('Camera'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              onGalleryPressed();
            },
            leading: Icon(Icons.photo_library_outlined, size: 30),
            title: Text('Gallery'),
          ),
        ],
      ),
    );
  }
}
