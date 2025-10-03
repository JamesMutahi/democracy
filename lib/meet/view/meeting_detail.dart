import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/meet/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeetingDetail extends StatefulWidget {
  const MeetingDetail({super.key, required this.meeting});

  final Meeting meeting;

  @override
  State<MeetingDetail> createState() => _MeetingDetailState();
}

class _MeetingDetailState extends State<MeetingDetail> {
  late Meeting _meeting = widget.meeting;
  bool isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MeetingDetailBloc, MeetingDetailState>(
      listener: (context, state) {
        switch (state) {
          case MeetingUpdated(:final meeting):
            if (meeting.id == _meeting.id) {
              setState(() {
                _meeting = meeting;
              });
            }
          case MeetingDeleted(:final meetingId):
            if (meetingId == _meeting.id) {
              setState(() {
                isDeleted = true;
              });
            }
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          showDialog(
            context: context,
            builder:
                (context) => ExitMeetingDialog(
                  onYesPressed: () {
                    context.read<MeetingDetailBloc>().add(
                      MeetingDetailEvent.leave(meeting: _meeting),
                    );
                    Navigator.pop(context);
                  },
                ),
          );
        },
        child: Scaffold(
          appBar: AppBar(title: Text('Meeting')),
          body:
              isDeleted || !_meeting.isActive
                  ? Center(child: Text('This meeting has been closed'))
                  : Placeholder(),
        ),
      ),
    );
  }
}

class ExitMeetingDialog extends StatelessWidget {
  const ExitMeetingDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Leave meeting',
      content: 'Are you sure you want to leave the meeting?',
      button1Text: 'Yes',
      onButton1Pressed: () {
        Navigator.pop(context);
        onYesPressed();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
      },
    );
  }
}
