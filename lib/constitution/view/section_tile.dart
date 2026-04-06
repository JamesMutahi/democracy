import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/constitution/view/constitution.dart';
import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  const SectionTile({
    super.key,
    required this.section,
    this.selectedSection,
    this.onSelection,
    this.onRemoveSelection,
    this.isDependency = false,
    this.isHighlighted = false,
  });

  final Section section;
  final Section? selectedSection;
  final void Function(Section)? onSelection;
  final void Function(Section)? onRemoveSelection;
  final bool isDependency;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: isDependency ? 0 : 5,
        left: isDependency ? 0 : 12 * section.parentCount.toDouble(),
      ),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          if (isDependency) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Constitution(centeredSection: section),
              ),
            );
          } else {
            onRemoveSelection!(section);
          }
        },
        onLongPress: () {
          if (!isDependency) {
            onSelection!(section);
          }
        },
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 300),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isHighlighted || section.id == selectedSection?.id
                ? Theme.of(context).colorScheme.primaryContainer
                : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (section.numeral.isNotEmpty)
                    Text(
                      '${section.numeral}  ',
                      style: section.isTitle
                          ? Theme.of(context).textTheme.titleMedium
                          : null,
                    ),
                  Expanded(
                    child: Text(
                      '${section.text} ',
                      style: section.isTitle
                          ? Theme.of(context).textTheme.titleMedium
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
