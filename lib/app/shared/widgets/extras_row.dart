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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
        spacing: 12.0,
        runSpacing: 16.0,
        children: <Widget>[
          if (!kIsWeb)
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
              icon: 'assets/icons/camera.svg',
              text: 'Camera',
            ),
          if (!kIsWeb)
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
              icon: 'assets/icons/gallery.svg',
              text: 'Gallery',
            ),
          if (kIsWeb)
            _ExtraCard(
              onTap: () async {
                await controller?.reverse();
                if (maxAssets == 0) {
                  maxAssetsReached();
                } else {
                  FilePickerResult? result = await FilePicker.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: [
                      'jpg',
                      'jpeg',
                      'png',
                      'gif',
                      'webp',
                      'mp4',
                      'mov',
                      'mkv',
                      'avi',
                      'webm',
                    ],
                    allowMultiple: true,
                    withData: true,
                  );

                  List<PlatformFile> files = [];
                  if (result != null && result.files.isNotEmpty) {
                    if (result.files.length > maxAssets) {
                      files = result.files.sublist(0, maxAssets);
                      maxAssetsReached();
                    } else {
                      files = result.files;
                    }
                    final List<File> pickedFiles = [];
                    for (final platformFile in files) {
                      if (platformFile.bytes != null) {
                        final directory = await getTemporaryDirectory();
                        final file = File(
                          p.join(directory.path, platformFile.name),
                        );
                        await file.writeAsBytes(platformFile.bytes!);
                        pickedFiles.add(file);
                      } else if (platformFile.path != null) {
                        pickedFiles.add(File(platformFile.path!));
                      }
                    }

                    if (pickedFiles.isNotEmpty && context.mounted) {
                      onMedia(pickedFiles);
                    }
                  }
                }
              },
              icon: 'assets/icons/gallery-wide.svg',
              text: 'Media',
            ),
          if (!kIsWeb)
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
              icon: 'assets/icons/location.svg',
              text: 'Location',
            ),
          _ExtraCard(
            onTap: () async {
              await controller?.reverse();
              FilePickerResult? result = await FilePicker.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'doc', 'docx'],
                withData: kIsWeb,
              );
              if (result != null && result.files.single.path != null) {
                File cachedFile = File(result.files.single.path!);
                Directory directory = await getTemporaryDirectory();
                String fileName = p.basename(cachedFile.path);
                String targetPath = p.join(directory.path, fileName);
                File permanentFile = await cachedFile.copy(targetPath);
                onDocument(permanentFile);
              }
            },
            icon: 'assets/icons/folder.svg',
            text: 'Document',
          ),
          _ExtraCard(
            onTap: () async {
              await controller?.reverse();
              if (context.mounted) {
                Section? section;
                if (kIsWeb) {
                  section = await context.router.push(
                    ConstitutionView(selectionMode: true),
                  );
                } else {
                  section = await context.router.push(
                    ConstitutionRoute(selectionMode: true),
                  );
                }
                if (section != null) onSection(section);
              }
            },
            icon: 'assets/icons/notebook.svg',
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
    required this.icon,
    required this.text,
  });

  final VoidCallback onTap;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: !kIsWeb && responsive.isMobile
              ? _buildIcon(colorScheme)
              : _buildColumn(colorScheme),
        ),
      ),
    );
  }

  Widget _buildColumn(ColorScheme colorScheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIcon(colorScheme),
        const SizedBox(height: 6),
        Text(
          text,
          style: TextStyle(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0.2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildIcon(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        icon,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
      ),
    );
  }
}
