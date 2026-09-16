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
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (county != null)
          GeoChip(
            icon: Icons.location_city_outlined,
            label: 'County',
            value: county!.name,
          ),
        if (constituency != null)
          GeoChip(
            icon: Icons.map_outlined,
            label: 'Constituency',
            value: constituency!.name,
          ),
        if (ward != null)
          GeoChip(
            icon: Icons.pin_drop_outlined,
            label: 'Ward',
            value: ward!.name,
          ),
      ],
    );
  }
}

class GeoChip extends StatelessWidget {
  const GeoChip({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).disabledColor.withAlpha(30),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: colorScheme.primary),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(value, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ],
      ),
    );
  }
}
