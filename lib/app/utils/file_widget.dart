import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FileWidget extends StatelessWidget {
  const FileWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //   TODO: Open file
      },
      leading: Icon(Icons.picture_as_pdf, color: Colors.red),
      title: Text(basename(url)),
    );
  }
}
