import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/view/live_stream.dart';
import 'package:democracy/meeting/view/meeting_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

void navigateToMeetingCreationPage({
  required BuildContext context,
  required bool isLiveStream,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MeetingCreate(isLiveStream: isLiveStream),
    ),
  );
}

class MeetingCreate extends StatefulWidget {
  const MeetingCreate({super.key, required this.isLiveStream});

  final bool isLiveStream;

  @override
  State<MeetingCreate> createState() => _MeetingCreateState();
}

class _MeetingCreateState extends State<MeetingCreate> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MeetingDetailBloc, MeetingDetailState>(
      listener: (context, state) {
        if (state is MeetingCreated) {
          context.loaderOverlay.hide();
          if  (state.meeting.isLiveStream) {
            navigateToLiveStream(context: context, meeting: state.meeting);
          }
          else {
            navigateToMeetingDetail(context: context, meeting: state.meeting);
          }
        }
        if (state is MeetingDetailFailure) {
          context.loaderOverlay.hide();
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
                  _MeetingSwitch(name: 'record', title: 'Record meeting'),
                  SizedBox(height: 15),
                  _MeetingSwitch(
                    name: 'share',
                    title: 'Share meeting as a post',
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton.tonal(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text('Schedule'),
                      SizedBox(width: 5),
                      Icon(Icons.access_time_rounded),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                FilledButton.tonal(
                  onPressed: _submitForm,
                  child: Row(
                    children: [
                      Text('Start'),
                      SizedBox(width: 10),
                      Icon(Icons.start_rounded),
                    ],
                  ),
                ),
              ],
            ),
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
          isLiveStream: widget.isLiveStream,
        ),
      );
      Future.delayed(Duration(seconds: 10), () {
        if (mounted) {
          context.loaderOverlay.show();
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
