import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:material_symbols_icons/symbols.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        title: const Text('Sort & Filter'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Symbols.close_rounded),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black12),
          ), // Uniform radius
        ),
        child: ListView(children: widgets),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65,
        color: Theme.of(context).cardColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _FilterButton(
                text: 'Clear',
                isDisabled: clearButtonIsDisabled,
                onPressed: onClear,
              ),
              _FilterButton(
                text: 'Apply',
                isDisabled: applyButtonIsDisabled,
                onPressed: () {
                  context.router.popTop();
                  onApply();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterHeader extends StatelessWidget {
  const FilterHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.outline,
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

  final DateTimeRange<DateTime>? initialValue;
  final void Function(DateTimeRange<DateTime>?) onChanged;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderDateRangePicker(
          name: 'Date range',
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: const InputDecoration(labelText: 'Select Date Range'),
          firstDate: now,
          lastDate: DateTime(
            now.year + 1,
            now.month,
            now.day,
            now.hour,
            now.minute,
            now.second,
            now.millisecond,
            now.microsecond,
          ),
          pickerBuilder: (context, child) {
            return Dialog(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 600,
                ),
                child: child,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.text,
    required this.isDisabled,
    required this.onPressed,
  });

  final String text;
  final bool isDisabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      child: Text(text),
    );
  }
}
