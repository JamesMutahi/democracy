import 'dart:io';

import 'package:democracy/app/shared/camera/camera.dart';
import 'package:democracy/app/shared/pages/location.dart';
import 'package:democracy/app/shared/utils/media_tools.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/constitution/view/constitution.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ExtrasRow extends StatelessWidget {
  const ExtrasRow({
    super.key,
    required this.onMedia,
    required this.onLocation,
    required this.onDocument,
    required this.onSection,
  });

  final void Function(List<File>) onMedia;
  final void Function(LatLng) onLocation;
  final void Function(File) onDocument;
  final void Function(Section) onSection;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10.0,
        runSpacing: 5.0,
        children: <Widget>[
          _ExtraCard(
            onTap: () {
              openCamera(
                context: context,
                recipient: null,
                textEditingController: null,
                onImageEditingComplete: (newImage) {
                  onMedia([newImage]);
                },
                onVideoEditingComplete: (videoPath) {
                  onMedia([File(videoPath)]);
                },
              );
            },
            iconData: Icons.photo_camera_outlined,
            text: 'Camera',
          ),
          _ExtraCard(
            onTap: () async {
              List<File>? cachedMedia = await ImagePickerUtil.pickMultipleMedia(
                limit: 4,
              );

              Directory appDocDir = await getApplicationDocumentsDirectory();

              List<File> media = [];

              for (File cachedFile in cachedMedia) {
                if (await cachedFile.exists()) {
                  String fileName = p.basename(cachedFile.path);

                  String targetPath = p.join(appDocDir.path, fileName);

                  File permanentFile = await cachedFile.copy(targetPath);
                  media.add(permanentFile);
                }
              }
              onMedia(media);
            },
            iconData: Icons.photo_library_outlined,
            text: 'Gallery',
          ),
          _ExtraCard(
            onTap: () async {
              var status = await Permission.storage.status;
              if (!status.isGranted) {
                await Permission.storage.request();
              }
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Location(onLocation: onLocation),
                  ),
                );
              }
            },
            iconData: Icons.location_on_outlined,
            text: 'Location',
          ),
          _ExtraCard(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'doc', 'docx'],
              );
              if (result != null) {
                File file = File(result.files.single.path!);
                onDocument(file);
              }
            },
            iconData: Icons.file_present_outlined,
            text: 'Document',
          ),
          _ExtraCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Constitution(onSelection: onSection),
                ),
              );
            },
            iconData: Icons.book_outlined,
            text: 'Constitution',
          ),
        ],
      ),
    );
  }
}

class _ExtraCard extends StatelessWidget {
  const _ExtraCard({
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
