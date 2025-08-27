import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class MorePopUp extends StatelessWidget {
  const MorePopUp({super.key, required this.texts, this.onSelected});

  final List<String> texts;
  final void Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      onSelected: onSelected,
      splashRadius: 100,
      itemBuilder:
          (BuildContext context) => [
            ...texts.map((text) {
              return PopupMenuItem<String>(
                value: text,
                child: Text(text, textAlign: TextAlign.center),
              );
            }),
          ],
      child: Icon(
        Symbols.more_vert_rounded,
        color: Theme.of(context).disabledColor,
      ),
    );
  }
}
