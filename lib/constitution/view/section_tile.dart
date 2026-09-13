import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/constitution/models/section.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = selectedSection?.id == section.id;
    final isTitle = section.isTitle;

    return Padding(
      padding: EdgeInsets.only(
        top: isDependency ? 0 : 4,
        bottom: isDependency ? 0 : 4,
        left: isDependency ? 0 : 0 + (10 * section.parentCount.toDouble()),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (isDependency) {
            context.router.push(ConstitutionRoute(sectionId: section.id));
          } else {
            onRemoveSelection?.call(section);
          }
        },
        onLongPress: () {
          if (!isDependency) {
            onSelection?.call(section);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          decoration: BoxDecoration(
            color: isHighlighted
                ? colorScheme.secondaryContainer
                : isSelected
                ? colorScheme.primaryContainer
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(color: colorScheme.primary, width: 1.5)
                : isHighlighted
                ? Border.all(color: colorScheme.secondary, width: 1.5)
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Numeral
              if (section.numeral.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 2),
                  child: Text(
                    section.numeral,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface,
                      fontSize: isTitle ? 16 : 14,
                    ),
                  ),
                ),

              // Text Content
              Expanded(
                child: Text(
                  section.text,
                  style:
                      (isTitle
                              ? Theme.of(context).textTheme.titleMedium
                              : Theme.of(context).textTheme.bodyMedium)
                          ?.copyWith(
                            fontWeight: isTitle
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: isSelected
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.onSurface,
                            height: 1.4,
                          ),
                ),
              ),

              if (isSelected) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.check_circle_rounded,
                  color: colorScheme.primary,
                  size: 24,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
