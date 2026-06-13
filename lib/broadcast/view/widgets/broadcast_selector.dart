import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/livestream_tile.dart';
import 'package:democracy/broadcast/view/widgets/meeting_tile.dart';
import 'package:flutter/material.dart';

class BroadcastSelector extends StatelessWidget {
  const BroadcastSelector({
    super.key,
    required this.broadcast,
    required this.isDependency,
  });

  final Broadcast broadcast;
  final bool isDependency;

  @override
  Widget build(BuildContext context) {
    return switch (broadcast.type) {
      BroadcastType.meeting => MeetingTile(
        broadcast: broadcast,
        isDependency: isDependency,
      ),
      BroadcastType.livestream => LivestreamTile(broadcast: broadcast),
    };
  }
}
