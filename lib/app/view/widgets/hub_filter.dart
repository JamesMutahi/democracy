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
        _buildSection(
          title: 'Sort by',
          child: FormBuilderRadioGroup<String>(
            key: ValueKey('sortBy_$sortBy'),
            name: 'sort by',
            initialValue: sortBy,
            orientation: OptionsOrientation.vertical,
            decoration: const InputDecoration(border: InputBorder.none),
            options: const [
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
              if (value != null) setState(() => sortBy = value);
            },
          ),
        ),
        _buildSection(
          title: 'Filter by region',
          child: FormBuilderRadioGroup<bool>(
            key: ValueKey('region_$filterByRegion'),
            name: 'region',
            initialValue: filterByRegion,
            orientation: OptionsOrientation.vertical,
            decoration: const InputDecoration(border: InputBorder.none),
            options: const [
              FormBuilderFieldOption<bool>(
                value: true,
                child: Text('Yes (default)'),
              ),
              FormBuilderFieldOption<bool>(value: false, child: Text('No')),
            ],
            onChanged: (value) {
              if (value != null) setState(() => filterByRegion = value);
            },
          ),
        ),
        _buildSection(
          title: 'Date Range',
          child: DateRangeFilter(
            key: ValueKey('dateRange_${startDate}_$endDate'),
            initialValue: (startDate != null && endDate != null)
                ? DateTimeRange(start: startDate!, end: endDate!)
                : null,
            onChanged: (value) {
              setState(() {
                startDate = value?.start;
                endDate = value?.end;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
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
      sortBy = defaultSortBy;
      filterByRegion = defaultFilterByRegion;
      startDate = defaultStartDate;
      endDate = defaultEndDate;
    });
  }
}
