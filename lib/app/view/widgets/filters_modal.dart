import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
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
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 3.0),
          child: Text('Filters'),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Symbols.close_rounded),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 15),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black12),
          ), // Uniform radius
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ),
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
                  Navigator.pop(context);
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

class DateRangeFilter extends StatelessWidget {
  const DateRangeFilter({
    super.key,
    required this.value,
    required this.onValueChanged,
  });

  final List<DateTime?> value;
  final void Function(List<DateTime>) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Date range',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 10.0),
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.range,
          ),
          value: value,
          onValueChanged: onValueChanged,
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
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled
            ? Theme.of(context).disabledColor
            : Theme.of(context).colorScheme.tertiaryContainer,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
      child: Text(text),
    );
  }
}
