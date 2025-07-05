import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class MoreVert extends StatelessWidget {
  const MoreVert({super.key, required this.children, this.onSelected});

  final List<PopupMenuEntry<String>> children;
  final void Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Symbols.more_vert_rounded,
        color: Theme.of(context).colorScheme.outline,
      ),
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => children,
    );
  }
}
