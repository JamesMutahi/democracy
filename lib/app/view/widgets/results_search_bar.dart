import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ResultsSearchBar extends StatelessWidget {
  const ResultsSearchBar({
    super.key,
    required this.controller,
    required this.filterCount,
    required this.filterModal,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final int filterCount;
  final Widget filterModal;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).disabledColor;
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: SearchBar(
          controller: controller,
          padding: WidgetStateProperty.all(EdgeInsets.only(left: 15)),
          leading: Icon(Symbols.search_rounded, color: color),
          trailing: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    showGeneralDialog(
                      context: context,
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return filterModal;
                      },
                    );
                  },
                  icon: Icon(Icons.tune_rounded, color: color),
                ),
                filterCount == 0
                    ? SizedBox.shrink()
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          filterCount.toString(),
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(color: color),
                        ),
                      ),
              ],
            ),
          ],
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
