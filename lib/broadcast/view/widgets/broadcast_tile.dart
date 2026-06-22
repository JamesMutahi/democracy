import 'package:democracy/app/shared/widgets/video_viewer.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/livestream_tile.dart';
import 'package:democracy/broadcast/view/widgets/meeting_tile.dart';
import 'package:flutter/material.dart';

class BroadcastTile extends StatelessWidget {
  const BroadcastTile({
    super.key,
    required this.broadcast,
    required this.isDependency,
  });

  final Broadcast broadcast;
  final bool isDependency;

  @override
  Widget build(BuildContext context) {
    if (broadcast.recordingStatus == RecordingStatus.stopped) {
      return broadcast.recordingUrl == null
          ? Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Icon(
                Icons.broken_image_rounded,
                size: 50,
                color: Colors.grey[600],
              ),
            )
          : VideoViewer(url: broadcast.recordingUrl!);
    }
    return switch (broadcast.type) {
      BroadcastType.meeting => MeetingTile(
        broadcast: broadcast,
        isDependency: isDependency,
      ),
      BroadcastType.livestream => LivestreamTile(broadcast: broadcast),
    };
  }
}
