import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:flutter/material.dart';

class GeoChipRow extends StatelessWidget {
  const GeoChipRow({
    super.key,
    required this.county,
    required this.constituency,
    required this.ward,
  });

  final County? county;
  final Constituency? constituency;
  final Ward? ward;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (county != null) GeoChip(title: 'County', text: county!.name),
        if (constituency != null)
          GeoChip(title: 'Constituency', text: constituency!.name),
        if (ward != null) GeoChip(title: 'Ward', text: ward!.name),
      ],
    );
  }
}

class GeoChip extends StatelessWidget {
  const GeoChip({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).disabledColor.withAlpha(30),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).disabledColor,
            ),
          ),
          Text(text, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
