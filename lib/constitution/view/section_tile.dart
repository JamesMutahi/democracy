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
        section.isTitle
            ? Text(section.text, style: Theme.of(context).textTheme.titleMedium)
            : Text(section.text),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            Section subsection = section.subsections[index];
            return Container(
              margin: EdgeInsets.only(top: 10),
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
