import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

void openGallery({
  required BuildContext context,
  required int maxAssets,
  required void Function(List<File>) onMedia,
}) async {
  final List<AssetEntity>? result = await AssetPicker.pickAssets(
    context,
    pickerConfig: AssetPickerConfig(
      maxAssets: maxAssets,
      pickerTheme: Theme.of(context),
      specialPickerType: maxAssets == 1 ? SpecialPickerType.noPreview : null,
    ),
  );
  Directory directory = await getTemporaryDirectory();

  List<File> media = [];

  if (result != null) {
    for (var r in result) {
      final cachedFile = await r.file;

      if (cachedFile != null) {
        String fileName = p.basename(cachedFile.path);

        String targetPath = p.join(directory.path, fileName);

        File permanentFile = await cachedFile.copy(targetPath);
        media.add(permanentFile);
      }
    }
  }
  onMedia(media);
  PhotoManager.clearFileCache();
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
