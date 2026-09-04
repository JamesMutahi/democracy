import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BroadcastFormWidget extends StatefulWidget {
  final BroadcastType type;
  final ValueChanged<bool> onValidityChanged;

  const BroadcastFormWidget({
    super.key,
    required this.type,
    required this.onValidityChanged,
  });

  @override
  // Made public so parents can use GlobalKey<BroadcastFormWidgetState>
  BroadcastFormWidgetState createState() => BroadcastFormWidgetState();
}

class BroadcastFormWidgetState extends State<BroadcastFormWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _titleController = TextEditingController();
  bool _setStartTime = false;

  // Expose this so the parent knows whether to pop or push to detail after creation
  bool get hasStartTime => _setStartTime;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_checkValidity);
  }

  @override
  void dispose() {
    _titleController.removeListener(_checkValidity);
    _titleController.dispose();
    super.dispose();
  }

  void _checkValidity() {
    final isValid = _titleController.text.trim().isNotEmpty;
    widget.onValidityChanged(isValid);
  }

  // Public method for the parent to trigger validation and get data
  Map<String, dynamic>? submitForm() {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return null;
    return _formKey.currentState!.value;
  }

  @override
  Widget build(BuildContext context) {
    final bool isLivestream = widget.type == BroadcastType.livestream;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What\'s this ${isLivestream ? 'stream' : 'meeting'} about?',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              isLivestream
                  ? 'Give your audience a catchy title to draw them in.'
                  : 'Set a clear title so participants know what to expect.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
            ),
            const SizedBox(height: 32),

            FormBuilderTextField(
              name: 'title',
              controller: _titleController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: isLivestream
                    ? 'e.g., Weekly Tech Talk'
                    : 'e.g., Team Sync',
                prefixIcon: const Icon(Icons.edit_outlined),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLength: 50,
              validator: FormBuilderValidators.required(
                errorText: 'Title is required',
              ),
            ),
            const SizedBox(height: 24),

            FormBuilderTextField(
              name: 'description',
              textInputAction: TextInputAction.newline,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'Add a brief description of what will be covered...',
                prefixIcon: const Icon(Icons.description_outlined),
                alignLabelWithHint: true,
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLength: 250,
            ),

            if (!isLivestream) ...[
              const SizedBox(height: 32),
              Text(
                'Scheduling',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              AnimatedCrossFade(
                firstChild: OutlinedButton.icon(
                  onPressed: () => setState(() => _setStartTime = true),
                  icon: const Icon(Icons.access_time_rounded),
                  label: const Text('Schedule for later'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                secondChild: Card(
                  elevation: 0,
                  color: colorScheme.surfaceContainerHighest,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start Time',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            TextButton.icon(
                              onPressed: () =>
                                  setState(() => _setStartTime = false),
                              icon: const Icon(Icons.close, size: 18),
                              label: const Text('Remove'),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        FormBuilderDateTimePicker(
                          name: 'startTime',
                          initialValue: DateTime.now(),
                          inputType: InputType.both,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                crossFadeState: _setStartTime
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
