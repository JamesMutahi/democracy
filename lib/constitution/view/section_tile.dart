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
        top: 5,
        left: isDependency ? 0 : 12 * section.parentCount.toDouble(),
      ),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
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
        child: Container(
          padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          color: isHighlighted || section.id == selectedSection?.id
              ? Theme.of(context).highlightColor
              : null,
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
