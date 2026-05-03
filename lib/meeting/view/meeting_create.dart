import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/view/live_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

class MeetingCreate extends StatefulWidget {
  const MeetingCreate({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  State<MeetingCreate> createState() => _MeetingCreateState();
}

class _MeetingCreateState extends State<MeetingCreate> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MeetingDetailBloc, MeetingDetailState>(
      listener: (context, state) {
        if (state is MeetingCreated) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LiveStream(meeting: state.meeting),
            ),
          );
        }
      },
      child: LoaderOverlay(
        overlayWidgetBuilder: (_) {
          return LoaderOverlayLoading(progress: '');
        },
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Text('Live Stream'),
            actions: [
              OutlinedButton(onPressed: _submitForm, child: Text('Start')),
            ],
            actionsPadding: EdgeInsets.only(right: 15),
          ),
          body: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'title',
                    controller: widget.textEditingController,
                    decoration: InputDecoration(label: Text('Title')),
                    validator: FormBuilderValidators.required(
                      errorText: 'Title is required',
                    ),
                  ),
                  SizedBox(height: 15),
                  FormBuilderTextField(
                    initialValue: '',
                    name: 'description',
                    decoration: InputDecoration(label: Text('Description')),
                  ),
                ],
              ),
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
          isLiveStream: true,
        ),
      );
    }
  }
}
