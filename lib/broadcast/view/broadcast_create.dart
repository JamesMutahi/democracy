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
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLivestream = _type == BroadcastType.livestream;
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
        overlayWidgetBuilder: (_) {
          return LoaderOverlayLoading(progress: '');
        },
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Text(isLivestream ? 'Live Stream' : 'Meeting'),
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
                  if (_setStartTime && !isLivestream)
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
                  if (!isLivestream)
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
      context.read<BroadcastDetailBloc>().add(
        BroadcastDetailEvent.create(
          type: _type,
          title: formData['title'],
          description: formData['description'],
          startTime: formData['start time'],
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
