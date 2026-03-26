import 'dart:io';

import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:dio/dio.dart';
import 'package:docx_viewer/docx_viewer.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

final Dio _dio = Dio();

class FileWidget extends StatelessWidget {
  const FileWidget({
    super.key,
    required this.url,
    this.navigateToViewer = true,
  });

  final String url;
  final bool navigateToViewer;

  @override
  Widget build(BuildContext context) {
    String fileName = p.basename(url);
    String extension = p.extension(url).toLowerCase();
    late Icon icon;
    if (extension == '.pdf') {
      icon = Icon(Icons.picture_as_pdf, color: Colors.red);
    } else {
      icon = Icon(Icons.note, color: Colors.blue);
    }
    return ListTile(
      onTap: !navigateToViewer
          ? null
          : () async {
              // 1. Request permissions (especially for Android)
              await requestPermissions();

              // 2. Download the file
              String? path = await downloadFile(url, fileName);

              // 3. Open the file
              if (path != null) {
                final result = await OpenFile.open(path);
                if (result.type == ResultType.noAppToOpen) {
                  if (context.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(title: Text(fileName)),
                          body: DocxView(
                            filePath: path,
                            fontSize: 18,
                            onError: (error) {
                              if (context.mounted) {
                                final snackBar = getSnackBar(
                                  context: context,
                                  message: error.toString(),
                                  status: SnackBarStatus.failure,
                                );
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(snackBar);
                              }
                            },
                          ),
                        ),
                      ),
                    );
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('No app was found'),
                        content: Text(
                          'You may not have an app to open this file. This is provided when an app is not available.',
                        ),
                        actions: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                }
              } else {
                if (context.mounted) {
                  final snackBar = getSnackBar(
                    context: context,
                    message: 'File download failed',
                    status: SnackBarStatus.failure,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            },
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withAlpha(30),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Theme.of(context).colorScheme.tertiaryContainer,
      leading: icon,
      title: Text(fileName),
    );
  }
}

Future<void> requestPermissions() async {
  if (Platform.isAndroid) {
    bool isAndroid11OrAbove =
        (await Permission.manageExternalStorage.isGranted) ||
        Platform.version.contains('API 30');
    if (isAndroid11OrAbove) {
      // For Android 11 and above, request MANAGE_EXTERNAL_STORAGE permission
      var status = await Permission.manageExternalStorage.status;
      if (!status.isGranted) {
        status = await Permission.manageExternalStorage.request();
        if (status.isGranted) {
          debugPrint('Permission granted');
        } else if (status.isPermanentlyDenied) {
          openAppSettings();
        } else {
          debugPrint("Permission denied");
        }
      } else {
        debugPrint('Permission already granted');
      }
    } else {
      // For Android versions below 11, request READ/WRITE_EXTERNAL_STORAGE permissions
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
        if (status.isGranted) {
          debugPrint('Permission granted');
        } else if (status.isPermanentlyDenied) {
          openAppSettings();
        } else {
          debugPrint("Permission denied");
        }
      } else {
        debugPrint('Permission already granted');
      }
    }
  }
}

Future<String?> downloadFile(String url, String fileName) async {
  try {
    // Get the application document directory
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory() // For Android
        : await getApplicationDocumentsDirectory(); // For iOS

    final savePath = p.join(directory!.path, fileName);

    await _dio.download(
      url,
      savePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          //TODO: Use this to update a progress indicator
          debugPrint(
            'Download progress: ${(received / total * 100).toStringAsFixed(0)}%',
          );
        }
      },
    );
    return savePath;
  } catch (e) {
    debugPrint('Download error: $e');
    return null;
  }
}
