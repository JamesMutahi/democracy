import 'package:democracy/app/utils/dialogs.dart';
import 'package:democracy/meet/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
                  : Center(child: ListenersRow(meeting: _meeting)),
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

class ListenersRow extends StatelessWidget {
  const ListenersRow({super.key, required this.meeting});

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ...meeting.recentListeners.map((user) {
              return Container(
                margin: EdgeInsets.only(
                  left: meeting.recentListeners.indexOf(user) * 15,
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).cardColor,
                  child: CircleAvatar(
                    radius: 13,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
        if (meeting.listeners > 0) SizedBox(width: 10),
        Text('${numberFormat.format(meeting.listeners)} listening'),
      ],
    );
  }
}
