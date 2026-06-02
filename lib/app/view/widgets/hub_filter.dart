import 'package:democracy/app/bloc/hub_filter/hub_filter_cubit.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HubFilters extends StatefulWidget {
  const HubFilters({
    super.key,
    required this.onHubPage,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
    required this.cubit,
  });

  final bool onHubPage;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;
  final HubFilterCubit cubit;

  @override
  State<HubFilters> createState() => _HubFiltersState();
}

class _HubFiltersState extends State<HubFilters> {
  late bool filterByRegion = widget.filterByRegion;
  late String sortBy = widget.sortBy;
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;

  bool get _isUnchanged =>
      filterByRegion == widget.filterByRegion &&
      sortBy == widget.sortBy &&
      startDate == widget.startDate &&
      endDate == widget.endDate;

  bool get _isDefaultState =>
      sortBy == 'recent' &&
      filterByRegion == true &&
      startDate == null &&
      endDate == null;

  @override
  Widget build(BuildContext context) {
    return FiltersModal(
      applyButtonIsDisabled: _isUnchanged,
      clearButtonIsDisabled: _isDefaultState,
      onApply: _applyFilters,
      onClear: _clearFilters,
      widgets: [
        FilterHeader(text: 'Sort by'),
        FormBuilderRadioGroup<String>(
          name: 'sort by',
          initialValue: sortBy,
          orientation: OptionsOrientation.vertical,
          decoration: InputDecoration(border: InputBorder.none),
          options: [
            FormBuilderFieldOption<String>(
              value: 'recent',
              child: Text('Newest first (default)'),
            ),
            FormBuilderFieldOption<String>(
              value: 'oldest',
              child: Text('Oldest first'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              sortBy = value!;
            });
          },
        ),
        FilterHeader(text: 'Filter by region'),
        FormBuilderRadioGroup<bool>(
          name: 'region',
          initialValue: filterByRegion,
          orientation: OptionsOrientation.vertical,
          decoration: InputDecoration(border: InputBorder.none),
          options: [
            FormBuilderFieldOption<bool>(value: true, child: Text('Yes')),
            FormBuilderFieldOption<bool>(value: false, child: Text('No')),
          ],
          onChanged: (value) {
            setState(() {
              filterByRegion = value!;
            });
          },
        ),
        DateRangeFilter(
          initialValue: startDate == null || endDate == null
              ? null
              : DateTimeRange(start: startDate!, end: endDate!),
          onChanged: (value) {
            setState(() {
              startDate = value?.start;
              endDate = value?.end;
            });
          },
        ),
      ],
    );
  }

  void _applyFilters() {
    widget.cubit.filtersChanged(
      onHubPage: widget.onHubPage,
      filterByRegion: filterByRegion,
      sortBy: sortBy,
      startDate: startDate,
      endDate: endDate,
    );
  }

  void _clearFilters() {
    setState(() {
      sortBy = 'recent';
      filterByRegion = true;
      startDate = null;
      endDate = null;
    });
  }
}
