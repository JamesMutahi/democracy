import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class BroadcastCreate extends StatefulWidget {
  const BroadcastCreate({super.key, @QueryParam('type') this.type = 'meeting'});

  final String type;

  @override
  State<BroadcastCreate> createState() => _BroadcastCreateState();
}

class _BroadcastCreateState extends State<BroadcastCreate> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _titleController = TextEditingController();
  bool _setStartTime = false;
  late BroadcastType _type;

  @override
  void initState() {
    super.initState();
    try {
      _type = const BroadcastTypeConverter().fromJson(widget.type);
    } catch (e) {
      _type = BroadcastType.meeting;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLivestream = _type == BroadcastType.livestream;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<BroadcastDetailBloc, BroadcastDetailState>(
      listener: (context, state) {
        if (state is BroadcastCreated) {
          context.loaderOverlay.hide();
          if (_setStartTime) {
            context.router.popTop();
          } else {
            switch (state.broadcast.type) {
              case BroadcastType.meeting:
                context.router.popAndPush(
                  MeetingDetail(broadcastId: state.broadcast.id),
                );
              case BroadcastType.livestream:
                context.router.popAndPush(
                  LiveStream(broadcastId: state.broadcast.id),
                );
            }
          }
        }
        if (state is BroadcastDetailFailure) {
          context.loaderOverlay.hide();
          final snackBar = getSnackBar(
            context: context,
            message: state.error,
            status: SnackBarStatus.failure,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: LoaderOverlay(
        overlayWidgetBuilder: (_) => const LoaderOverlayLoading(progress: ''),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              isLivestream ? 'Start a Live Stream' : 'Create a Meeting',
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    'What\'s this ${isLivestream ? 'stream' : 'meeting'} about?',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isLivestream
                        ? 'Give your audience a catchy title to draw them in.'
                        : 'Set a clear title so participants know what to expect.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title Field
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

                  // Description Field
                  FormBuilderTextField(
                    name: 'description',
                    textInputAction: TextInputAction.newline,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Description (Optional)',
                      hintText:
                          'Add a brief description of what will be covered...',
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

                  // Schedule Section (Meetings only)
                  if (!isLivestream) ...[
                    const SizedBox(height: 32),
                    Text(
                      'Scheduling',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Start Time',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall,
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
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
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
          ),

          // Smart Submit Button
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _titleController,
              builder: (context, value, child) {
                final isValid = value.text.trim().isNotEmpty;
                return FilledButton.icon(
                  onPressed: isValid ? _submitForm : null,
                  icon: Icon(
                    isLivestream
                        ? Icons.videocam_rounded
                        : Icons.calendar_today,
                  ),
                  label: Text(isLivestream ? 'Go Live Now' : 'Create Meeting'),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    final formData = _formKey.currentState!.value;

    context.loaderOverlay.show();
    context.read<BroadcastDetailBloc>().add(
      BroadcastDetailEvent.create(
        type: _type,
        title: formData['title'],
        description: formData['description'] ?? '',
        startTime: formData['startTime'],
      ),
    );

    // Safety timeout fallback
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        context.loaderOverlay.hide();
      }
    });
  }
}
