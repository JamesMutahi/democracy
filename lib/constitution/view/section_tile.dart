import 'package:democracy/constitution/models/section.dart';
import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  const SectionTile({super.key, required this.section});

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (section.numeral.isNotEmpty)
              Text(
                '${section.numeral} ',
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
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            Section subsection = section.subsections[index];
            return Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: section.isTitle ? 0 : 15),
              child: SectionTile(
                key: ValueKey(subsection.id),
                section: subsection,
              ),
            );
          },
          itemCount: section.subsections.length,
        ),
      ],
    );
  }
}
