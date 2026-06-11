import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:flutter/material.dart';

class BroadcastPopUpMenu extends StatelessWidget {
  const BroadcastPopUpMenu({super.key, required this.broadcast});

  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      onSelected: (selected) {
        switch (selected) {
          case 'Post':
            context.router.push(PostCreateRoute(broadcast: broadcast));
        }
      },
      borderRadius: BorderRadius.circular(50),
      itemBuilder: (BuildContext context) => [
        ...['Post'].map((text) {
          return PopupMenuItem<String>(
            value: text,
            child: Text(text, textAlign: TextAlign.center),
          );
        }),
      ],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
