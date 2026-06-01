import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class MeetingCreate extends StatefulWidget {
  const MeetingCreate({super.key, required this.isLiveStream});

  final bool isLiveStream;

  @override
  State<MeetingCreate> createState() => _MeetingCreateState();
}

class _MeetingCreateState extends State<MeetingCreate> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  bool _setStartTime = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MeetingDetailBloc, MeetingDetailState>(
      listener: (context, state) {
        if (state is MeetingCreated) {
          context.loaderOverlay.hide();
          if (_setStartTime) {
            context.router.popTop();
          } else {
            if (state.meeting.isLiveStream) {
              context.router.push(LiveStream(meetingId: state.meeting.id));
            } else {
              context.router.push(MeetingDetail(meetingId: state.meeting.id));
            }
          }
        }
        if (state is MeetingDetailFailure) {
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
        overlayWidgetBuilder: (_) {
          return LoaderOverlayLoading(progress: '');
        },
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Text(widget.isLiveStream ? 'Live Stream' : 'Meeting'),
            actionsPadding: EdgeInsets.only(right: 15),
          ),
          body: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'title',
                    controller: _controller,
                    decoration: InputDecoration(label: Text('Title')),
                    maxLength: 50,
                    validator: FormBuilderValidators.required(
                      errorText: 'Title is required',
                    ),
                  ),
                  SizedBox(height: 15),
                  FormBuilderTextField(
                    initialValue: '',
                    name: 'description',
                    decoration: InputDecoration(label: Text('Description')),
                    maxLength: 100,
                    maxLines: 2,
                  ),
                  SizedBox(height: 15),
                  _MeetingSwitch(
                    name: 'record',
                    title: widget.isLiveStream
                        ? 'Record stream'
                        : 'Record meeting',
                  ),
                  SizedBox(height: 15),
                  if (_setStartTime && !widget.isLiveStream)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() => _setStartTime = false);
                        },
                        child: Text(
                          'Remove',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  if (!widget.isLiveStream)
                    _setStartTime
                        ? FormBuilderDateTimePicker(
                            name: 'start time',
                            initialValue: DateTime.now(),
                            decoration: InputDecoration(prefixText: 'Start:  '),
                          )
                        : OutlinedButton(
                            onPressed: () {
                              setState(() => _setStartTime = true);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.access_time_rounded),
                                SizedBox(width: 10),
                                Text('Schedule'),
                              ],
                            ),
                          ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: FilledButton.tonal(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    final formData = _formKey.currentState!.value;

    if (isValid) {
      context.loaderOverlay.show();
      context.read<MeetingDetailBloc>().add(
        MeetingDetailEvent.create(
          title: formData['title'],
          description: formData['description'],
          isRecorded: formData['record'] ?? false,
          startTime: formData['start time'],
          isLiveStream: widget.isLiveStream,
        ),
      );
      Future.delayed(Duration(seconds: 10), () {
        if (mounted) {
          context.loaderOverlay.hide();
        }
      });
    }
  }
}

class _MeetingSwitch extends StatelessWidget {
  const _MeetingSwitch({required this.name, required this.title});

  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: FormBuilderSwitch(
        name: name,
        title: Text(title),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
