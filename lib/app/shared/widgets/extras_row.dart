import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/camera/camera.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/utils/media_tools.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/user/models/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ExtrasRow extends StatelessWidget {
  const ExtrasRow({
    super.key,
    this.controller,
    this.recipient,
    this.textEditingController,
    required this.maxAssets,
    required this.onMedia,
    required this.onImageEditingComplete,
    required this.onVideoEditingComplete,
    required this.onLocation,
    required this.onDocument,
    required this.onSection,
  });

  final AnimationController? controller;
  final User? recipient;
  final TextEditingController? textEditingController;
  final int maxAssets;
  final void Function(List<File>) onMedia;
  final void Function(File) onImageEditingComplete;
  final void Function(String) onVideoEditingComplete;
  final void Function(LatLng) onLocation;
  final void Function(File) onDocument;
  final void Function(Section) onSection;

  @override
  Widget build(BuildContext context) {
    void maxAssetsReached() {
      final snackBar = getSnackBar(
        context: context,
        message: 'Only $maxMediaAssetsAllowed media files allowed at a time.',
        status: SnackBarStatus.failure,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 15.0,
        runSpacing: 5.0,
        children: <Widget>[
          _ExtraCard(
            onTap: () async {
              await controller?.reverse();
              if (maxAssets == 0) {
                maxAssetsReached();
              } else {
                if (context.mounted) {
                  openCamera(
                    context: context,
                    recipient: recipient,
                    textEditingController: textEditingController,
                    onImageEditingComplete: onImageEditingComplete,
                    onVideoEditingComplete: onVideoEditingComplete,
                  );
                }
              }
            },
            iconData: Symbols.photo_camera_rounded,
            text: 'Camera',
          ),
          _ExtraCard(
            onTap: () async {
              await controller?.reverse();
              if (maxAssets == 0) {
                maxAssetsReached();
              } else {
                if (context.mounted) {
                  openGallery(
                    context: context,
                    maxAssets: maxAssets,
                    onMedia: onMedia,
                  );
                }
              }
            },
            iconData: Symbols.photo_library_rounded,
            text: 'Gallery',
          ),
          _ExtraCard(
            onTap: () async {
              await controller?.reverse();
              var status = await Permission.storage.status;
              if (!status.isGranted) {
                await Permission.storage.request();
              }
              if (context.mounted) {
                context.router.push(Location(onLocation: onLocation));
              }
            },
            iconData: Symbols.location_on_rounded,
            text: 'Location',
          ),
          _ExtraCard(
            onTap: () async {
              await controller?.reverse();
              FilePickerResult? result = await FilePicker.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'doc', 'docx'],
              );
              if (result != null) {
                File cachedFile = File(result.files.single.path!);

                Directory directory = await getTemporaryDirectory();

                String fileName = p.basename(cachedFile.path);

                String targetPath = p.join(directory.path, fileName);

                File permanentFile = await cachedFile.copy(targetPath);

                onDocument(permanentFile);
              }
            },
            iconData: Symbols.file_present_rounded,
            text: 'Document',
          ),
          _ExtraCard(
            onTap: () async {
              await controller?.reverse();
              if (context.mounted) {
                Section? section = await context.router.push(
                  Constitution(selectionMode: true),
                );
                if (section != null) onSection(section);
              }
            },
            iconData: Symbols.book_rounded,
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
    return IconButton.filledTonal(
      onPressed: onTap,
      tooltip: text,
      padding: EdgeInsets.all(10),
      icon: Icon(iconData, size: 25),
    );
  }
}
