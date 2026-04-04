import 'package:flutter/material.dart';

class ExtrasRow extends StatelessWidget {
  const ExtrasRow({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
    required this.onLocationTap,
    required this.onDocumentTap,
    required this.onConstitutionTap,
  });

  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;
  final VoidCallback onLocationTap;
  final VoidCallback onDocumentTap;
  final VoidCallback onConstitutionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _ExtraCard(
          onTap: onCameraTap,
          iconData: Icons.photo_camera_outlined,
          text: 'Camera',
        ),
        _ExtraCard(
          onTap: onGalleryTap,
          iconData: Icons.photo_library_outlined,
          text: 'Gallery',
        ),
        _ExtraCard(
          onTap: onLocationTap,
          iconData: Icons.location_on_outlined,
          text: 'Location',
        ),
        _ExtraCard(
          onTap: onDocumentTap,
          iconData: Icons.file_present_outlined,
          text: 'Document',
        ),
        _ExtraCard(
          onTap: onConstitutionTap,
          iconData: Icons.book_outlined,
          text: 'Constitution',
        ),
      ],
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
