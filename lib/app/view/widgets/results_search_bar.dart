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
    Color color = Theme.of(context).colorScheme.outline;
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 15),
        height: 50,
        child: SearchBar(
          controller: controller,
          padding: WidgetStateProperty.all(EdgeInsets.only(left: 15)),
          leading: Icon(
            Symbols.search_rounded,
            color: Theme.of(context).colorScheme.outline,
            size: 20,
          ),
          trailing: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      shape: const BeveledRectangleBorder(),
                      useSafeArea: true,
                      builder: (context) {
                        return filterModal;
                      },
                    );
                  },
                  icon: Icon(Symbols.tune_rounded, color: color),
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
