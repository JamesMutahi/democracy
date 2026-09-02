import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FiltersModal extends StatelessWidget {
  const FiltersModal({
    super.key,
    required this.onApply,
    required this.onClear,
    required this.widgets,
    required this.clearButtonIsDisabled,
    required this.applyButtonIsDisabled,
  });

  final VoidCallback onApply;
  final VoidCallback onClear;
  final List<Widget> widgets;
  final bool clearButtonIsDisabled;
  final bool applyButtonIsDisabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Sort & Filter'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close_rounded),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: colorScheme.outlineVariant),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        children: widgets,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: clearButtonIsDisabled ? null : onClear,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Clear'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2, // Make Apply button wider to emphasize primary action
                child: FilledButton(
                  onPressed: applyButtonIsDisabled
                      ? null
                      : () {
                          Navigator.pop(context);
                          onApply();
                        },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Apply Filters'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateRangeFilter extends StatelessWidget {
  const DateRangeFilter({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  final DateTimeRange? initialValue;
  final void Function(DateTimeRange?) onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final now = DateTime.now();

    return FormBuilderDateRangePicker(
      name: 'Date range',
      initialValue: initialValue,
      onChanged: onChanged,
      firstDate: now,
      lastDate: DateTime(now.year + 5), // More reasonable future limit
      decoration: InputDecoration(
        labelText: 'Select Date Range',
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.calendar_today_rounded),
      ),
    );
  }
}
